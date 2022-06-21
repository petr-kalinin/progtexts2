.. highlight:: python

Additional data types and miscellaneous remarks
===============================================

Here I will give various additional comments on Python. Most of this information
is rather unnecessary for the simplest tasks, but more or less it
will be useful in the future. Basically, I'm going to discuss various 
data types that you haven't worked with very much before.

int
----
This is a common integer data type that you've already worked with a lot.
But it has one peculiarity to keep in mind — it is overflow.

Computer processors are able to work with integers only within a certain value range.
For modern processors, the maximum value with which the processor can work directly,
without various tricks, is :math:`2^{64}-1`, i.e. :math:`18\,446\,744\,073\,709\,551\,615`.
(Actually, from the processor's point, there are several different data types that differ by these maximum values.)

If you need to work with even bigger numbers, then most likely you'll have to work separately with each digit,
write the "columnar addition" (and not directly ask the processor to add two numbers), etc.
This is what is called "long arithmetic"; right now you don't need to get into it.

Python hides all these difficulties from you. Python int can store arbitrarily large numbers
(until you run out of RAM). Python sends small numbers directly to the processor, and with very large ones 
Python automatically switches to long arithmetic, and at first glance you will not notice anything at all.

But there is a problem: adding two small numbers is a single processor instruction,
and if you need to use long arithmetic, then you need to perform a lot more actions.
Therefore, while your numbers are not very large (roughly speaking, no more than :math:`2^{64}`,
although since there are also negative numbers, it is more likely to be approximately :math:`\pm2^{63}`,
and in 32-bit versions of Python it can be up to :math:`2^{32}` or approximately :math:`\pm2^{31}`), 
then all operations will be relatively fast. But as soon as your numbers become longer,
their processing in Python will get noticeably slower.

In regular tasks you'll hardly meet long numbers, but anything may happen. 
For example, in dynamic programming, in tasks for counting the number of objects
you can easily get very large numbers. Pay attention to this fact.

(The situation is even worse in other languages like C++ or Pascal. There will be no automatic switch 
to long arithmetic, and if the result of some operation goes beyond the limits supported
by the corresponding data type, then an overflow will actually occur, and the result
of the operation will most likely be completely different from what you expected.)

bool
----

Boolean (or logical) data type, named ``bool``, is exactly the type used in various conditions:
in ``if``, ``while`` and so on. For example, you can write ``if a > 0``, but may instead write this way::

    x = a > 0
    if x:
        ...

Here you compare ``a`` with zero, but do not immediately use the comparison result in ``if``, but save this result
to the variable ``x``. After that, in ``if`` you retrieve it from ``x`` and, depending on the value of ``x``,
either execute the body of ``if`` or not. This variable ``x`` will have the ``bool`` data type.

Certainly, such a comparison can only have one of the two results: either true (``a`` is greater than zero) 
or false (``a`` is not greater than zero). Accordingly, the ``bool`` type has only two values,
they are denoted as ``True`` and ``False`` (capitals are important here). They can also be used directly::

    x = True

but more often you'll use them in some kind of comparisons or other checks, as in the example above.

Of course, you can use ``and``, ``or`` and ``not`` here; in fact, ``and``, ``or`` and ``not`` are just operators
over the Boolean data type — Boolean (or logical) operators (similar to how there are arithmetic operators `+`, `-` and etc.,
and they work with a numeric data types). Accordingly, you can write
::

    x = (a > 0 or c == 0) and d < e
    y = not x
    if y and q < w:
        ...

and so on.

Probably you have already used so-called "flag variables" somewhere, in which you marked whether some condition is met. 
For example, if you need to check if a given array contains zero, you could write something like this::

    flag = 0
    for i in range(n):
        if a[i] == 0:
            flag = 1
    if flag == 1:
        print("yes")
    else:
        print("no")

Here it is more useful and common to use Boolean type here::

    flag = False
    for i in range(n):
        if a[i] == 0:
            flag = True
    if flag:
        print("yes")
    else:
        print("no")

I will remind and emphasize once again that the Boolean data type is exactly 
what is *directly* obtained with different checks (comparisons, etc.),
and what can be *directly* used in ``if``. For example, in the code above,
you do not need to write ``if flag == True:``. Just ``if flag:`` is enough,
as the variable ``flag`` has a Boolean type, so it can (and should) be used in ``if`` directly.

Accordingly, going back to the very first example in this section, do not write
::

    if a > 0:
        x = True
    else:
        x = False

The right notation is exactly such::

    x = a > 0

because result of the comparison exactly has Boolean type, and can be directly assigned to ``x``.

A more frequent case on the same topic: you may have a function that performs some check;
as an elementary example, let's say you need a function
that checks if the number is even. You may want to write it like this::

    def is_even(x):
        z = x % 2
        if z == 0:
            return True
        else:
            return False

But don't do it like that! This is way easier::

    def is_even(x):
        z = x % 2
        return z == 0

(or even just ``return x % 2 == 0``).

Because the result of the comparison ``z == 0`` is exactly 
either ``True`` or ``False``, as you need, so there is no reason to use an extra ``if``.

.. note::

    In fact, in ``if`` you can use not only just Boolean expressions.
    For example, even if your variable ``a`` stores an integer number, you can write ``if a:``.
    In Python, this means "if ``a`` is not zero". But I strongly advise you not to do this,
    because checking integers is actually quite not a natural operation. Indeed, let ``a`` be 42. 
    Then the notation ``if a:`` is equivalent to "if 42". So is 42 true or false? 
    Do you see that the question generally sounds weird? You can ask "if 42 is greater than 0"
    or something similar, but the question "if 42" does not make much sense.

    At the same time, there is no such problem for Boolean variables; they are used in ``if`` directly 
    and it's quite natural. If you have ``x`` equal to, for example, ``True``, then 
    the notation ``if x`` means "if true", which is purely logical: the true statement is true, 
    there is no such problem as with 42. Vice versa, here there's rather a tautology.

    The only case where it makes sense to use non-Boolean variables in a condition
    is when these variables also have a very clear Boolean meaning. I.e., if 
    comparing them to zero answers not just the question "is the variable equal to zero?",
    but has some special, comprehensible meaning. For example, if a variable ``a`` stores
    the number of some objects, then the check ``if a`` can be seen as "if these objects exist at all"
    (indeed, if ``a == 0``, then there are no objects, otherwise they exist), so such a check makes sense.

    An example of such a case is the problem about zeros in an array, which was discussed above. You can write like this::

        count = 0
        for i in range(n):
            if a[i] == 0:
                count += 1
        if count:
            print("yes")
        else:
            print("no")    

    Here the check ``if count`` is very clear: "if we found at least one zero".

    (In this particular case, it's better with a Boolean variable, because you don't need this amount by itself.
    But if you'd use the amount of zeros somewhere else later, or if you don't count it by yourself 
    but get it from somewhere, then it is quite natural to directly check the quantity in ``if``.)

    However, the simplest parity check is an example when it's *bad* to use integers in a condition. The check
    ::

        if z % 2:

    doesn't mean at all what you might think: it doesn't mean "if ``z`` is evenly divisible by 2",
    but "if ``z`` **is not** evenly divisible by 2" (i.e. "if the remainder is not zero").
    It's extremely easy to make a mistake and get confused here, so don't use this
    implicit comparison with zero until there is an unambiguous and obvious Boolean interpretation.

    And yes, of course, everything stated in this note is related to how to write a program,
    and not to what specifically Python allows you to do. Python will easily allow you to write
    ``if z %2:``, but this doesn't mean you should do so.

tuple
-----

Tuple type is almost the same as array, but it cannot be changed in any way. You create a set of values once,
then you can iterate over it, copy, etc., but no modification operations are available. At most you can create a new tuple.
A tuple is created in the same way as an array, but with round brackets instead of square brackets::

    a = (1, 10, 100)
    print(a[1])  # will print 10

At first, you won't really need tuples, as in the basic cases you can always use arrays instead.
But, for example, in dictionaries (see below) tuples can be used as indices, while arrays can't.

Arrays and the ``for`` loop
---------------------------

In the loops section, we discussed that you can iterate over the array elements 
by using the ``for i in range(len(a))`` loop. But if you only need values,
and the indices of the elements are unused, then you can simply write ``for i in a``.
Now the variable ``i`` will sequentially take all *values* stored in ``a``.
For example, this is how an array can be output to the screen::

    for i in a:
        print(i)

You can work this way with strings (iterate over all characters) and tuples.

Dictionaries (dict)
-------------------

Arrays, where elements are indexed by consecutive integers, starting from zero,
are already familiar to you. There is data structure which is at first glance
very similar: associative arrays. In Python they are called "dictionaries" (``dict`` type).
In the first approximation it's like an array in which elements can be addressed by almost anything.
First of all, we are interested in the ability to use arbitrary numbers 
(not necessarily in a row) and strings as dictionary indices.

Dictionaries are declared in this way::

    d = {}  # an empty dictionary. It has no elements.
    d[3] = 10  # we added one element to d, but its index is 3
    d[17] = 137  # now there are two elements with indices 3 and 17
    d["abc"] = 42  # now three elements with indices 3, 17 and "abc"
    
    # dictionary elements are accessed to just as array elements:
    print(d[3] + d[17])  
    d["abc"] = d["abc"] + 1

    # you may put in brackets any reasonable expression 
    print(d[4 - 1])
    print(d["ab" + "c"])
    s = input()
    d[s] = 10  # the obtained string will be the index

    # of course, values may contain anything
    d[10] = "qwe"  # a string
    d["abc"] = [1, 2, 3]  # an array
    d["qwe"] = {}  # even another dictionary, etc

    # you can also create a dictionary with some content:
    pairs = { 
        # index and corresponding vaue are separated by colon
        "(": ")",
        "[": "]",
        "{": "}"
    }
    print(pairs["("])  # will print )

(Of course, in a real programs, in each particular dictionary you'll usually have either
only numbers or only strings as indices. Python allows you to mix index types,
but generally you won't need it. Vice versa, it will mostly be inconvenient.)

When processing dictionaries, the commonly used term is "(dictionary) key" instead of "(array) index". 
For example, "assigning the value ``10`` to the dictionary ``d`` on the key ``3``" means ``d[3] = 10``.

.. note::
    In addition to numbers and strings, other data types can also be used as indices,
    but not all. Particularly, only types whose values are unchangeable can be used as indices.
    Namely, arrays or other dictionaries can't be indices, but tuples and Booleans can.

The main operation array operation is iterating over all elements,
usually done through ``for i in range(len(a))``. With dictionaries, it won't work just like that,
because dictionary elements are unordered. There are two ways here::

    for key in d:
        ... # key will iterate over all keys
        ... # do something with d[key]

or you can immediately iterate over the pairs (key, value)::

    for key, value in d.items():
        ... # key and value will represent essentially each key and corresponding value 

There are also some special operations. You can delete an element from a dictionary 
with the ``del`` statement, for example, ``del d[3]``, 
and check whether a certain key exists in a dictionary by a condition ``if 3 in d``.

Dictionaries are useful when you really need to use strings as indices
(for example, you are developing a compiler that needs to gather information about all variables),
or when the range of possible numeric values is very wide, but very few of them are actually used.
But don't use a dictionary when a common array is enough: arrays work faster, and in general,
if you need an array, the program with an array will be easier to read.
