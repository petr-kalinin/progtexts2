.. highlight:: python

Conditional body
----------------

«Body» of an any complex statement (yet you only know about ``if``) consists of other statements which will be executed inside it. You can put there any set of statements you wish. The only requierment is to write them with an indent so that Python interpreter would understand a part of ``if``-statement, not a resumption of the main program body.

Example::

    ...
    if a == 0:
        print("Zero")
        b = int(input())
        if b == 0:
            print("That's also zero!")
        print("-----")

Please note that you cat put an ``if``-statement inside of another ``if``-statement, and its body will accordingly need an additional indent 
Т.е. тут ``print("That's also zero!")`` will be executed only if ``b`` is also equal to zero but 
``print("-----")`` will run regardless of ``b`` value (but of course it needs ``a`` to be zero).

Once again, as it's stated in the previous section: Python, as any other programming language, is a constructor. Actually, programming is the assembly of a big program from small "bricks" which are statements. So you can use any of these bricks inside of the ``if``-statement.
