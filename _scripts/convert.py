#!/usr/bin/python3
import sys
import re
import os.path
import subprocess

def add_indent(text):
    if not text:
        return []
    text = text.split("\n")
    return ["    " + line for line in text]

def replace_task(match):
    result = ["", "", ".. task::"]
    if match.group(1):
        result += ["    :name: " + match.group(1)[1:]]
    result += [""]
    for i in range(2, 5):
        result += add_indent(match.group(i)) + ["    |"]
    result += ["", ""]
    return "\n".join(result)

with open(sys.argv[1], "r") as f:
    data = f.read()

replacements = [
    ("\"=", "-"),
    ("\"-", "-"),
    ("\"---", "—"),
    ("<<", "«"),
    (">>", "»"),
    ("\hm", ""),
    ("\header{", "\subsection{"),
    ("\lheader{", "\paragraph{"),
    ("\lheadernd{", "\paragraph{"),
    ("\\task", "||task")
]

for r in replacements:
    data = data.replace(*r)

tempfile = sys.argv[1] + ".tmp.tex" 
with open(tempfile, "w") as f:
    f.write(data)

basename, ext = os.path.splitext(sys.argv[1])
result_file = basename + ".rst"

subprocess.check_call(["pandoc", "-f", "latex", "-t", "rst", tempfile, "-o", result_file])

with open(result_file, "r") as f:
    data = f.read()

data = re.sub("\\\\\\|\\\\\\|task(n[^|]*)?\\\\\\|([^|]*)\\\\\\|\\s*\\\\\\|([^|]*)\\\\\\|\\s*\\\\\\|([^|]*)\\\\\\|", 
              replace_task, data)

with open(result_file, "w") as f:
    f.write(data)
