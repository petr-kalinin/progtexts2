
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


class taskref(nodes.General, nodes.Element):
    pass


FILES = {}


class TaskDirective(Directive):
    has_content = True
    option_spec = {'name': directives.unchanged}    

    def run(self):
        self.assert_has_content()
        env = self.state.document.settings.env

        # force always re-read all files with tasks
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

        if not hasattr(env, 'task_all_tasks'):
            env.task_all_tasks = []

        path = env.doc2path(env.docname)
        directory = os.path.dirname(path)
        if directory not in FILES:
            FILES[directory] = [open(directory + "/" + x + ".inc", "w") for x in ("all_tasks", "all_suggests", "all_answers")]
        for i in range(3):
            if res[i]:
                f = FILES[directory][i]
                f.write(".. taskref::\n")
                f.write("    :name: {}\n".format(name))
                f.write("    :targetid: {}\n".format(targetid))
                f.write("    :docname: {}\n".format(env.docname))
                f.write("\n    ")
                f.write("\n    ".join(res[i]))
                f.write("\n\n")
                f.flush()
        res_node = nodes.paragraph(rawsource="\n".join(res[0]))
        self.state.nested_parse(res[0], self.content_offset, res_node)
        res_node.children[0].insert(0, headernode)
        return [targetnode, res_node]


class TaskRefDirective(Directive):
    has_content = True
    option_spec = {'name': directives.unchanged,
                   'targetid': directives.unchanged,
                   'docname': directives.unchanged}

    def run(self):
        self.assert_has_content()
        env = self.state.document.settings.env
        name = self.options["name"]
        targetid = self.options["targetid"]
        docname = self.options["docname"]

        text_node = nodes.paragraph(rawsource="\n".join(self.content))
        self.state.nested_parse(self.content, self.content_offset, text_node)

        header_node = taskheader('')
        header_node.targetid = targetid
        header_node.name = name
        header_node.docname = docname

        ref_node = nodes.reference('', '')
        ref_node['refdocname'] = docname
        ref_node['refuri'] = env.app.builder.get_relative_uri(env.docname, docname)
        ref_node['refuri'] += '#' + targetid
        ref_node.append(header_node)

        text_node.children[0].insert(0, ref_node)

        return [text_node]


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
        key = "{}:{}".format(node.docname, node.targetid)
        if key not in env.idtolabel:
            doc = node.docname
            sec = env.toc_secnumbers[doc][''][0]
            env.tasklabels[sec].append({"docname": doc})
            label = "{}.{}".format(sec, len(env.tasklabels[sec]))
            env.idtolabel[key] = label
        else:
            label = env.idtolabel[key]

        text = "{} {}: ".format(node.name, label)
        name_node = nodes.strong(text, text)
        node.replace_self(name_node)


def setup(app):
    app.add_node(task)
    app.add_node(taskref)
    app.add_node(taskheader)

    app.add_directive('task', TaskDirective)
    app.add_directive('taskref', TaskRefDirective)
    app.connect('doctree-resolved', process_task_nodes)
    app.connect('env-purge-doc', purge_tasks)
