.. highlight:: python

Conditional statement (if)
=======================================

Basic syntax
-----------------

In programming, it's a typical case that you need to run a set of instructions only upon a certain condition. Python (and any other programming language, of course) has an appropriate instruction for this purpose. It is conditional statement, or just ``if``.

Example of such an instruction::

    if a == 137:
        print("Guessed!")

Here, it's implicit that a variable ``a`` exists, and the instruction works as follows:
if ``a`` is equal to 137, then the program will print "Guessed!" on the screen.

So, general structure of the statement is such::

    if condition:
        instructions

You type ``if``, then the condition (its content will be discussed a little later),
then colon (which is necessary), then, on the following line(s), the instructions upon the conditon,
that must be typed with an extra indent (spaces in the beginning).

Those instructions may consist of any Python statements you know or will learn later:
entering data via  ``input``, setting variables' values, printing data, other ``if``-statements, whatever you need
(detailed examples will be shown below).

For example, you can insert this construction into your program like this::

    a = int(input())
    if a == 137:
        print("Guessed!")
    print("Program terminated")

Here, number ``a`` is being input from keyboard, then checked if it's equal to 137, and if so, "Guessed!"
is printed on the screen . After that, regardless of ``a``'s value, "Program terminated" is printed.
Note that ``print("Guessed!")`` is typed with an indent, therefore it will be executed only if ``a==137``, but
``print("Program terminated")`` has no indent, as it's a part of the main program, not a part of ``if``.
No matter what is stored in ``a``, after the condition check (and if needed, executing instructions inside) the program will go on and print "Program terminated".

(Of course, type this code by yourself and try to change something. Generally, on all examlpes
given here and in other sections, write the code and explore it.)


Conditions
----------

Let's take a closer look at the content of the condition.

First, these can be simplest relational operations. You can take two arbitrary expressions compare them.
THe following operators are used for this:

- ``==`` used for equality check. Expression ``if a == 137`` means "if variable ``a`` is equal to 137". Note that here we have two equality symblos because single equality symbol is used for assignment, which cannot be used in ``if`` (and that would be quite senseless).
- ``>`` — greater than: ``if a > 137:`` means "if value of variable ``a`` is greater than 137".
- ``<`` — less than.
- ``>=`` — greater than or equal to. Note that it's typed in a similar way to how we spell it: "greater than or equal to", so it's ``>=``, not ``=>``.
- ``<=`` — less than or equal to. As the previous one, typed exactly like ``<=``, not ``=<``.
- ``!=`` — not equal.

On the left and on the right of the operator you can put any expressions.
These can be just numbers or variables, but can also be complex, such as following::

    if sqrt(a*b+10) >= abs(2*(3-c)) + 5:

Logical operators
--------------------

Second, you can combine several conditions in your ``if``.
E.g., if you need to check that ``a == 10`` **and** ``b == 20``, here you go::

    if a == 10 and b == 20:

The code under the condition will be executed only if **both** of given simple conditions
are true, i.e. only if ``a == 10`` and ``b == 20`` at the same time.


Python has folloing operators of this type ("logical operators", or "Boolean operators"):

- ``and`` — conjunction. Condition ``... and ...`` is true only if both of the expressions replaced by ``...`` are true.
- ``or`` — disjunction. Condition ``... or ...`` is true if at least one of the given expressions is true (and also if they're both true)
- ``not`` — negation. It is applied only to one expression (unlike the previous)  and inverts its meaning:
``not ...`` is true only when expression replaces by ``...`` is false.

Example::

    if a == 0 or not (b > 0 and c < 0):

will run if ``a`` is zero or if the expression "``b>0`` and ``c<0`` at the same time" is false. 

Not that here, brackets are used to specify the order of operations. If you'd type it without them: ``if a == 0 or not b > 0 and c < 0:``
it wouldn't be clear what ``not`` refers to and what is the order of ``and`` and ``or``. 

Here's a more distinct example for brackets. Compare the following::

    if a == 0 and (b == 0 or c == 0):

::

    if (a == 0 and b == 0) or c == 0:

These two expressions are different. E.g., a case when ``a==1``, ``b==1``, ``c==0`` fits the second condition, but not the first one.
Find out on your own why and also consider other cases when these conditions have different results. 

That's why in any complex logical expressions brackets are obligatory to set the order of operations.
Notation ``if a == 0 and b == 0 or c == 0`` is unclear. Of course, the computer will somehow choose a certain order,
but it's better to always set it explicitly.

Let's note that all samples above contained different variables and plain conditions specially to be simple.
Of course, you can apply Boolean operators to Boolean expressions of any kind, such as:: 

    if a + 24 < b * 3 or (sqrt(a + 2) > b + a and a > 3):

And finally, Boolean operators only work with Boolean expressions — relational operations or complex conditions that are
composed only of relations and Boolean operators. I.e., such a notation::

    if a or b == 0:

**doesn't** mean "if ``a`` is equal to zero or ``b`` is equal to zero", because on the left of ``or`` there's an ``a`` that is not a relation.
Structure ``if a:`` doesn't make any sense (imagine that value of ``a`` is ``40``. What does "if 40" mean in this case?
Not "if 40 is positive" but just "if 40"),
that's  why ``a or b == 0`` doesn't make sense also. And even if you'd try to use brackets: ``if (a or b) == 0``, this won't work as well
because it's absolutely unclear what ``40 or 30`` is equal to.

.. note::
    Actually, what's stated in the paragraph above isn't exactly true. Notation ``if a:`` in Python means "if ``a`` is not zero",
    so ``if a or b == 0`` means "if ``a`` is **not** zero or ``b`` is zero". But this is quite not that you could expect,
    so generally, it's better not to use this implicit zero-check at all except some special cases. If you want to check
    if a veriable is zero, do it explicitly: ``if a == 0`` and so on.


.. note::
    Notation ``if (a or b) == 0`` also makes sense indeed, but also not that you could expect. Let's explain details of this case.
    Python, as any other programming language, is quite formal and not alike human language, despite sometimes it may seem to be.
    In particular, all expressions, arithmetical or logical, are calculated in a certain order. For example, it's common that in
    arithmetic operations addition goes after multiplication. E.g. if you have an expression ``10 + 20 * 30``, you shuold first
    multiply ``20 * 30`` getting 600, and then summarise ``10 + 600``. Likewise, here ``(a or b) == 0`` is done this way:
    first calculate ``a or b`` and then check if the result is equal to zero. It's not a separate check of a being zero and b being zero
    as it may be expected for a natural language. 

.. note::
    Of course it's more accurate here to speak of the *logical (or Boolean) data type*. This is exactly what you get as a result of several
    relations and logical operations, and what you can put straight into ``if``. This is a date type that only can store two values, which
    in Python are ``True`` (the condition is true) and ``False`` (otherwise). For example, statement ``10 > 0`` is ``True``, and ``True and False`` is ``False``.
    And if you'd type::
    
        (10 > 0) and (8 > 10)
    
    Python interpreter does this: first, calculates ``10 > 0`` which is ``True``, then ``8 > 10`` which is ``False``, then combines
    ``True and False`` and gets ``False``, so this statement is false.
    
    But for basic comprehension of ``if``-statement it's not necessary.

..Уточнить, Boolean или logical!!!

Body of the conditional statement
---------------------------------

"Body" of any complex statement (yet now you only know about ``if``)
consists of other statements which are executed inside it. You can put there
any set of statements you wish. The only requierment is to write them with an indent
so that Python interpreter would understand them as a part of ``if``-statement,
not a resumption of the main program body.

Example::

    ...
    if a == 0:
        print("Zero")
        b = int(input())
        if b == 0:
            print("That's also zero!")
        print("-----")

Please note that you cat put an ``if``-statement inside another ``if``-statement,
and its body will accordingly need an additional indent. In this example,
``print("That's also zero!")`` will be executed only if ``b`` is also equal to zero
but ``print("-----")`` will run regardless of ``b`` value (but of course it needs ``a`` to be zero).

Once again, as stated in the previous section: Python, as any other programming language,
is a constructor. Actually, programming is the assembly of a big program from small "bricks"
which are statements. So you can use any of these bricks inside the ``if``-statement.

else и elif
-----------

All considered above can be called "short form" of ``if``. It only specifies the program's action if the condition is *true*
There's a full structure that specifies as well what to do if the condition is *false*::

    if a == 0:
        print("Zero")
    else:
        print("Not zero")

The part "what to do if the condition is false" begins with ``else:`` (with colon!) and must have the same indent as the corresponding ``if``.
On the following lines you can type any instructions you wish, like under ``if``, with an extra indent.

Example::

    if a == 0:
        if b == 0:
            print("Two zeros")
        else:
            print("Only b is not zero")
    else:
        if b == 0:
            print("Only a is not zero")
        else:
            print("Both variables are non-zero")

Clearly, ``else`` doesn't accept any other conditions. Python will execute code under it anyway upon the condition of corresponding ``if`` is false.
Sometimes you need to check another condition when the first one fails. Of course, you can type it like this::

    if a < 0:
        print("Negative")
    else:
        if a == 0:
            print("Zero")
        else:
            print("Positive")

But it's a bit long and nested, and if there are many options, the indent will become naturally wide. To avoid this, there's a special structure
``elif`` which actually means ``else if``. It's used like this::

    if a < 0:
        print("Negative")
    elif a == 0:
        print("Zero")
    else:
        print("Positive")

This piece of code is absolutely equivalent to the previous one but it's shorter and, more important, has no unnecessary staired indents.
Once again, ``elif`` is no more than an abbreviation for ``else if`` that makes your code easier to read.

One more sample::

    if d = "North":
        print("Facing north")
    elif d == "South":
        print("Facing south")
    elif d == "West":
        print("Facing west")
    elif d == "East":
        print("Facing east")
    else:
        print("??!!")

The same could be implemented via regular ``else``/``if`` but the indents would be quite ugly.

Sample problems and solutions
-----------------------------

Here are a few sample problems similar to ones you may come across on contests and in my course.

.. task::

    Air conditioning system turns on if the temperature in the room is above 20 degrees. If the temperature is equal or below 20 degrees,
    the system turns off [1]_. Write a program that defines the status of the AC system.
    
    **Input**: An only integer number — the current room temperature.

    **Output**: Print ``on`` if the AC will turn on and ``off`` if it'll turn off.

    **Example**:

    Input::

        22

    Output::

        on
    |
    |
    |

Here you need to read one number, compare it with 20 and, depending on the result, write one of the two lines::

    n = int(input())
    if n > 20:
        print("on")
    else:
        print("off")

.. task::
    A new model of air conditioning system takes into account the level of humidity in the room. Because of the humidity rise upon cooling, the system
    will not turn on if the relative humidity is above 80%.

    Moreover, in this system the required temperature can be set remotely. So if the user set :math:`T` degrees on remote control, the air conditioner
    turns on when the temperature in the room is above :math:`T` and the humidity is not higher than 80%.
    If any of these conditions isn't met, the air conditioner turns off.
    
    **Input**: The only line contains three numbers: temperature set by user (:math:`T`), current temperature in the room and humidity. Temperatures are given in degrees and the humidity in percentage.

    **Output**:  Print ``on`` if the AC will turn on and ``off`` if it'll turn off.

    **Example**:

    Input::

        20 22 60

    Output::

        on
    |
    |
    |

Now the condition is a bit more sophisiticated: if the temperature is above given and the humidity is not, the system turns on, otherwise it's off::

    t0, t1, h = map(int input().split())
    if t1 > t0 and h <= 80:
        print("on")
    else:
        print("off")

Here you need to point where the condition is strict ("greater than" or "greater than or equal to", same with "less than").
 problem it's said that AC turns on if the temperature is **strictly above** given (exactly "greater than", not "greater than or equal to")
 and the humidity is **not higher** than 80% (so it's "less than or equal to", not just "less than").

.. task::
    In Masha's room there's a simple air conditioner. It turns on if the temperature in the room is above 20 degrees. If it's equal or below 20 degrees,
    it turns off. Masha wants to cool the room, but she's smart and realizes that if the outside temperature is lower than inside,
    she just needs to open the window. Write a program that defines what Masha should do.

    **Input**: The first line consists of an only number — the temperature in the room.
    The second line also consists of an only number — the temperature outside.

    **Output**: Print ``ac on`` if Masha should turn on the AC and it will turn, ``ac off`` if Masha should try to turn on the AC *but it won't*
    and ``open window`` if she may just open the window.

    **Example**:

    Input::

        22
        10

    Output:

    .. code-block:: text

        open window

    Input::

        18
        20

    Output::

        ac off
    |
    |
    |

Of course, first you need to input two numbers::

    t_in = int(input())
    t_out = int(input())

After that (as in many other problems) there are several solutions. For example, you may begin with a condition which defines if the AC should be turn on:
``if t_in <= t_out`` and inside that find out if it'll really turn or not. Full source code might look like this::

    t_in = int(input())
    t_out = int(input())
    if t_in <= t_out:
        if t_in > 20:
            print("ac on")
        else:
            print("ac off")
    else:
        print("open window")

But it's possible to get rid of nested ``if``-statements via the opposite check: isn't Masha better open the window?
::
    t_in = int(input())
    t_out = int(input())
    if t_in > t_out:
        print("open window")
    elif t_in > 20:
        print("ac on")
    else:
        print("ac off")

.. task::
    On a PE lesson the teacher (?)
    На уроке физкультуры тренер говорит «на первый-второй рассчитайтесь». Вася стоит :math:`N`-ым по счету. Что он скажет, «первый» или «второй»?

    **Input**: The first line contains the only number :math:`N`.

    **Output**: Выведите строку ``first``, если Вася скажет «первый», и ``second``, если «второй».

    **Example**:

    Input::

        3

    Output:

    .. code-block:: text

        first
    |
    |
    |

Obviously, the answer depends on :math:`N` being odd or even. This can be checked by taking it's remainder when divided by 2 (modulo operator)::

    n = int(input())
    if n % 2 == 1:
        print("first")
    else:
        print("second")


.. [1] Of course, real air conditioners work differently. They have separated thresholds for turning on and off (it's called hysteresis).
