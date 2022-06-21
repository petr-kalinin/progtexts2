.. highlight:: python

.. _pythonBasicsFloat:

Floating-point numbers
======================

Real numbers include, roughly speaking, both integers and
fractions. Floating-point numbers are kind of 
"approximation for real numbers" used in computers.
Of course, they often appear in tasks, 
but operating with them arises serious problems which
typically are not described in a common programming book.

In fact, this topic is unexpectedly complicated. Try to understand
everything that is written in this section, but if you don't understand 
something at first, it's okay. The main thing is two rules for working 
with floating-point numbers, which will be given below.

Floating-point notation
-----------------------

You certainly know that real numbers can be written such as "12.34".
This means "twelve and thirty-four hundredths".

.. note ::
   Sometimes a comma is used instead of a point (it depends on the country).
   But in programming the point is the most common decimal separator.
   Generally, in the context of denoting floating-point numbers,
   words "point" and "comma" are synonyms.

But there is also another notation for real numbers — it's called "floating point format".
(In theory, this should be explained at school somewhere in the 8th grade, so
I describe it here primarily for secondary school students and as well for those
who have managed to forget; and also to clearly define the terms "mantissa" and "exponent".)

Notation of floating-point numbers looks is as follows: 1.234e1.
It consists of two parts separated by the English letter ``e`` (may be
either small or capital letter, although now it seems that small one is more common).
This means: "take the number 1.234 and move the decimal point in it by 1 position to the right" —
so, you'll get 12.34. As well it may be written as 0.1234e2 — here we need to take 0.1234 
and move the point by two digits to the right, and get the same 12.34.
The number after ``e`` may be zero — this obviously means you don't need to move the point:
12.34e0 is the same as 12.34. The number may also be negative — this means that the point
should be moved to the left instead: 123.4e-1 or 1234e-2 is still the same as 12.34.
(Note here that the notation 1234e-2 has no point at all — it's implied
to be at the end of number 1234, as we know that 1234 and 1234.0 are the same.)

Once again: 0.1234e2, 1.234e1, 12.34e0, 12.34, 123.4e-1, 1234e-2 and even 123400e-4 
and 0.001234e4 are just ways to write down one number 12.34.
The notations look diffrerent, the number is the same.

So, the same number can be written in different ways. Which one to choose?
The most common is either the one where there's only one non-zero digit before
the point (1.234e1) or the one where before the point there's zero, but
the next digit after the point is not zero (0.1234e2). But in general,
any of the examples used above is correct, and there are also plenty of 
correct notations which weren't specified above.

Some more examples: 1.3703599907444e2 and 13703599907444e-11 are exactly equal to 137.03599907444.

Negative numbers, of course, are written with minus before the number itself:
-1.234e1 or -1234e-2 is the same as -12.34.

.. note ::
   Sometimes, especially in printed books (and before the advent of computers — quite often),
   instead of using ``e``, an equivalent notation is used which includes multiplication
   by 10 raised to a certain power. For example, instead of 0.1234e2 it is written as :math:`0.1234\cdot 10^2`,
   instead of 123.4e1 it is :math:`1.234\cdot 10^{-1}` and so on. It's easy to see that
   these notations are completely equivalent, and that multiplication by ten raised to a power
   is completely equivalent to shifting the point. In fact, as far as I understand, the notation with ``e``
   appeared just when computers appeared, because it's quite complicated, and sometimes impossible,
   to type power (superscript) on the keyboard. But now, thanks to ubiquity of the computers,
   the notation with ``e`` is already often used even in printed literature.
   
Floating-point notation is quite convenient when you need to operate with extremely huge or
extremely small numbers. For example, the distance between the Earth and the Sun is about 
147 million kilometers, i.e. 147000000000 meters. It is very inconvenient to write this way,
because you have to carefully count the zeros. It is much easier to write 147e9 — 
it immediately becomes clear that there will be nine zeros, and that this is 147 billion.
Or, for example, a hydrogen atom weighs about 1.66e-24 grams, i.e. 0.00000000000000000000000166 grams
(unless I missed some zeroes or typed some extra :) ). Clearly, the first one is much more convenient.

These two parts of which a floating-point number consist, are referred to as follows:
the pare prior to ``e`` is **mantissa** (or "significand"),
and the one after is **exponent** (or "scale"). For example, in 1234e1
the mantissa is equal to 1.234, and the exponent is 1.

How real numbers are stored in the computer
-------------------------------------------

On the one hand, real numbers that the computer operates with
can be either very large or very small. On the other hand,
it's generally impossible to store the *exact value* of a real number, 
because it can have many digits (even infinitely many) after the point.

Therefore, the computer stores numbers using floating-point notation,
and it stores the mantissa and the exponent separately (but side by side in memory,
and for you as a programmer it will be one variable representing a real number,
not two separate variables representing the mantissa and the exponent).
Moreover, since there can be infinitely many digits in the mantissa of a real number, 
the computer only stores few digits from its beginning.

.. note ::
   In fact, the computer stores numbers in binary numeral system
   (i.e. the exponent in fact is not the power of *ten*, as it was
   described above, but the power of *two*) but this won't be really
   significant to you yet, as all input and output operations 
   still use decimal system and therefore decimal exponent.

.. _pythonBasicsFloatTypes:

Data types
----------

All modern computers are able to operate with 
the three following floating-point data types:

-  **single** — stores 7-8 digits of mantissa, limits the exponent approximately by ±40,
   takes 4 bytes of memory, works rather fast;
-  **double** — stores 15-16 digits of mantissa, limits the exponent approximately by ±300,
   takes 8 bytes of memory, works a bit slower;
-  **extended** — stores 19-20 digits of mantissa, limits the exponent approximately by ±5000, 
   takes 10 bytes of memory, works way slower;

.. note :: 
   Let me clarify the meaning of "X digits of mantissa" and "limits the exponent by Y".
   
   As I mentioned above, only few first digits of the mantissa are stored.
   So, these are 7-8 digits in ``single`` data type, 15-16 in ``double`` and
   19-20 in ``extended``. So if you try to assign 1.234567890123456789e20 to
   a varibale which is ``single``, you'll get something like 1.234567e20, 
   and all the extra digits will be dropped. (In fact it's a bit more tricky
   as all the numbers in the computer are binary. That's why I write that there are
   "7-8 digits" — it depends on the binary representation.)

   And the limit of the exponent means that you'll simply fail trying to save a number 
   with exponent too big for the certain type (for example, 1.23e100 will not fit into ``single``).
   Such an instruction will either raise an error, or result in a special "infinity" value;
   and the numbers with too big negative exponent will simply be considered equal to zero
   ((if you try to write 1.23e-100 to ``single``, you will get 0). 

These types are supported by the processor (i.e. the processor is able 
to execute the command "add two numbers of type single" or "subtract two numbers 
of type extended", etc.). Therefore, these types are present (possibly with other
names) in almost all existing programming languages.

Unfortunately, specifically in Python there is no easy way to choose one of these 
three types. You can only work with ``double``, and in Python, the name ``float`` 
is used instead of ``double`` (which is generally odd 
because in other languages ``float`` is equivalent to ``single``, not ``double`` at all).
Therefore,

.. important::
   It Python, standard floating-point type is called ``float``,
   stores 15-16 digits of mantissa and limits the exponent approximately by ±300.

Significant digits
------------------

As discussed above, the same number can be written in floating-point format in different ways.
12.34 can be written as 0.0000000001234e11 or 1234000000000e-11, etc.
Of course, the computer stores the number in some certain form. Moreover,
if you try to, for example, assign 0.0000000001234e11 to a variable which is ``single``,
then you may say that only zeros will be saved
(because the mantissa of ``single`` type stores only 7-8 digits).

In fact, things are a bit more complicated. Basically, we can assume the following:
the computer  stores numbers in such a way that there is exactly one non-zero digit
before the point (as described above). I.e. 12.34 will be actually stored
in the memory as 1.234e-1 and not the other way, and, for example, the distance
between the Earth and the Sun in meters is stored as 1.47e11.
(And in fact it is even more tricky because of the binary numeral system).

That's why the computer will never store leading zeros in the mantissa.
In this sense, it's more accurate to speak of "significant digits" —
these are the digits in the notation of a number which start with the first non-zero digit.
For example, in 12.3405, the significant digits are 1, 2, 3, 4, 0, 5 (all),
and in 0.00000000000000000000000000166 the significant digits are 1, 6 and 6
(and the computer will store this number as 1.66e-27).

So we can say that ``single`` type stores 7-8 significant digits, ``double`` — 15-16, ``extended`` — 19-20.

"Holes" between the numbers
---------------------------

(The concept of "holes" isn't really necessary on the basic level, but may be useful in the future.)

Due to the fact that the computer stores only a ceratin number of significant digits, it turns
out that there are "holes" between neighboring numbers of a particular type. For example, 
let's take a ``single`` type variable. It's impossible to assign the number 1.2345678901234 
to it — only 1.234567 or 1.234568. The result is that between the numbers 
1.234567 and 1.234568 there is a "hole" having a width of 0.000001, 
in which there are no numbers that can be stored in a single.

While the numbers themselves are not very large, the "holes" aren't wide.
But when the numbers get bigger, the "holes" get bigger too.
For example, the number 123456789 is also impossible to assign to ``single``.
You can only assign 123456700 or 123456800 — the "hole" is already of width 100!

(In fact, the specific numbers that can be stored are a little different,
once again because of the binary numeral system. Accordingly, the sizes of "holes" 
are also different, they are powers of two instead of ten,
but qualitatively everything described above is true.)

Basic operations
----------------

With floating-point numbers you can perform all the operations 
which we've already discussed: +-\*/, abs, sqrt, input/output via
float(input()), map(float, ...) and print. Division with remainder (// and %) also works.

Meanwhile, in your programs, as well as in the input data, you can set numbers
both in fixed-point and floating-point notations. I.e. you can type,
for example, ``a = 1.23 + 2.34e-1``, and when inputting numbers, you can
also enter values in both formats: ``1.23`` and ``2.34e-1``.

Output in detail
----------------

In the problems you may often find the sentence "print the answer with
an accuracy of 5 digits after the point", or "with five correct characters", etc.
They almost always mean that your answer should contain 5 correct digits 
after the decimal point, but they do not forbid you to output more digits. 
You can output even 20 digits — if the first five of them are correct,
then the answer will be accepted. And vice versa, you can output fewer digits — if
the missing digits are zeros, then the answer will also be accepted.
In general, strictly speaking, such a phrase in the task simply means
that your answer should differ from the correct one by no more than 1e-5.

For example, if the correct answer to the problem is 0.123456789,
you can output 0.12345, or 0.123459876, or even 1.2345e—1
(because this is the same as 0.12345).
And if the correct answer is 0.10000023, then you
can output 0.10000, 0.10000987 or even just 0.1 or 1e—001
(because these two are the same as 0.10000).

In particular, this means that you can use the standard
output function (``print``) without any special tricks;
there's no need to round the number, no need to format the output, etc.

But if it's strictly stated "output should contain exactly 5 digits 
after the decimal point", then this is another case.
But on regular contests this happens very rarely.

Useful functions
----------------

In Python, there are several functions that will be useful to you 
when working with real numbers. For some of these functions,
it is necessary to type ``from math import *`` in the beginning 
of the program (as you already did for the square root).
Also, keep in mind that these functions may lead to rounding issues (see below).

-  **floor**  — rounds the number *down*, i.e. returns the nearest
   integer that is *less than or equal to* a given real.
   Examples: ``floor(2.4) == 2``, ``floor(2) == 2``,
   ``floor(-2.4) == -3``, ``floor(2.8) == 2``.
-  **ceil** — rounds the number *up*, i.e. returns
   the nearest integer that is *greater than or equal to* a given real.
   Examples: ``ceil(2.4) == 3``, ``ceil(2) == 2``,
   ``ceil(-2.4) == -2``, ``ceil(2.8) == 3``.
-  **trunc** — rounds the number *towards zero*.
   Examples: ``trunc(2.4) == 2``, ``trunc(2) == 2``,
   ``trunc(-2.4) == -2``, ``trunc(2.8) == 2``.
-  **round** — rounds the number *to the nearest integer*
   ("according to school rules", except when the fractional part of the number
   is exactly equal to 0.5 — then, depending on the number, it may be rounded
   in one direction or the other). Examples: ``round(2.4) == 2``,
   ``round(2) == 2``, ``round(-2.4) == -2``, ``round(2.8) == 3``.
-  I'll say once again that operations of division with remainder (``//`` and ``%``)
   work, and in particular, ``x % 1`` gives the fractional part of the number ``x``.

Example of a program using these functions::

    from math import *               

    print(floor(-2.4))  # outputs -3 
    print(ceil(2.4))  # outputs 3    
    print(trunc(2.8) + (2.4 + 0.4) % 1)  # outputs 2.8                         
    print(round(3.9))  # outputs 4   

Errors
------

Two rules of using floating-pont numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, I will define two main rules of using floating-point numbers:

.. important::

   **Rule one: don't use floating-point numbers**. That is, if it's
   possible and not very difficult to solve the problem without using
   flotaing-point numbers, it's better to solve it in that way.

.. important::

   **Rule two: if you are using them, then use** ``eps``.
   For any [#f]_ comparisons of floating-point numbers,
   you should use ``eps``.

.. [#f] except when you don't care what happens in case of exact equality (see below).

Both of these rules are explained below.

The necessity of ``eps``
~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned above, a computer can't store *all* digits of a number,
it stores only the few beginning significant digits. Therefore, if,
for example, we divide 1 by 3, we get not 0.333333... (infinitely many
digits), but something like 0.3333333 (only the first few digits).
If, after that, you multiply the result by 3, you get not exactly 1, but
0.99999999. (A similar effect exists on simple calculators;
it also exists on advanced calculators, but is more complicated to reveal.)

(You can give it a try and check whether it is true that ``(1/3)*3`` is equal to 1,
and find that the condition ``if (1 / 3) * 3 == 1`` is true. Yes, we were lucky here 
— again, because of the binary system, rounding worked in the right direction.
But with other numbers this may not work. For example, check ``if (1 / 49) * 49 == 1`` fails.)

Actually, things are even worse: the computer works in binary system,
so even numbers which have a finite number of digits in decimal system 
can be represented imprecisely in the computer. Therefore,
for example, the check ``if 0.3 + 0.6 == 0.9`` will not work either:
if you add up 0.3 and 0.6, you will get not exactly 0.9,
but a slightly different number (0.899999 or 0.900001, etc.)

Indeed, write and run the following program::

   if 0.3 + 0.6 == 0.9:
      print("Ok")
   else:
      print("Fail")

and you'll see that it outputs *Fail*.

(Moreover, on my machine ``print(0.3+0.6)`` outputs 0.8999999999999999.)

So, the errors that occur in any calculations are the main
problem of floating-point numbers. Therefore, **if you need to compare
two floating-point numbers, then take into account the fact that,
even if they should be actually equal, they may not be equal in the program**.

The standard approach to deal with this issue is to choose a small number ``eps``
(refers to the Greek letter ε — "epsilon"),
and consider two numbers equal if they differ by no more than ``eps``.

Below we'll discuss how to choose this ``eps``. Let's assume for a while that
we took ``eps=1e-6``. Then at the beginning of the program we type
::

   eps = 1e-6                       

— and further in the code, when we need to compare two numbers,
instead of ``if x=y`` we should write ``if abs(x - y) < eps``,
i.e. we check whether it is true that :math:`|x-y| < \varepsilon`.

So, we assume that if two numbers should actually be
equal, but may differ due to an error, then they will differ by
no more than ``eps``; and if they should really be different,
then they will differ by more than ``eps``. Thus, ``eps``
separates the situations "two numbers are equal" and "two numbers are not equal".
(Of course, this will not work with arbitrary ``eps``,
i.e. ``eps`` must be chosen with care — see below about this.)

Similarly, if we need to check ``if x >= y``, then we should write
``if x >= y - eps`` or ``if x > y - eps``. (Note that it doesn't
matter whether to write strict or non—strict inequality, as the probability that
it will be exactly ``x == y - eps`` is very small, again, due to the errors. Highly likely
it will be either more or less. Moreover, if it turned out that exactly ``x == y - eps``,
it means that we chose an inappropriate ``eps``, because we failed to separate the situation 
"the numbers ``x`` and ``y`` are equal" and the situation "the numbers are not equal".
See more on this below in the section about the choice of `eps`.)

The condition ``if x > y`` has to be modified as well,
because it is important to us (see below for more details)
that the condition is false upon ``x == y``!
Therefore, it should be rewritten like this: ``if x > y + eps``.
And any other comparisons of real numbers 
should be considered and modified in a similar way.

So, that's why we get

.. important::

   **Rule two: if you are using them, then use** ``eps``.
   For any [#f]_ comparisons of floating-point numbers,
   you should use ``eps``.

(The Rule one will be discussed a bit later :) )

Choosing ``eps``
~~~~~~~~~~~~~~~~

Choosing ``eps`` is quite a non—trivial problem, and it even might not
have a correct solution at all. We need to choose an ``eps`` that meets
the two following criteria: if two numbers should be equal (but differ
due to errors), then their difference must be much less than ``eps``,
and if they are not equal, then it must be much more than ``eps``.
It's clear that in general this problem has no solution:
just in one same program there may be two numbers that
should be equal, but differ, for example, by 0.1 due to error, and
two numbers that are really different, but differ only by 0.01.

But it is usually considered that in "adequate" tasks such an ``eps``
exists, i.e. the numbers that should be equal do not differ very
much, and those that should differ are fairly more different.
So ``eps`` should be chosen somewhere in the middle.
(In particular, as mentioned above, that's why it doesn't happen 
that exactly ``x == y - eps``.) (In advanced tasks,
more complex techniques may be needed, but we won't discuss them now.)

In some simplest tasks, such an ``eps`` can be calculated precisely.
For example, let the problem be like: "Three numbers :math:`a`, :math:`b` and :math:`c`
are given, each is no more than 1000, and each has no more than 3 digits after
the decimal point. Check if it is true that :math:`a + b = c`." From the discussed above
it's clear that the stupid solution via ``if a + b == c`` won't work:
you'll definitely come across a situation where it should be :math:`a + b = c`,
but due to errors you get :math:`a + b \neq c`. Therefore, it is necessary to perform 
the check in this way: ``if abs(a + b - c) < eps``. But what should ``eps`` be like?

On the one hand, let's suppose it's :math:`a + b = c` indeed. What could the difference :math:`a+b-c`
be due to the errors? We know that :math:`a`, :math:`b` and :math:`c` does not exceed 1000.
We use the ``float`` data type (which is actually ``double``),
which stores 15-16 digits, so the errors will be approximately in
the 15th-16th significant digit. For the maximum possible values of our numbers
(i.e. for 1000), the errors will be around ``1e-12`` or less,
i.e. it can be fairly considered that if :math:`a + b = c`,
then in the program :math:`|a + b - c|` will be around ``1e-12`` or less.

On the other hand, let it be non-equal: :math:`a+b \neq c`. What then could the difference
:math:`|a+b-c|` be? As given in the task, all numbers have no more than three digits
after the decimal point, so it's clear that this difference will be equal to 0.001 or more.

As a result, we see that if the numbers should be equal,
then they differ by no more than ``1e-12``, and
if they should be different, then differ by at least ``1e-3``.
Therefore, we can take, for example ``eps = 1e-5``.
So on the one hand, if in fact :math:`a + b = c`, then in the program
:math:`|a + b - c|` will definitely be much less than ``eps``,
and on the other hand, if in fact :math:`a + b \neq c`, then
:math:`|a + b - c|` will be definitely much more than ``eps``.
So, in this example, we are able to just calculate the appropriate ``eps``.

(And in general, of course, there are many options —
any number that is significantly less than :math:`1e-3`
and significantly more than :math:`1e-12` would be suitable.
This is the "good" situation, where the options "equal" and "not equal"
are strongly separated. And if they weren't so, then the whole ``eps`` trick
wouldn't work. This is what I mentioned a little above.).

But there are problems where it is not so easy to calculate the appropriate ``eps``.
In fact, such are the most of the problems — as soon as your calculations
become more sophisticated than just adding two numbers, it becomes difficult
to keep track of the errors. You can, of course, use some complex techniques,
but it is a common practice to just take ``eps`` somewhere in range ``1e-6``..\ ``1e-10``.

But in the end you can't be sure that you have chosen the right ``eps``.
If your program doesn't work, it may be because you have an error in the program,
or simply because you've chosen an inappropriate ``eps``. It happens
that it is enough to change the ``eps`` and the program will pass all the tests.
Of course, this is not really good, but there's nothing to do.

In particular, this is why on the contests tasks that indeed require calculations
with real numbers are quite unpopular and appear rarely — no one,
even the jury itself, can be sure that their ``eps`` is chosen correctly.
But sometimes you may still come across such tasks.

And therefore we get

.. important::

   **Rule one of operating with floating-point numbers: don't use floating-point numbers**.
   That is, if it's possible and not very difficult to solve the problem without using
   flotaing-point numbers, it's better to solve it in that way and not to care about all those errors and ``eps``. 

A natural example: suppose you have four *integer* (int) positive numbers
in your program: :math:`a`, :math:`b`, :math:`c` and :math:`d`.
And you need to compare two fractions: :math:`a/b` and :math:`c/d`.
You could write ``if a/b > c/d``, but this is not good:
as a result of division, real numbers are obtained, and you compare two
real numbers and bear with all the consequences.
(In this specific case, perhaps nothing bad will happen,
but in slightly more complex cases it already may happen.
And even in this case it may happen, I didn't check.)
That is, it may, for example, be actually a true equality :math:`a/b = c/d`,
but due to roundoff errors in the program it will result in :math:`a/b > c/d`,
s ``if`` will be executed. You can write it with ``eps`` and think how to choose it...
but the solution can be way more simple. You can just understand that,
for positive numbers (as given), this condition is equivalent
to the condition ``if a * d > c * b``. Here, all calculations are with integers,
so this condition always works properly and does not require any ``eps``
(and even works faster than the previous version). It's just as easy to write
as the one with division, so you should always write this way.
Whenever you have an intention to move from integers to real (in fact, floating-point)
numbers in a solution, think for a second: is it possible to do without real numbers?
If yes, then try to do so — and you won't run into any issues with precision and roundoff.

In particular, in the future you will notice that in many problems that
seem to imply real input data (for example, geometry problems),
the input data is nevertheless usually integer.
This is done exactly so that you can write the solution completely
in integers, and not have issues with the roundoff error.
(There's no guarantee that such a solution exists,
let alone it is simple, but nevertheless.) Therefore,
if you can think out and write such a solution, it is better to write it.

Additional topic. "Rough" problems: when you don't need ``eps``
---------------------------------------------------------------

Let's look at this code (where ``x``, ``y`` and ``max`` are floating-point numbers)::
                                     
   if x > y:                        
      max = x                      
   else:                            
      max = y                      

Here we compare two real numbers to find the maximum.
It may seem, according to discussed above, that you need
``eps`` in the condition... but actually you don't!
Because if two numbers are equal indeed, then we
*don't care* which of the ``if`` branches we get into —
in both branches the result will be correct!
Therefore, ``eps`` is not needed here.

This happens sometimes that you don't care which branch of ``if`` you get into
when two comared numbers are actually equal to each other. In this
case, you souldn't use ``eps``. But think carefully each time:
does it really matter? It is always better to be safe and write ``eps``
(above, everything would also work with ``eps``), except for very simple
cases like the calculation of the maximum above.

Another example: calculating the sum of all positive elements of the array::

   # x is an array of floats
   s = 0
   for i in range(len(x)):
      if x[i] > 0:
         s += x[i]


Here, again, if :math:`x_i == 0`, then it doesn't matter whether we add
it to the sum or not: the sum won't cahnge from adding zero. Therefore
you don't need to write ``eps`` (but it won't be a big deal if you do).

Another example where ``eps`` is already necessary:
let's determine *which* of the two numbers is greater::

   ...                              
   if x > y + eps:                  
      ans = 1                      
   elif x < y - eps:                  
      ans = 2                      
   else:                            
      ans:=0                      

In general, the following concept is useful here. Let's call a problem
(or a code fragment) *rough* if the answer to that problem
(or the result of execution of this fragment) does not change significantly
(abruplty) upon a small change in the input data, and *not rough* in the opposite case.
(The concept of roughness initially came from physics.)

Then, ``eps`` is needed in the task (code fragment) if this task *is not rough*.
Then there is such input data that you have to distinguish from very similar to it. 
For example, if you need to determine which of the two numbers is greater,
then on the input data "0.3 0.3" the answer is "they are equal".
But let's make a very small change in the input data, for example, "0.300001 0.3",
and the result changes dramatically: now the answer is "the first is greater".

If the task (or code fragment) *is rough*, then highly likely you can do
without ``eps``: if you obtain a little error in the calculations,
the answer will not change very much. For example, if you need to calculate 
a maximum of two numbers, then on the input data "0.3 0.3" the answer is 0.3, 
and on the input data "0.300001 0.3" the answer is 0.300001,
i.e. the answer has not changed very much.

But, of course, all this discussion on rough tasks is quite abstract,
and you should think separately of applying it to each specific task.

Sample problems and solutions
-----------------------------

Here are a few sample problems similar to ones you may come across on contests and in my course.

.. task::

   Masha is staying at home and watching the thunderstorm outside. She saw lightning strike,
   and :math:`T` seconds later she heard thunder from that strike. She knows that there is a single tree
   on the side where the lightning hit, and she is afraid that lightning had hit this tree.
   The distance from Masha's home to the tree is :math:`L` meters, the speed of sound is :math:`V` meters per second,
   the speed of light is considered infinite. Determine if lightning could hit the tree.

    **Input**: Three real numbers in one line: :math:`T`, :math:`L` and :math:`V`.

    **Output**: Print ``yes``, if the lightning could hit the tree, and ``no`` otherwise.

    **Example**:

    Input::

        2.5 750 300

    Output::

        yes
    |
    |
    |

It is easy to understand that the distance between Masha's home and the strike location 
is:math:`V\cdot T`. So it's needed to check whether it is equal to :math:`L`.
The natural idea is to write ``if v * t == l``, but since all numbers are real,
it will not work just like this. Due to errors, the multiplication result may not
be equal to `l`, even if in fact it should be equal. (Not to mention the fact that
in real life the values of :math:`V`, :math:`L` and :math:`T` are not precise,
and therefore :math:`V\cdot T` may not be equal to :math:`L` just due to measurement errors.)
Therefore, it is necessary to check that ``v*t`` is *approximately* equal to ``l``,
i.e. that the difference ``abs(l - v *t)`` isnt' too big. Let's choose some ``eps``
and compare the calculated result with it.

So, the code will look like this::

    t, v, l = map(float, input().split())
    eps = 1e-6
    if abs(l - v * t) < eps:
        print("yes")
    else:
        print("no")

Here, the choice of ``eps`` here is rather arbitrary. See more details
on choosing ``eps`` above in the main part of the topic.

.. task::
    Vasya drove :math:`L` kilometers in :math:`T` hours. On the road he was driving on,
    speed limit is :math:`V` kilometers per hour: you can drive at any speed not exceeding :math:`V`.
    Determine if Vasya violated the limit.

    **Input**: Three real numbers in one line: :math:`T`, :math:`L` and :math:`V`.

    **Outout**: Print ``yes`` if Vasya violated the speed limit, and ``no`` otherwise.

    **Example**:

    Input::

        2.5 750 300

    Output::

        no
    |
    |
    |

Vasya's speed is equal to :math:`L/T`. If it is strictly greater than :math:`V`,
then Vasya violated the limit, otherwise he didn't. But we must remember
that if :math:`L/T` is actually precisely equal to :math:`V`, then due to errors
it may turn out that :math:`L/T` is slightly greater than :math:`V`.
Therefore, instruction ``if l / t > v`` is faulty, as it can give a result ``yes``
if Vasya was driving at the speed precisely equal to ``v``.
We need to add a small ``eps`` to take this into account::

   t, v, l = map(float, input().split())
   eps = 1e-6
   if l / t > v + eps
      print("yes")
   else:
      print("no")

Note that here we used a *strict*  inequality :math:`L/T>V`, and
to account for errors we had to rewrite it as ``l / t > v + eps``.
If we'd need a *non-strict* inequality :math:`L/T \geqslant V`,
then to account for the errors we would have to add a margin on the other side
and write ``l/t > v - eps``. At the same time, in both cases
it's possible to write ``>=`` (for example, ``l / t >= v - eps``),
as this doesn't matter (as discussed above). Instead, the sign
before ``eps`` matters, i.e. we make a margin on one side or the other.
