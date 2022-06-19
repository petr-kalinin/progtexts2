.. highlight:: python

File input and output
=====================

On some contests, as well as in many other situations, you may need
to input data not from keyboard, but from a file,
and output data to a file, not to the abstract "screen".

(For this, of course, you should know the names of these files. They are usually specified 
in the tasks. On the algoprog, the file names are almost always these:
``input.txt`` for input data and ``output.txt`` for the output.)

In many programming languages, data input from/output to files is very similar 
to keyboard input/output — the instructions are the same, and parameters are just 
slightly different. Unfortunately, in Python the differences are more significant.

File input
----------

Inputting analogous to standard ``input``
`````````````````````````````````````````

To read data from a file, you first need to "open the file for reading".
This is done by the following instruction::

    f = open("input.txt", "r")

Here ``input.txt`` is exactly the file from which you need to read the data, 
and the parameter ``"r"`` stands for "**r**\ead", so it indicates that you are going 
to read the data, not to write (then you should use ``"w"`` instead, see this below).

Then you can work with the received object ``f``. The simplest operation is
``f.readline()``, which returns the next line of the file.
This is a complete analog of ``input()``, except for that at the end
of the received string there will be a special line break character ``"\n"``
(when the line is output to the screen, it will not be visible, 
but will break the line and start a new one). Highly likely it will bother you, 
but you can easily remove it using the ``.rstrip("\n")`` method,
for example, ``f.readline().rstrip("\n")``.

Here's an example. Let there be two numbers in the input file, one per line.
From the keyboard you would read it like this::

    a = int(input())
    b = int(input())

Then the input from the file is done as follows::

    f = open("input.txt", "r")
    a = int(f.readline().rstrip("\n"))
    b = int(f.readline().rstrip("\n"))

The case with two numbers on the same line is quite similar.
When reading from the keyboard, it's like this::

    a, b = map(int, input().split())

And from the file like this::

    f = open("input.txt", "r")
    a, b = map(int, f.readline().rstrip("\n").split())

A more complex example: let's assume we need first the number ``N``, 
and then ``N`` lines of one number in each. From the keyboard::

    n = int(input())
    for i in range(n):
        x = int(input())
        ...     # processing x

From the file::

    f = open("input.txt", "r")
    n = int(f.readline().rstrip("\n"))
    for i in range(n):
        x = int(f.readline().rstrip("\n"))
        ...     # processing x

Reading the file to the end
```````````````````````````

Until the file ends, the ``readline`` function will always return
*a non-empty* string (it will contain at least the line break character ``"\n"``).
As soon as the file ends, ``readline`` will return an empty string.
Therefore, you can read the file to the end like this::

    f = open("input.txt", "r")
    while True:
        s = f.readline()
        if s == "":
            break
        # processing s; particularly, may start with "s = s.rstrip("\n")"

There's an alternative way — you can read the file entirely
at once and put it into an array of strings::

    data = open("input.txt", "r").readlines()

Now ``data`` is an array of strings. Each element of it contains 
a corresponding line of the input file. For example, 
if the content of that file is as follows::

    1 2 3
    4 5 6
    some text

then ``data`` will be an array looking just like this:
``["1 2 3\n", "4 5 6\n", "some text\n"]``, 
and thereafter you may process it as you wish.

You can also use this method: ``open("input.txt ", "r").read()``.
It reads the entire file and puts it into one big string
(and there may be line break characters in the middle of this string,
but it will still be one big string, not an array of strings).

File output
-----------

To save your data to a file, you should open it for output::

    f = open("output.txt", "w")

here, ``"w"`` means "**w**\rite". Ater that, you can use ``f``
as an optional argument of a common ``print`` function::

    print(a, b, file=f)
    
After the overall end of the output, it's recommended to call ``f.close()``
so that the data will actually be written to the disk
(although in most cases everything works without it).

How to use it on contests?
--------------------------

The main advantage of inputting from files when solving algorithmic problems
(on the contests, here on algoprog, etc.) is that you do not have
to re-enter the entire test every time. If you are debugging your program 
on some test, figuring out why it doesn't work, trying to fix errors,
you'll definitely need to run the program many times on the same test.
It is difficult and takes time to enter it manually every time. It's much easier 
to save it to a file once, and then organize the input from that file.

The second reason to use file input is that you can "juggle" tests much more easily.
You can write several tests to an auxiliary file, and simply
copy the desired test to the input file. Moreover, in most cases
you can even store a lot of tests just in your input file.

Namely, in many tasks you don't have to read data to the end of the file.
For example, you need read only two numbers, or only one line, or you
are given the number ``N`` and then ``N`` more numbers — in all these cases,
the program doesn't care what comes after this data. You can store
other tests there, and then, upon you need a certain test, just move it
to the beginning of the file.

(In general, you can even write your program in such a way so that it processes
all the tests that the input file contains — this is the so-called *multitest*.
There will be only one test at once in the testing system, and the program 
will run on it, and during your testing, your program will immediately run on many tests.
And yet, there are tasks where there is a multitest in the input data, 
i.e. many tests are set at once. Then especially you can debug on many tests at once.)

And well, in :ref:`stress testing <stresstesting>` the input from the file will also be more convenient.
