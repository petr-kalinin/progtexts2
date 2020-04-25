
from collections import defaultdict
from docutils import nodes
from docutils.parsers.rst import Directive
from docutils.parsers.rst import directives
import os.path

from sphinx.locale import _


class taskheader(nodes.General, nodes.Element):
    pass


class task(nodes.Admonition, nodes.Element):
    pass


class tasklist(nodes.General, nodes.Element):
    pass


class suggestlist(nodes.General, nodes.Element):
    pass


class answerlist(nodes.General, nodes.Element):
    pass


class TaskListDirective(Directive):
    def run(self):
        return [tasklist('')]


class SuggestListDirective(Directive):
    def run(self):
        return [suggestlist('')]


class AnswerListDirective(Directive):
    def run(self):
        return [answerlist('')]


class TaskDirective(Directive):
    has_content = True
    option_spec = {'name': directives.unchanged}    

    def run(self):
        self.assert_has_content()
        env = self.state.document.settings.env

        # dirty hack to force re-run process_task_nodes on this document on next build
        env.note_reread()

        targetid = 'task-{}'.format(env.new_serialno('task'))
        targetnode = nodes.target('', '', ids=[targetid])

        name = "Задача"
        if "name" in self.options:
            name = self.options["name"]
        headernode = taskheader('')
        headernode.targetid = targetid
        headernode.name = name
        headernode.docname = env.docname

        content = self.content
        state = 0
        last_idx = -1
        res = [[], [], []]
        for idx, line in enumerate(self.content):
            if line.strip() == "|":
                if last_idx+1 < idx:
                    res[state] = content[last_idx+1:idx]
                else:
                    res[state] =  None
                state += 1
                last_idx = idx

        res_node = [None] * 3
        for i in range(3):
            if res[i]:
                res_node[i] = nodes.paragraph(rawsource="\n".join(res[i]))
                self.state.nested_parse(res[i], self.content_offset, res_node[i])
            else:
                res_node[i] = None

        if not hasattr(env, 'task_all_tasks'):
            env.task_all_tasks = []

        env.task_all_tasks.append({
            'docname': env.docname,
            'lineno': self.lineno,
            'target': targetnode,
            'task': res_node[0],
            'suggest': res_node[1],
            'answer': res_node[2],
            'name': name
        })
        res_node[0].children[0].insert(0, headernode)
        return [targetnode] + [r for r in res_node if r]


def purge_tasks(app, env, docname):
    if not hasattr(env, 'task_all_tasks'):
        return
    env.task_all_tasks = [task for task in env.task_all_tasks
                          if task['docname'] != docname]
    
    if not hasattr(env, "tasklabels"):
        env.tasklabels = defaultdict(list)
    for key in env.tasklabels:
        env.tasklabels[key] = [l for l in env.tasklabels[key] if l["docname"] != docname]

    if not hasattr(env, "idtolabel"):
        env.idtolabel = {}
    for key in env.idtolabel:
        if key.startswith(docname):
            del env.idtolabel[key]

def process_task_nodes(app, doctree, fromdocname):
    env = app.builder.env

    if not hasattr(env, 'task_all_tasks'):
        env.task_all_tasks = []

    if not hasattr(env, "tasklabels"):
        env.tasklabels = defaultdict(list)
    if not hasattr(env, "idtolabel"):
        env.idtolabel = {}

    for node in doctree.traverse(taskheader):
        doc = node.docname
        sec = env.toc_secnumbers[doc][''][0]        
        env.tasklabels[sec].append({"docname": doc})
        label = "{}.{}".format(sec, len(env.tasklabels[sec]))
        env.idtolabel[doc + ":" + node.targetid] = label
        text = "{} {}: ".format(node.name, label)
        name_node = nodes.strong(text, text)
        node.replace_self(name_node)

    directory = os.path.dirname(fromdocname)

    for clas in [tasklist, suggestlist, answerlist]:
        for node in doctree.traverse(clas):
            content = []

            for task_info in env.task_all_tasks:
                docname = task_info['docname']
                if not docname.startswith(directory + "/"):
                    continue
                text_node = None
                if (clas is tasklist):
                    text_node = task_info['task']
                elif (clas is suggestlist):
                    text_node = task_info['suggest']
                else:
                    text_node = task_info['answer']
                if not text_node or not text_node.children:
                    continue

                label = env.idtolabel[docname + ":" + task_info["target"]["refid"]]
                header = "{} {}: ".format(task_info["name"], label)
                header_node = nodes.strong(header, header)

                ref_node = nodes.reference('', '')
                ref_node['refdocname'] = task_info['docname']
                ref_node['refuri'] = app.builder.get_relative_uri(
                    fromdocname, task_info['docname'])
                ref_node['refuri'] += '#' + task_info['target']['refid']
                ref_node.append(header_node)

                text_node.children[0].insert(0, ref_node)
                content += text_node

            node.replace_self(content)


def setup(app):
    app.add_node(tasklist)
    app.add_node(suggestlist)
    app.add_node(answerlist)
    app.add_node(taskheader)
    app.add_node(task)

    app.add_directive('task', TaskDirective)
    app.add_directive('tasklist', TaskListDirective)
    app.add_directive('suggestlist', SuggestListDirective)
    app.add_directive('answerlist', AnswerListDirective)
    app.connect('doctree-resolved', process_task_nodes)
    app.connect('env-purge-doc', purge_tasks)
