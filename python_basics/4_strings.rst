.. highlight:: python

Characters and strings
======================

So far, our programs were only processing numbers. But many
programs work with text data. And there are two main 
data types designed for this — *characters* and *strings*.

Character data type
-------------------

In Python, to save a character to
a variable, you may type
::

    ch1 = "a"
    ch2 = "$"

and so on. As a result, in ``ch1`` will be stored
the character ``a`` and in ``ch2`` — ``$`` accordingly.

You can read characters via a common ``input()`` statement:
::

    ch = input()

(yes, just like this!), and print via common ``print``:
::

    print(ch)

(In fact, in Python there is no separate "data type" for characters,
a character in Python is just a string of length 1,
strings  will be discussed below. But it is often useful
to think about characters apart from strings.)

Character codes
---------------

In fact, of course, characters are not stored in the computer's memory
(i.e. if we typed ``ch="$"``, there won't be *a dollar sign drawn* anywhere in memory). 
The computer is able only to work with numbers. And instead of symbols it also stores numbers.

There is a general arrangement that matches each number from 0 to 255
to a certain symbol. More precisely, there are several such agreements. 
They are called *character encodings*, but for Latin letters, numbers
and frequently used symbols such as dollar sign, comma or plus, 
the corresponding numbers are the same in all encodings.
For Russian letters, for example, this is not true: in different encodings 
they  have different numbers associated.

.. _ascii_table:

This is the conventional encoding for Latin letters, numbers and
frequently used characters. It is called ASCII (abbreviated from 
"American Standard Code for Information Interchange"), sometimes 
referred to as *ASCII table*. The main part of the table looks like this:

=====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======
  32   |space|        48    ``0``         64    ``@``         80    ``P``         96    |back|       112    ``p``       
  33    ``!``         49    ``1``         65    ``A``         81    ``Q``         97    ``a``        113    ``q``       
  34    ``"``         50    ``2``         66    ``B``         82    ``R``         98    ``b``        114    ``r``       
  35    ``#``         51    ``3``         67    ``C``         83    ``S``         99    ``c``        115    ``s``       
  36    ``$``         52    ``4``         68    ``D``         84    ``T``        100    ``d``        116    ``t``       
  37    ``%``         53    ``5``         69    ``E``         85    ``U``        101    ``e``        117    ``u``       
  38    ``&``         54    ``6``         70    ``F``         86    ``V``        102    ``f``        118    ``v``       
  39    ``'``         55    ``7``         71    ``G``         87    ``W``        103    ``g``        119    ``w``       
  40    ``(``         56    ``8``         72    ``H``         88    ``X``        104    ``h``        120    ``x``       
  41    ``)``         57    ``9``         73    ``I``         89    ``Y``        105    ``i``        121    ``y``       
  42    ``*``         58    ``:``         74    ``J``         90    ``Z``        106    ``j``        122    ``z``       
  43    ``+``         59    ``;``         75    ``K``         91    ``[``        107    ``k``        123    ``{``       
  44    ``,``         60    ``<``         76    ``L``         92    ``\``        108    ``l``        124    ``|``       
  45    ``-``         61    ``=``         77    ``M``         93    ``]``        109    ``m``        125    ``}``       
  46    ``.``         62    ``>``         78    ``N``         94    ``^``        110    ``n``        126    ``~``       
  47    ``/``         63    ``?``         79    ``O``         95    ``_``        111    ``o``        127    —       
=====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======  ==  =====  =======

Here, the #32 is the space character (blank spot " ").

Characters enumerated from #0 to #31 are the so-called *control codes* 
which aren't really interesting to us yet (as well as the character #127),
that'swhy they aren't shown in the table. Characters with codes greater 
than #128 depend on the encoding, we will not discuss this now.
(See more in the :ref:`encodings section<encodings>`, but you won't need it yet.)

.. |space| raw:: html

    <code class="docutils literal notranslate"><span class="pre"> </span></code>

.. |back| raw:: html

    <code class="docutils literal notranslate"><span class="pre">&#96;</span></code>

For example, the dollar sign has number (the common term is *code*) 36,
and the capital letter ``N`` — code 78.



Note that all digits go in a row, all capital letters go
in a row, and all small letters go in a row. It's very useful.
(This is not always true for Russian letters.)

In Python, you can get the code of the character using the ``ord`` operation,
and get the symbol by specifying the code using the ``chr`` operation. For example::

    ch = input()         # read a character...
    print(ord(ch))       # and print its code

    i = ord('$')         # assign the code of the dollar sign to i
    print(i)

    i = int(input())     # read the code...
    print(chr(i))        # and print the corresponding character

    ch = chr(ord('$') + 1)
    print(ch)            # print the character next to the dollar sign in the table

In most cases, you won't need to know the exact character codes — you
can always calculate them through ``ord`` if you need. For example, let's suppose 
we know that the value of the variable ``ch`` is a digit
(i.e. a character representing a numerical digit) — how to save this digit 
into the variable ``i`` as a number (i.e. 0, 1, 2, ..., or 9)?
I.e. how to convert a digit-symbol into a number?

We'll use the fact that all digits go in a row. Therefore, it is enough
to subtract the code of zero from the code of the given digit::

    i = ord(ch) - ord('0')

Note that we don't need to know that the code of zero is 48. We just type 
``ord('0')``, not 48, and the computer will calculate the code for us!

Comparing characters
--------------------

Characters can be compared using common operators: =, >, <, >=, <=. 
In fact, just their codes are being compared::

    if ch1 == ch2:  # if two characters are the same
        ....
    if ch1>ch2:  # if the code of the 1st character is greater than the code of the 2nd
        ....

Due to the fact that the symbols of same type go in a row, it's very easy 
to check the type of symbol. For example, you can check 
if the character is a digit by this::

    if ch>='0' and ch<='9': 
        ... 

Arrays and loops
----------------

If you need to use an array with elements
representing something related to characters,
then you need should work with codes::

    a = [0] * 256  # there are 256 characters in total
    a[ord('d')] = 10  # save value 10 to the element associated with character 'd'
    ...
    for x in range(ord('a'), ord('z')+1):
        ch = chr(x)
        print(ch)  # print all characters from 'a' to 'z'

But in fact it's an advanced topic which isn't essential now.

Strings
-------

A string is a sequence of characters. So it seems natural
to use an array of characters for processing a string::

    s = ["T", "e", "s", "t"]
    # You souldn't do this!


But don't do it in this way! To put a string into a variable,
you just should assign a string to that variable:: 

    s = "Test"

In Python, a string actually *is an array*, and each element
of this array is a character. But it's not a common array, but
an array with extra features.

The same as with arrays, you can get the string length via ``len(s)``::

    print(len(s))

Of course, you can input and output strings. In Python,
it's done with standard operations: 
output via the common ``print``, input via the common ``input()``.
You don't need any extra conversion. Just type ``s = input()``:: 

    s = input()
    print(s)

Next, you can "add" strings to each other. This is actually 
called *concatenation* and means
appending the second string to the end of the first one::

    s1 = input()
    s2 = input()
    s = s1 + s2
    print(s)  # will output both strings seamlessly in one line

You can also add characters to the string::

    s = s + 'A'

Finally *string literals* are just common sequences of characters
enclosed in quotes::

    s = "Test"
    s = s + '2'
    print(s)  # will output Test2

In fact, in Python you can use both apostrophes (``'``)
and quotation marks (``"``). But of course, if you started your string
using, for example, an apostrophe, end it with an apostrophe accordingly,
or the interpreter won't understand your code.

Here you may ask a question on how to enter an apostrophe 
or quotation mark in a string literal. Just typing 
``'It's a string'`` won't work, as Python will think that 
the string ends on the second apostrophe; ``"Text"Text"`` won't work as well
for the same reason. Therefore, it is necessary to type the character ``\`` 
(backslash) before the apostrophe or quotation mark.
For example, to assign a string ``It's a string`` to a variable, you need
to do it like this::

    s = 'It\'s a string'
    # or like this
    s = "It's a string"
    # and if you need both apostrophes and qoutes:
    s = "It's a \"string\""

Similarly, assiging the character "apostrophe" or "quotation mark"
to a character variable is done via one of the following::

    ch = '\''
    ch = "'"
    ch = "\""
    ch = '"'

As the character ``\`` has this special meaning,
to write it to the string you should type it twice::

    s = "test\\test\\\\test"

this will result in ``test\test\\test``.

Another special example of a string literal is an *empty* string,
i.e. a string of zero length::

    s = ""

And finally, as your string is an array of characters, you can 
use all known array operations (``s[i]`` to access the character
number ``i`` and etc.). For example, let's check if there are
any spaces in the string::

    for i in range(len(s)):
        if s[i] == ' ':
            ...

int, float and str
------------------

There are three more useful instructions::

    int
    float
    str

They convert numbers to strings and vice versa.
And ``int`` is the one you've already used.

::

    print(str(23) + 'abc' + str(45));     # outputs 23abc45
    print(float('2.5') * 2);              # outputs 5.0
    print(str(2.5) + 'a');                # outputs 2.5a

Other operations
----------------

You already know several tricky array operations and sometimes
you may wish to use them with strings. It is better not to use them 
until you understand exactly not only how, but also how fast they work. 
In most cases, you can do without them (and it will even be easier!),
moreover, you don't know how much time their work will take.

Futhermore, there are other operations specific for strings that you
can learn somewhere else, like ``find``.
I don't recommend using them until you understand exactly 
how they work and how fast.

For example, let's suppose you need to remove all spaces from the string.
You can write something like this (assuming that you already have
the original string ``s``)::

    while s.find(" ") != -1:
        s = s[:s.find(" ")] + s[s.find(" ")+1:]  # cutting out this character

But it works way slower (just believe me :) ) and requires you to remember all
these operations, and also to think of the code that isn't really trivial.
This way is easier::

    s1 = '';
    for i in range(len(s)):
        if s[i] != ' ':
            s1 = s1 + s[i]; 

The result is in ``s1``. Understand how it works.

Sample problems and solutions
-----------------------------

Here are a few sample problems similar to those 
you may come across on contests and in my course.

.. task::

    A single character is given. Determine if it is a small Latin letter.

    **Input**: One character.

    **Output**: Print ``yes`` if the entered character is a small Latin letter, or ``no`` otherwise.

    **Example**:

    Input::

        t

    Output::

        yes
    |
    |
    |

Let's input a character::

    ch = input()

Next, we need to check whether this character is a small Latin letter.
Here (and in other similar examples) we may take advantage of the fact that 
the same-type characters in the ASCII table go in a row. Therefore, 
it is enough to check if ``'a' <= ch and ch <='z"``. The whole code::

    ch = input()
    if 'a' <= ch and ch <='z':
        print('yes')
    else:
        print('no')

.. task::

    A digit is given. Input it as a character and convert into a number
    (``int``) without using standard ``int`` statement.

    **Input**: A single character which is a digit.

    **Output**: Print a number.

    **Example**:

    Input::

        1

    Output::

        1
    |
    |
    |

Of course, in this one you can pass all the tests just 
by printing exaclty the same that was input. But let's 
fairly learn how to transform a digit character to a number.
So, input a character::

    ch = input()

and then we need to figure out what digit it represents. 
As all the digits in the ASCII table go in a row, 
it's enough to subtract the code of zero from the code of our character.
As a result, we get
::

    ch = input()
    print(ord(ch) - ord('0'))

.. task::

    A string is given. Count the number of small Latin letters in it.
    
    **Input**: One string.

    **Output**: Print one number — the answer.

    **Example**:

    Input::

        foo bar 123

    Output::

        6
    |
    |
    |

First, just input a string::

    s = input()

Then, we need to interate over this string::

    for i in range(len(s)):

and for the current character (:math:`s[i]`) check whether 
it's a letter or not. We already know how to perform this check:
``if s[i] >= 'a' and s[i] <= 'z'``. If it is a letter, then we should
increase the counter by one. We also should create this counter in advance.
So, the code will look like this::

    s = input()
    ans = 0
    for i in range(len(s)):
        if s[i] >= 'a' and s[i] <= 'z':
            ans += 1
    print(ans)
