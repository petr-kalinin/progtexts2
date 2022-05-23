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
for example, the check `if 0.3 + 0.6 == 0.9" will not work either:
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

Выбор ``eps``
~~~~~~~~~~~~~

Выбор ``eps`` — это весьма нетривиальная задача, и далеко не всегда она
вообще имеет правильное решение. Нам надо выбрать такое ``eps``, чтобы,
если два числа должны быть равны (но отличаются из-за погрешностей), то
их разность точно была меньше ``eps``, а если они не равны, то точно
была больше ``eps``. Ясно, что в общем случае эта задача не имеет
решения: может быть так, что в одной программе будут два числа, которые
должны быть равны, но отличаются, например, на 0.1 из-за погрешности, и
два числа, которые действительно различны, но отличаются только на 0.01.

Но обычно считают, что в «разумных» задачах все-таки такое ``eps``
существует, т.е. числа, которые должны быть равны, отличаются не очень
сильно, а те, которые должны отличаться, отличаются намного сильнее. И
``eps`` выбирают где-нибудь посередине. (В частности, поэтому, как
говорилось выше, не бывает так, что ``x == y - eps`` точно.) (В более сложных
задачах может понадобиться применять более сложные техники, но мы их
сейчас не будем обсуждать.)

В некоторых, самых простых, задачах такое ``eps`` можно вычислить строго. Например,
пусть задача: даны три числа :math:`a`, :math:`b` и :math:`c`, каждое не больше 1000, и
каждое имеет не более 3 цифр после десятичной запятой. Надо проверить,
правда ли, что :math:`a+b=c`. Из изложенного выше понятно, что тупое решение
``if a + b == c`` не сработает: может оказаться, что должно быть :math:`a + b = c`, но
из-за погрешностей получится, что :math:`a+b \neq c`. Поэтому надо проверять
``if abs(a + b - c) < eps``, но какое брать ``eps``?

Подумаем: пусть действительно :math:`a+b=c`. Какой может быть разница :math:`a+b-c`
с учетом погрешностей? Мы знаем, что :math:`a`, :math:`b` и :math:`c` не превосходят 1000.
Мы используем тип данных ``float`` (который на самом деле ``double``), в
котором хранятся 15-16 верных цифр, значит, погрешности будут примерно в
15-16-й значащей цифре. Для максимальных возможных значений чисел (т.е.
для 1000) погрешности будут порядка ``1e-12`` или меньше, т.е. можно
рассчитывать, что если :math:`a+b=c`, то в программе :math:`|a+b-c|` будет порядка
``1e-12`` или меньше.

С другой стороны, пусть :math:`a+b \neq c`. Какой тогда может быть разница
:math:`|a+b-c|`? По условию, все числа имеют не более трех цифр после
запятой, поэтом понятно, что эта разница будет равна 0.001 или больше.

Итого мы видим, что если числа должны быть равны, то они отличаются не более чем на ``1e-12``,
а если не равны, то как минимум на ``1e-3``. Поэтому можно, например, взять ``eps=1e-5``. 
С одной стороны, если на
самом деле :math:`a+b=c`, то в программе :math:`|a+b-c|` точно получится намного
меньше ``eps``, а с другой стороны, если на самом деле :math:`a+b\neq c`, то
:math:`|a+b-c|` будет точно намного больше ``eps``. Итак, в этом примере мы
смогли точно вычислить подходящее ``eps``.

(И вообще, конечно,
вариантов много — подошло бы любое число, которое существенно меньше
1e-3 и существенно больше 1e-12. Вот это и есть «хорошая» ситуация,
когда варианты «равны» и «не равны» разделены очень сильно.
А если бы они не были бы так разделены, то весь фокус с ``eps`` не прошел бы.
Это то, про что я писал немного выше.).

Но бывают задачи, где так просто вычислить подходящее ``eps`` не
получается. На самом деле таких задач большинство — как только
вычисления у вас становятся сложнее чем сложить два числа, за
погрешностями уже становится сложно уследить. Можно, конечно, применять
какие-нибудь сложные техники, но обычно принято просто брать
какое-нибудь ``eps`` порядка ``1e-6``..\ ``1e-10``.

Но в итоге вы не можете быть уверены, что вы выбрали правильное ``eps``.
Если ваша программа не работает — это может быть потому, что у вас
ошибка в программе, а может быть просто потому, что вы выбрали неверный
``eps``. Бывает так, что достаточно поменять ``eps`` — и программа
пройдет все тесты. Конечно, это не очень хорошо, но ничего не поделаешь.

В частности, поэтому на олимпиадах очень не любят давать задачи, которые
реально требуют вычислений с вещественными числами — никто, даже само
жюри, не может быть уверено в том, что у них ``eps`` выбрано верно. Но
иногда такие задачи все-таки дают, т.к. никуда не денешься.

И поэтому получаем

.. important::

   **Первое правило работы с вещественными числами: не работайте с
   вещественными числами**. А именно, если возможно какую-то задачу решить
   без применения вещественных чисел, и это не очень сложно, то лучше ее
   решать без вещественных чисел, чтобы не думать про все эти погрешности и ``eps``.

Пример: пусть у вас в программе есть четыре *целых* (int)
положительных числа :math:`a`, :math:`b`, :math:`c` и :math:`d`, и вам надо сравнить две дроби:
:math:`a/b` и :math:`c/d`. Вы могли бы написать ``if a / b > c / d``, но это плохо: в
результате деления получаются вещественные числа, и вы сравниваете два
вещественных числа со всеми вытекающими последствиями. (Конкретно в этом
случае, возможно, ничего плохого не случится, но в чуть более сложных
случаях уже может случиться, да и в этом случае возможно и случится, я
не проверял.) А именно, может оказаться, например, что :math:`a / b = c / d` на
самом деле, но из-за погрешностей в программе получится :math:`a/b>c/d` и
``if`` выполнится. Вы можете написать ``eps``, думать, каким его
выбрать... но можно проще. Можно просто понять, что при положительных
(по условию) числах это сравнение эквивалентно условию ``if a * d > c * b``.
Здесь все вычисления идут только в целых числах, поэтому это условие
работает всегда, и не требует
никаких ``eps`` (да еще и работает быстрее, чем предыдущий вариант). Его
написать не сложнее, чем вариант с делением, поэтому всегда следует так
и писать. Всегда, когда в решении вы переходите от целых к вещественным
числам, задумайтесь на секунду: а нельзя ли обойтись без вещественных
чисел? Если да, то постарайтесь так и поступить — и никаких проблем с
точностью у вас не возникнет.

В частности, в будущем вы заметите, что во многих задачах, которые,
казалось бы, подразумевают вещественные входные данные (например, задачи
на геометрию), входные данные тем не менее обычно целочисленны. Это
сделано именно для того, чтобы можно было написать решение полностью в
целых числах, и не иметь проблем с погрешностью. (Не всегда такое
решение возможно, и уж тем более не всегда оно простое, но тем не
менее.) Поэтому если вы можете написать такое решение, лучше написать
именно его.

Дополнительный материал. «Грубые» задачи: когда ``eps`` не нужно
----------------------------------------------------------------

Рассмотрим следующие код (``x``, ``y``, ``max`` -- вещественные числа):

::                                   
                                     
   if x > y:                        
      max = x                      
   else:                            
      max = y                      

Здесь мы сравниваем два вещественных числа, чтобы найти максимум из них.
Казалось бы, в соответствии со сказанным выше, в сравнении нужен
``eps``... но нет! Ведь если два числа на самом деле равны, то нам *все
равно*, в какую из веток ``if`` мы попадем — обе ветки будут верными!
Поэтому ``eps`` тут не нужен.

Так иногда бывает — когда вам все равно, в какую ветку if'а вы попадете,
если два сравниваемых числа на самом деле равны между собой. В таком
случае ``eps`` использовать не надо. Но каждый раз тщательно думайте: а
правда ли все равно? Всегда лучше перестраховаться и написать ``eps``
(выше с ``eps`` тоже все работало бы), за исключением совсем уж простых
случаев типа приведенного выше вычисления максимума.

Еще пример: считаем сумму положительных элементов массива

::                                   
                                     
   # x -- массив вещественых чисел  
   s = 0                            
   for i in range(len(x)):          
      if x[i] > 0:                 
         s += x[i]                
                                     
                                     
Здесь, опять-таки, если должно быть :math:`x_i=0`, то не важно, добавим мы
его в сумму или нет: сумма от добавления нуля не изменится. Поэтому
``eps`` писать не надо (но ничего страшного не будет, если и написать).

Еще пример, где уже ``eps`` необходим: определим, *какое* из двух чисел
больше:

::

   ...                              
   if x > y + eps:                  
      ans = 1                      
   elif x < y - eps:                  
      ans = 2                      
   else:                            
      ans:=0                      

Вообще, тут полезно следующее понятие. Назовем задачу (или фрагмент
кода) *грубым*, если ответ на задачу (или результат работы этого
фрагмента) меняется не очень сильно (не скачком) при небольшом изменении
входных данных, и *негрубым* в противоположном случае. (Понятие грубости
пришло из физики.)

Тогда в задаче (фрагменте кода) ``eps`` нужен, если задача является
негрубой: тогда существуют такие входные данные, которые вам важно
отличить от очень близких им. Например, если надо определить, какое из
двух чисел больше, то при входных данных «0.3 0.3» надо ответить «они
равны», но при очень небольшом изменении входных данных, например, на
«0.300001 0.3» ответ резко меняется: надо отвечать «первое больше».

Если же задача (или фрагмент кода) является грубым, то, скорее всего, в
нем можно обойтись без ``eps``: если вы чуть-чуть ошибетесь при
вычислениях, ответ тоже изменится не очень сильно. Например, если вы
вычисляете максимум из двух чисел, то на входных данных «0.3 0.3» ответ
0.3, а на входных данных «0.300001 0.3» ответ 0.300001, т.е. изменился
не очень сильно.

Но, конечно, все приведенное выше рассуждение про грубые задачи — очень
примерно, и в каждой задаче надо отдельно думать.

Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::

    Маша наблюдает из дома за грозой. Она увидела молнию, а через :math:`T` секунд услышала гром от молнии.
    Она знает, что в той стороне, где была молния, есть одинокое дерево, и боится, не попала ли молния в это дерево.
    Расстояние от Машиного дома до дерева равно :math:`L` метров, скорость звука равна :math:`V` метров в секунду, скорость света считаем бесконечной.
    Определите, могла ли молния попасть в дерево.

    **Входные данные**: На одной строке вводятся три вещественных числа — :math:`T`, :math:`L` и :math:`V`.

    **Входные данные**: Выведите ``yes``, если молния могла попасть в дерево, и ``no`` в противном случае.

    **Пример**:

    Входные данные::

        2.5 750 300

    Выходные данные::

        yes
    |
    |
    |

Несложно понять, что расстояние от Машиного дома до молнии равно :math:`V\cdot T`. Осталось проверить, равно ли это :math:`L`.
Можно было бы написать ``if v * t == l``, но, поскольку все числа вещественные, так просто не заработает
— из-за погрешностей результат умножания может оказаться не равен ``l``, даже если на самом деле он должен быть равен.
(Не говоря уж о том, что в реальной жизни значения :math:`V`, :math:`L` и :math:`T` известны не совсем точно,
и поэтому :math:`V\cdot T` может оказаться не равно :math:`L` банально из-за погрешностей измерения.)
Поэтому надо проверять, что ``v*t`` *примерно* равно ``l``, т.е. что разница ``abs(l - v * t)`` не слишком велика.
Выберем какое-нибудь ``eps`` и будем сравнивать с ним.

Итоговый код получается такой::

   t, v, l = map(float, input().split())
   eps = 1e-6
   if abs(l - v * t) < eps:
      print("yes")
   else:
      print("no")

Выбор ``eps`` тут в существенной мере произвольный, подробнее про выбор ``eps`` описано выше в основной части теории.

.. task::

    Вася проехал :math:`L` километров за :math:`T` часов. На той дороге, по которой он ехал,
    ограничение скорости :math:`V` километров в час: можно ехать с любой скоростью, не превышающей :math:`V`.
    Определите, нарушил ли Вася правила.

    **Входные данные**: На одной строке вводятся три вещественных числа — :math:`T`, :math:`L` и :math:`V`.

    **Входные данные**: Выведите ``yes``, если Вася нарушил правила, и ``no`` в противном случае.

    **Пример**:

    Входные данные::

        2.5 750 300

    Выходные данные::

        no
    |
    |
    |

Скорость Васи равна :math:`L/T`. Если она строго больше чем :math:`V`, то Вася нарушил правила, иначе нет.
Но надо помнить, что если :math:`L/T` на самом деле точно равно :math:`V` (как в примере), то из-за погрешностей
может получиться :math:`L/T` чуть больше :math:`V`. Поэтому написать ``if l / t > v`` нельзя, это может выдать ``yes``,
если Вася ехал со скоростью ровно ``v``. Надо добавить небольшой запас ``eps``::

   t, v, l = map(float, input().split())
   eps = 1e-6
   if l / t > v + eps
      print("yes")
   else:
      print("no")

Обратите внимание, что по смыслу нам было нужно *строгое* сравнение :math:`L/T>V`, и для учета погрешностей пришлось его переписать как
``l / t > v + eps``.
Если бы нам нужно было бы *нестрогое* сравнение :math:`L/T\geqslant V`, то для учета погрешностей пришлось бы добавить запас с другой стороны, 
и написать ``l / t > v - eps``. При этом в обоих случаях можно было бы писать и ``>=`` (например, ``l / t >= v - eps``), как раз 
это не имеет никакого значения. Значение имеет знак перед ``eps``, т.е. делаем мы запас в одну или в другую сторону.
