.. highlight:: python

Loops
=====

In programs, it is quite common that you have to repeat
some operation(s) several times. Often you don't even know in advance
how many times you exactly need. There is a lanugage construction
designed specially for this, called loop.

There are two types of loops in python.

(I will give some code samples here. Of course, explore them
for a better comprehension.)

While loop
----------

The while loop is the simplest version of the loop. It performs some
operations and then determines whether they need to be performed again.
"Determination" is done by checking the condition set by the programmer.
The code looks like this:

::

    while condition:
        code

Here ``condition`` is a condition that has the same form as a condition for 
the ``if``-statement. There can be reraltions, ``and``, ``or``, etc.

And the ``code`` is an arbitrary sequence of operations (it can take
several lines) containing any instructions that you know or will
learn later: assignments, conditional statements, other loops, etc.

What will the computer do when it encounters such a loop? First it
will check if the condition is true. If it is, the computer
will execute the indented code below and check the condition again. If it is still
true, the computer will execute that code again. And so on, until 
the next check reveals that the condition is false. Then the computer 
will finish executing the loop and immediately move on to the code written after it.

How can the ``condition`` be several times true-true-ture and then suddenly stop
being true? It's quite simple: the ``code`` can change variables upon whose values 
the condition relies, and the check will fail. Actually, this is the whole point 
of the process. (And if the ``code`` doesn't actually change anything, then
the ``condition`` will always be true, and you will get a so-called 
"infinite loop" — the program will hang. Don't do that.)

Particularly, it may occur that the loop condition will not be true 
from the very beginning. Then the loop will not be run even once, 
execution will immediately move on to instructions after the loop.

The entire shape of the loop essentially means "while the ``condition`` 
is true, do the ``code``".

Examples
~~~~~~~~
::

    n = int(input())
    a = 1
    while 2 * a < n:
        print(a)
        a += 1
    print("Done")

What does this code do? First, it reads the value of ``n`` from the keyboard.
For example, let's suppose the user entered 5. Next, 1 is written to the 
variable ``a``. And then the loop begins.

First, the computer checks whether ``2 * a < n`` is true.
Indeed, ``2 * a`` is 2, and ``n`` is 5, the condition is met.
Therefore, we begin executing the code that is written inside the loop.
Namely, we write ``a``, i.e. 1, on the screen. And add one to ``a``,
resulting ``a == 2``. We've moved to the end of the code 
(it's also called "the body of the loop"), so we check the condition again. 
It's still true (``2 * a`` is 4, and ``n`` is equal to 5), 
so we execute the body of the loop again. We display 2 on the screen
and again increase ``a`` by one. We check the condition again, it is
no longer met (``2*a`` is 6, and ``n`` is 5), the loop ends.

When the loop is terminated, we move on to the code after it, printing "Done".

One more example, now quite sophisticated:
::

    n = int(input())
    a = 1
    while a < n:
        b = a
        while b > 0:
            if b % 2 == 1:
                print(b, end=" ")
            b -= 1
        print()
        a *= 2

Here is a loop put into another loop (nested loops). It works as follows: let's consider 
the user entered 6. The variable ``a``, just like above, becomes equal to 1.

The outer loop begins (which is ``while a < n``). The variable ``b``
becomes equal to ``a``, i.e. 1. While ``b > 0`` we do the following
(inner loop): if ``b`` is odd, then we display 1, after
which we reduce ``b`` by 1. As a result, 1 is displayed on the screen,
``b`` becomes 0 and the inner loop ends.

But the execution of the outer loop still continues. The ``print()`` insturction 
is executed, which outputs nothing, just starting a new line, and the variable ``a`` 
is  multiplied by 2 and becomes 2. Checking the loop condition: ``a`` is still 
less than ``n``. Therefore we repeat the operations, but with the new ``a`` value. 
Variable `b` becomes equal to 2 and the inner loop begins. In it, first (when
``b == 2``) output is not performed (because ``b`` is even), and ``b``
becomes equal to 1. Then 1 is output to the screen, ``b`` becomes equal
to 0 and the inner loop ends.

The outer loop continues, another empty line is output and ``a`` becomes
equal to 4. This is still less than ``n``, so we enter the inner loop again. 
Now ``b`` becomes equal to 4... and during the entire inner loop
on the screen is printed 3 1 (I will not describe it in detail).

Next, we output the new line again and ``a`` becomes equal to 8. This is
now more than ``n``, so the outer loop ends.

For loop
--------

The ``while`` loop works bluntly: it checks the condition and executes the code, 
and so on until the condition stops being true. This allows you to implement
almost any looping rules that are needed, and therefore is frequently used.

But besides, quite often it happens that you need to execute the
same code several times in a row, just changing the value of one variable
in some very simple way. There is a ``for`` loop for this. It is written
this way:

::

    for variable in list_values:
        code

This loop works like this: the ``variable`` is assigned the first
value is from the ``list_values`` and the ``code`` is executed.
Then it is assigned the next value from that list and the ``code`` is executed
again, and so on.

Example:
::

    for i in 7, 42, 137:
        print(i)

This code will output all three specified numbers (7, 42 and
137), one after another.

The list of values can be set as in the example above, separated by commas,
or in variety of other ways. You will learn the general rules of this later,
while I will just give the common way that you will often 
use now (and the one with an explicit listing of values,
as above, you will need quite rarely).

So, very often you need to change the loop variable by going through 
the numbers in a certain range one after another, for example, 1, 2, 3, 4,
..., 10. There is a ``range`` operation for this. It is written like this:
``for i in range(1, 11)`` — this iterates through all the numbers from 1
(first bound is included) to 11 (but **second bound is not included**),
i.e. just the range of numbers written above.
Once again, because it is important: the first number is included, the last
is not included. Example:
::

    for i in range(1, 21):
        print(i, "*", i, "=", i * i)

This code will output a sequence of squares of all numbers from 1 to 20
including right endpoint (or up to 21 not including it).

You are free to omit the first parameter of ``range``, it will be
implicitly considered zero:: ``for i in range(4)`` will result in 0, 1, 2, 3.
This may seem odd and inconsistent, but in the next section (about arrays) 
you will understand that this is quite native.

Conversely, you can laso specify the third parameter for ``range`` — that
will be the step with which the value of the variable will change. For example, 
``range(1, 7, 2)`` means "from 1 (including it) to 7 (not including it) with step of 2", i.e.
gives the numbers 1, 3, 5. And ``range(0, 100, 10)`` gives the numbers 0, 10, 20, 30,
..., 90.

This third parameter is also used in a special way to iterate through the numbers 
in reverse order. ``range(10, 0, -1)`` gives 10, 9, 8, ..., 1.
Note that 0 is not included again. (Similarly, you can specify step -2, etc.)

Of course, in ``range`` you can use variables, expressions, etc.
For example, ``range(a - b, a + b + 1)`` will iterate through the numbers from ``a-b`` to
``a+b`` including (up to ``a+b+1`` not including it).

And finally — a more complex example of using the ``for`` loop:
::

    for i in range(1, 10):
        for j in range(1, 10):
            print(i * j, end="")
        print()

this will output the multiplication table .

Break and continue
------------------

There are two special constructions really useful for work with loops:
``break`` and ``continue``. Here I will describe what they do and
their basic appications.

Loop body and iterations
~~~~~~~~~~~~~~~~~~~~~~~~

First, I will set/remind a few terms that are useful on the topic of loops.

The **body** of the loop is actually those instructions that are written inside
the loop. For example, in the loop
::

    for i in range(1, n + 1):
    a = i * i
    print(i, a)
    
the loop body consists of two instructions: assignment and output.

The **iteration** is one separate pass the through the body of the loop.
During the loop execution instructions of the loop body are repeated several times 
— each such repetition is called an iteration. In the example above, we can say that
the loop will do *n* iterations. For example, you can say that on the fifth
iteration of the loop, the string "5 25" will be output.

Break statement
~~~~~~~~~~~~~~~

The ``break`` statement is used to interrupt the execution of the loop body 
and go on to execute the code that comes after the loop. I.e. if at some
point you decided that you don't need to loop anymore, as your loop has
already produced all necessary data, and you need to move on to what is 
written after it, then write ``break`` in that point. Note that if the break 
happens in the middle of an iteration, this iteration will be interrupted 
and the loop body will not be executed until the end.

Example:
::

    for i in range(2, n + 1):
        if n % i == 0:
            print(i)
            break
        print('Tried', i, ', failed')
    print('The end!')

As soon as the condition is met, the corresponding *i* will be
output to the screen, and the execution of the loop will be interrupted 
immediately after that. Then, "The end!" will be displayed, and etc. 
In this case, the line "Tried..." will be output for every i 
**not including** the one on which the condition was met.

For example, for ``n == 9`` the output will be as follows:
::
    
    Tried 2 , failed
    3
    The end!

(Though this particular code would be easier to write 
via ``while`` loop. Think of how to do that)

The ``break`` statement can also be used with ``while`` and 
``repeat`` loops, one of the examples will be shown below.

Continue statement
~~~~~~~~~~~~~~~~~~

The ``continue`` statement is used to interrupt the execution of 
the current iteration of the loop and start the next iteration.
I.e., it's like jumping to the beginning of the loop without completing
what is written below in the body of the loop *but* with performing 
all the actions that must be performed after any iteration —
i.e. in the ``for`` loop increasing the value of the loop counter by 1,
and in ``while``/``repeat`` loops checking the condition and,
if it is not true, interrupting the whole loop.

Example::

    for i in range(2, n):
        if n % i != 0:
            print('Tried', i, ', failed')
            continue
        print(n, 'is evelny divisible by', i)

Here the loop will go through all the numbers from ``2`` to ``n-1`` and for each will output
whether ``n`` is divisible by ``i`` or not. For example, for ``n == 9`` the output will look so:
::
    Tried 2 , failed
    9 is evenly divisible by 3
    Tried 4 , failed
    ...
    Tried 8 , failed

Let's look at the few first iterations in more detail. First, ``i`` becomes
equal to 2. We check: ``9 % 2 != 0``, so we go inside our ``if``. We output
"Tried..." to the screen, and then there's the ``continue`` statement. So we 
immediately start the next iteration: increase ``i`` (!), it becomes 
equal to 3, and we go to the beginning of the loop body. ``9 % 3 == 0``, so we 
don't execute the ``if`` body and output "9 is evenly divisible by 3".
This iteration is over. We increase `i` and go to the next one. And so on.

Of course, in this particular case it's possible to do without using 
``continue``, just by writing ``else`` after ``if``. That would be easier. 
But it happens that you need to sort out the numbers, and there are many 
specific conditions upon those you don't need to take the number into account.
Then writing a bunch of ``else`` statements would be much more difficult than
a few ``continue`` statements. For example (this example is rather synthetic,
but similar cases exist):
::

    for i in range(n):
        # we don' need numbers divisible by 5
        if i % 5 == 0:
            continue
        # we also don't need numbers that give remainder 4 when divided by 7
        # note that we may process something befоre checking the condition from the comment above
        p = i * i
        if p % 7 == 4:
            continue
        # all the remaining numbers are necessary
        # so here we do some complex processing with many instructions
        ...
Here it's way more clear what you meant than if you wrote it using ``else``. 
With ``else``, whoever is going to read your code would have to look where
``else`` ends, and whether there are some more instructions after that ``else``.
In contrast, here everything is clear: if ``if`` is executed, the
remaining part of the loop body is entirely skipped.

While True and break
~~~~~~~~~~~~~~~~~~~~

One special case of ``break`` statement usage is the following.
It's typical that you need to repeat some sequence of operations
and you want to check the exit condition *in the middle* of this
sequence. For example, you need to read numbers from keyboard
until zero is entered. All numbers, except zero, need to be
processed somehow (It's not essential here how exactly.
To simplify, we will just output them to the screen).

The natural way to do this looks like this:
::
    read a number
    if it's equal to zero, stop and exit
    output the number to the screen
    read a number
    if it's equal to zero, stop and exit
    output the number to the screen
    read a number
    if it's equal to zero, stop and exit
    output the number to the screen
    ...

The looping pattern seems quite clear, but if you try to write 
a loop without using ``break``, nothing good would come of that.

You will probably take one of the several options: for example, like this:
::

    a = int(input())
    while a != 0:
        print(a)
        a = int(input())
        
In fact, you've "cut off" the looping sequence at the monent where 
the check must be performend and, as a result, were forced
to duplicate the reading operation: you have it before the loop, and
then again at the end of the loop. Code duplication is not very good
(if you have to change it, you may forget that the same code is in two
places); if you have a slightly more complex code instead of reading a number, 
it will be even worse. This particular variant, also has another disadvantage:
variable ``a`` has different values within one iteration of the loop. 
It would be easier if each iteration of the loop
corresponded to processing a certain entered number.

The second option you may come up with may be similar to this:
::

    a = 1
    while a != 0:
        a = int(input())
        if a != 0:
            print(a)

This one is better, as each iteration only processes one number, 
but it still has drawbacks. First, there is an artificial instruction 
``a = 1`` before the loop. Second, the condition ``a != 0``
is duplicated; if you have to change it, you may forget that it
is used twice. Third, you are going through ``if`` body in the *main* 
branch of the loop execution (i.e. the branch on which most iterations 
will be executed). This is not very convenient (from the point of readability): 
after all, all the numbers except the last one will not be zeros. 
So I would better write code which wouldn't require almost every iteration
to step into ``if`` for handling a rare case of ``a == 0``.
It would be much easier to read (especially if the processing would be 
not just ``print(a)``, but a much more complex code including 
several ``if``-statements itself and etc.).

Finally, you can implement it in this way:

::

    while 0 == 0:
        a = int(input())
        if a == 0:
            break
        print(a)

The artificial expression ``0 == 0`` is a condition that is always true: 
we need ``while`` to execute infinitely, and only stop via ``break``.
In fact, Python has a special word ``True`` in its syntax, denoting a condition
that is always true (and a symmetric word ``False" denoting a condition 
that is never true). Accordingly, it's even better to type ``while True:``...

This option is free from all the disadvantages mentioned above.
Each iteration works with one number, reading code is not duplicated,
the check is not duplicated, the overall sequence of operations is clear,
the main branch of the loop goes straight through the main code.

This is how you should write any loops where the you need to check 
the conditin *in the middle* of loop body:
::

    while True:
        some processing
        if exit_condition:
            break
        some more processing

Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::

    В классе :math:`N` школьников. На уроке физкультуры тренер говорит «на первый-второй рассчитайтесь».
    Выведите, что скажут ученики.

    **Входные данные**: Вводится одно целое число — количество человек в классе.

    **Входные данные**: Выведите последовательность чисел 1 и 2, в том порядке, как будут говорить школьники.

    **Пример**:

    Входные данные::

        5

    Выходные данные::

        1
        2
        1
        2
        1
    |
    |
    |

Сначала, конечно, считываем :math:`N`::

    n = int(input())

Самое главное в задачах на циклы — понять, какая операция будет повторяться, и сколько раз или до какого условия,
и чему будет соответствовать каждое повторение (итерация) цикла.
В этой задаче более-менее понятно: надо :math:`N` раз вывести число, и каждая итерация
будет соответствовать одному школьнику. Поэтому логично написать цикл ``for i in range(n)``,
он как раз осуществит :math:`N` повторений.

Дальше надо понять, что делать внутри каждого повторения. Здесь надо решить, что выводить — 1 или 2 —
и соответственно вывести. В цикле ``for`` у нас как раз есть переменная ``i``, которая хранит номер текущего школьника.
(Это очень важный момент — внутри цикла вы должны писать общий код, который будет работать
в общем виде на каждой итерации, и обычно как раз стоит опираться на какие-то переменные,
отражающие текущее состояние, в цикле ``for`` это обычно переменная цикла.)

Ясно, что число, которое надо вывести, зависит от четности ``i``. Надо еще учесть,
что итерация цикла (``range(n)``) начинается с нуля, поэтому общий код получается такой::

    n = int(input())
    for i in range(n):
        if i % 2 == 0:
            print(1)
        else:
            print(2)

.. task::

    Вводятся :math:`N` чисел. Посчитайте, сколько среди них четных.

    **Входные данные**: На первой строке вводится одно число :math:`N`. Далее следуют :math:`N` строк по одному числу на каждой — заданные числа.

    **Входные данные**: Выведите ответ на задачу.

    **Пример**:

    Входные данные::

        4
        10
        11
        12
        13

    Выходные данные::

        2
    |
    |
    |

Здесь вы сталкиваетесь с тем, что заранее (на этапе написания программы) вы не знаете, сколько чисел надо будет вводить.
Вы должны сначала ввести число :math:`N`, а потом еще :math:`N` чисел, т.е. если вам первым числом вводят 3, значит, дальше будет еще 3 числа,
а если первым числом вводят 137, то дальше будет еще 137 чисел. Это радикально отличается от того, что вы делали раньше,
когда вы знали, например, что всегда вводится ровно 6 чисел.

Но как раз циклы и позволяют повторить некоторую операцию заданное число раз, причем на этапе написания программы
вам не обязательно знать, сколько раз надо это делать. В примере выше внутри цикла вы выводили данные,
а тут по смыслу задачи внутри цикла вам придется *считывать* данные.

Вы считываете сначала :math:`N`::

    n = int(input())

а дальше вам надо написать цикл, повторяющийся :math:`N` раз, и внутри цикла считывать числа::

    for i in range(n):
        x = int(input())
        ...

Дальше надо у каждого числа проверить, четное ли оно: ``if x % 2 == 0``, ну и если четное, то увеличить счетчик четных чисел на единицу.
Такой счетчик, естественно, надо завести заранее. 

Итого получаем::

    n = int(input())
    k = 0
    for i in range(n):
        x = int(input())
        if x % 2 == 0:
            k += 1
    print(k)

Обратите внимание, что вывод ответа (``k``) надо делать после окончания цикла, поэтому команда ``print`` пишется без отступа.

.. task::

    Посчитайте сумму :math:`1+2+3+\ldots+N`.

    **Входные данные**: Вводится одно целое число :math:`N`.

    **Входные данные**: Выведите искомую сумму.

    **Пример**:

    Входные данные::

        2

    Выходные данные::

        3

    Входные данные::

        5

    Выходные данные::

        15
    |
    |
    |

(Конечно, эту задачу можно решить известной формулой,
но давайте все-таки напишем цикл.)

(Обратите еще внимание, что ввод 2 корректен, и ответ на 2 равен 3, несмотря на то, что в формуле написана и двойка, и тройка, и :math:`N`.
Это стандартная особенность таких математических обозначений: в формуле с многоточием пишется побольше слагаемых,
чтобы была понятна логика, но если :math:`N` маленькое, то просто остается только столько слагаемых, сколько надо.)

В такой задаче полезно подумать, как бы вы считали ответ вручную.
Часто говорят: сложил бы все числа.
Но если подумать, вы же не сможете сложить сразу все пять чисел.
Вы наверняка будете складывать числа по очереди:
сначала к 1 прибавляете 2, потом к результату прибавляете 3,
потом к результату прибавляете 4, и т.д.

Соответственно, какая картина вырисовывается: у вас много раз повторяется
одно и то же действие: к текущей сумме прибавить очередное число. Значит, нам, во-первых,
явно нужен цикл, перебирающий числа подряд, во-вторых, нам явно нужна
переменная для текущей суммы, пусть это будет переменная :math:`k`. 
Соответственно, получается что-то такого рода::

    for i in .....:
        ... k + i

т.е. вам надо к :math:`k` прибавить :math:`i`.
Но просто так прибавлять смысла нет, надо куда-нибудь сохранить результат.
И тут фокус, возможно, не очень очевидный: результат надо сохранять в :math:`k`!
Потому что на следующей итерации цикла именно к этому результату
надо будет прибавлять следующее :math:`i`::

    for i in .....:
        k = k + i

осталось понять, в каких пределах надо запускать цикл, а также что изначально записать в :math:`k`.
Напрашивается решение в :math:`k` записать 1 (первое слагаемое), а цикл делать от 2 до :math:`N`,
но на самом деле немного проще изначально в :math:`k` записать 0 (пустую сумму, т.е. как будто нет слагаемых вообще),
а цикл делать от 1 до :math:`N`, причем, естественно, :math:`N` включительно, поэтому надо писать ``range(1, n + 1)``.

Итоговый код, вместе с вводом и выводом переменных::

    n = int(input())
    k = 0
    for i in range(1, n + 1):
        k = k + i
    print(k)
    
.. task::

    Маша хочет накопить на новый телефон. Телефон стоит :math:`N` рублей.
    Маша может откладывать :math:`K` рублей в день каждый день, за исключением воскресенья,
    когда она тратит деньги на поход в кино.
    Маша начинает копить в понедельник. За сколько дней она накопит нужную сумму?

    **Входные данные**: Вводятся два числа: :math:`N` и :math:`K`.

    **Входные данные**: Выведите искомое количество дней

    **Пример**:

    Входные данные::

        100 50

    Выходные данные::

        2

    Входные данные::

        100 10

    Выходные данные::

        11
    |
    |
    |

В принципе, эту задачу не так уж и сложно решить формулой, без циклов (но скорее всего с if'ами),
но давайте напишем цикл.

Попробуем промоделировать, как будет увеличиваться сумма накопленных денег у Маши. Обозначим текущую сумму как :math:`s`.
Каждый день, кроме воскресенья, к ней прибавляется :math:`K`.
Логично написать цикл, чтобы одна итерация цикла соответствовала одному дню.
Цикл надо продолжать до тех пор, пока не накопится нужная сумма, поэтому естественно написать цикл ``while``::

    while s < n:

Что мы делаем в цикле? Надо прибавить :math:`K` к :math:`s`, но только если текущий день не воскресенье::

    while s < n:
        if .....:  # тут надо написать условие «не воскресенье»
            s = s + k

Как понять, воскресенье сейчас или нет? Естественно, нам нужен какой-нибудь счетчик дней, заодно он нам нужен будет
и для вывода ответа. Заводим переменную :math:`day` — номер текущего дня. Маша начинает копить в понедельник,
считая это днем 1, понимаем, что воскресенья — это дни, номера которых делятся на 7.

Получаем примерно такой код::

    day = 1
    s = 0
    while s < n:
        if day % 7 != 0:
            s = s + k
        day = day + 1

Тут единственная проблема — мы заканчиваем цикл, уже перейдя к очередному дню, т.е. в этом коде :math:`day`
получается всегда на 1 больше, чем нужно. Поэтому при выводе ответа надо вычесть единицу::

    n, k = map(int, input().split())
    day = 1
    s = 0
    while s < n:
        if day % 7 != 0:
            s = s + k
        day = day + 1
    print(day - 1)
