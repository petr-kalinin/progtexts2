.. highlight:: python

Getting started in Python 3 and Wing IDE 101
=======================================

About Python versions
---------------------

Now there are two main branches (versions) of Python language: Python 2 and Python 3.
Version 2 is officially considered deprecated (its support ends in 2020), version 3 is
newer and more modern. We will study exactly the version 3. Version 2 is significantly
different from version 3, and we will not discuss these differences here.

There are "sub-versions" within both version 2 and version 3. For example, the latest
version in the third branch now (2020) is 3.8.2 (besides those ones that are still
in development). Basically, for our lessons you can use any version of Python
from the third branch, preferably at least 3.3, but if there are no special reasons,
install the latest available version.

Installing Python
----------------

Python is a free cross-platform software, so it can be easily downloaded from
the official website, can be freely distributed, and can be installed on all
modern operating systems.

To install Python for Windows, download the installer from the course page or
from the official website (http://python.org, choose Downloads section;
make sure you are downloading exactly Python 3 for Windows). Install Python
using this program, there is nothing complicated in the installer. It's useful
to install Python somewhere in the root of the disk, such as ``C:\Python3``,
not in the folder suggested by default. To do this, select something like
"Customize install" and specify the necessary path on one of the following steps.

If you are working on another operating system, figure out how to install Python yourself. 
In Linux, for example, Python is included in the repositories of all leading distributions,
the package is usually called ``python3`` (and just ``python`` is the python
of the second version).

Installing Wing IDE
------------------

Python itself is only a code interpreter. It runs your programs, but doesn't contain a
convenient editor. Therefore, to write programs I advise you to use a integrated
development environment (in fact, an advanced editor) Wing IDE.

Unfortunately, Wing IDE is not a free software, but it has an official free version
for educational purposes, called Wing IDE 101. It's available for Windows, Linux and macOS.

All installation programs can be downloaded from the official Wing IDE website
(http://wingware.com /, via Download — Wing IDE 101); the installer for Windows
can also be downloaded from the course page. Please note that you need exactly
version 101, not any other! Install Wing IDE using this installer, there is nothing
complicated in it.

Wing IDE is just a *development environment* (IDE) for Python, i.e. a convenient program 
editor that allows you to easily run programs using Python (that's why you need
to install Python itself separately — Wing IDE doesn't include it). Basically,
you can use some other IDE, but then deal with it by yourself. In particular, Python itself
includes a simple development environment called Python IDLE. You can find its description
in many Python books, but it's too simple and therefore not very convenient.
There is also a popular IDE PyCharm, but for my taste, it's too complicated.

Checking the installation
-------------------------

Launch the Wing IDE. The following window will appear:

.. image:: ../python_basics/0_quick_start/wing_ide_0.png

First, make sure that in the lower right corner, on the panel entitled Python Shell,
a text similar to the one shown in the figure appeared; in particular, the Python version
that you installed should be shown there. Make sure it's version 3 (in the picture
it's version 3.5.2). If this is not, then try using the ``Edit — Configure Python`` 
menu option to specify the path to Python manually (see the picture below) — in
"Python Executable" field, you need to type something like ``C:\Python3\python.exe``
if you have installed Python in the directory ``C:\Python3``. Perhaps you also should 
add ``C:\Python3`` to the ``Python Path`` list. You may have to explore it to find
the right settings. If you have both versions of Python installed on your computer 
(both 2 and 3), perhaps the Wing IDE will "pick up" Python 2 by default. 
In this case, also manually specify that you need to work with version 3.

.. image:: ../python_basics/0_quick_start/wing_ide_config.png

If you fail, write to me [1]_, pointing where you installed Python and sending screenshots
of the main Wing IDE window and the ``Edit — Configure Python`` dialog.

The first program
----------------

In the main menu of the Wing IDE, select ``File — New``. A window for editing
the text of the program will appear. In this window, type the following text:

::

print("Test", 2*2)

(Here ``"`` is a quotation mark.)

It should turn out like this:

.. image:: ../python_basics/0_quick_start/wing_ide_1.png


Make sure there are no typos. Save the program: press Ctrl-S or select the menu option
``File — Save As``. Wing IDE will prompt you to choose a file name to save,
for the first program you can choose any name.

.. note::

Note that the Wing IDE colors your program. This is done in order to make it easier to
read. In fact, for Python the color is not important, it is made only for convenient
reading. Similarly, in this text the code is also colored, moreover, the coloring may be
slightly different (this is simply due to the system I use to write the text).
But once again: the colors are for readability only, they don't carry any more sense.
In particular, Wing IDE may color it differently than you see in this text — it's okay,
there's nothing wrong.

After that, run the program by clicking on the button with a green
triangle arrow on the toolbar above the program text. The result of the program execution
will appear in the lower right part of the screen, on the "Python Shell" panel.
Namely, there you can see one of the two possible results shown in two figures below.

If there is an inscription "Test 4":

.. image:: ../python_basics/0_quick_start/wing_ide_2.png

then everything is fine, the program has been successfully executed.

If there is a long text with the words "Traceback" (at the beginning) and
"Error" (at the end):

.. image:: ../python_basics/0_quick_start/wing_ide_3.png

then there are errors in your program. Read more about the errors below
(section :ref:`sec:ce`), and in the meantime, if you see an error,
just carefully check if you made a mistake somewhere when typing the program.

Make sure that your program works successfully (by carefully checking if you've made
any mistakes), and see what exactly is written in the "Python Shell" window. There, first,
you can see the Python header(including the version number), then the line
``>>> [evaluate tmp.py]`` (instead of ``tmp.py`` there will be the name of the file
where you saved the program). This line was printed at the moment when Wing IDE
started running your program. And finally, there is the line `Test 4`,
which was printed by the program.
Below we'll discuss why it printed exactly this.

Restart the program (green arrow) a few more times and look at the results.
You will see that the Wing IDE every time prints the string ``evaluate...`` 
before the program starts, then the program prints its own line. The output
of the program is mixed with the output of the Wing IDE — it's okay.

You can also run the program by clicking on the button with a picture looking
like a red bug. This is a slightly different execution mode which is 
more convenient for seeking errors. Try to start both this and that way 
and look at the differences (the main difference so far is that when you start
via the "red bug", the output of previous programs is overwritten).

.. _sec:ce:

Errors in the program
----------------------

Your program may contain serious errors — so that Python "does not understand" 
what you want from it (or maybe not so serious — the program works seemingly fine,
but the result is wrong). In case of such serious errors, Python will show 
a message similar to the one in the figure above. It usually starts with the word
"Traceback", and towards the end there's the word "Error".

It's more convenient to deal with errors by running the program in the "red
bug" mode. In this case, Wing IDE highlights the line near the error
in red, and writes detailed information in a special window on the right.

For now, it will be important which line was highlighted in red by the IDE — the error is 
approximately there. The text ("error message") is also important, usually containing 
the word "Error" (in the example in the figure ``Syntax Error ...``), the nimber of the
faulty line (``line 1``) is also there. At first, error messages are difficult
to understand, but over time you will learn the most common ones and 
immediately get what is wrong.

In the meantime, look carefully at the line with the error (when running through
a "bug", python highlights it in red, when running through an "arrow", it only writes
the line number) and at the surrounding lines — and try to understand what's wrong.
In the example in the figure, I forgot the second "2" number (as a result, 
it became unclear to the Python what to multiply the first one by).
(In the example in the figure, I ran the program through the "green arrow", and not
through the "red bug", so there is no line highlighted in red.)

Keep in mind that Python is not a telepath and cannot pinpoint exactly where you
made a mistake. It highlights the line where the program text first diverged 
from the language rules. Therefore, it happens that in fact your error is 
slightly above the highlighted line (and sometimes it is far above).
But nevertheless, the place highlighted by Python is usually useful
when you're searching for the error.

Try to make different mistakes in your program and see how Python reacts to them.

How this program works
----------------------
Let's take a look at how this program works. Let me remind you of its text:

::

print("Test", 2*2)

In general, any program is, first of all, a sequence of instructions that the programmer
gives to the computer, and the computer consistently (one by one) executes them.

In our program there's an only instruction: ``print("Test", 2*2)``. The instruction
``print`` means "display" (show on the screen). In parentheses after the word ``print``,
the *arguments* of the instruction are specified. They are separated by commas. Here, 
the command has two arguments: the first is `"Test"`, and the second is `2*2`.

If the argument of the ``print`` instruction is some string enclosed
in quotes (``"`` characters), then ``print`` outputs this string on the
screen as is (without quotes). Therefore, the first thing our instruction displays
on the screen is the text ``Test``.

The second argument of the ``print`` instruction in our example is
the arithmetic expression ``2*2``. If the argument of an instruction (any of them, 
not necessarily `print`, we just don't know the others yet) is an arithmetic expression,
the computer will first calculate it, and then will pass it over. Therefore, in this case,
the computer will first calculate :math:`2\cdot 2`, get 4, and then pass the result to the 
instruction ``print``, which will display it on the screen.

``print`` separates the output elements with spaces, so between
``Test`` and ``4`` there's space.

As a result, our program outputs ``Test 4``.

Using Python as a calculator
----------------------------

Таким образом можно использовать питон как калькулятор. Например, если
надо посчитать значение выражения :math:`7+3\cdot(8-2)`, то можно
написать команду ``print(7+3*(8-2))``, после чего запустить программу —
и на экран будет выведен результат. Обратите внимание, что скобки
учтутся корректно и порядок действий будет правильный. Две скобки в
конце команды — это одна является частью выражения, а вторая заканчивает
список аргументов команды ``print``.

В выражениях можно использовать следующие операторы:

-  ``+`` и ``-`` — сложение и вычитание (в том числе то, что называется
   *унарный* минус для записи отрицательных чисел: чтобы написать
   :math:`2\cdot(-4)`, надо написать ``2*(-4)``);

-  ``*`` — умножение;

-  ``/`` — деление («честное», например, :math:`5/2=2.5`);

-  ``//`` (это два символа ``/`` подряд) — неполное частное (см. ниже);

- ``%`` ­— остаток (см. ниже).

-  Скобки (только круглые) работают для группировки операций, можно
   использовать вложенные скобки, например, ``2*(3-(4+6))``.

Чуть подробнее про деления. Есть три оператора, связанных с делением:
один оператор для честного деления (``/``), и два оператора для деления с остатком
(``//`` и ``%``).  Вспомните младшие классы и деление с остатком: 16 разделить
на 3 будет 5 («неполное частное») и в остатке 1. Вот ``//`` вычисляет
неполное частное, а ``%`` — остаток. Пишется так: ``16 // 3`` и
``16 % 3``, как будто ``//`` и ``%`` — это символ операции, а-ля плюс
или звёздочка. (Пробелы вокруг ``//`` и ``%`` не обязательны, но на
питоне так принято.) (При работе с отрицательными числами результат
может показаться вам неожиданным, но это мы обсудим потом.)

Кроме того, есть так называемые *функции*:

-  Запись ``abs(-3)`` обозначает взятие числа по модулю: :math:`|{-}3|`.
   Обратите внимание: пишется сначала *имя функции* (в данном случае
   ``abs``), а потом в скобках — от чего взять эту функцию (от чего
   взять модуль в данном случае). То, что в скобках, аналогично командам
   называется *аргументом функции*.

-  Аналогично, запись ``sqrt(4)`` обозначает взятие квадратного корня
   (если не знаете, что это такое, то пока пропустите этот пункт), но,
   поскольку эта операция бывает нужна несколько реже, то чтобы ее
   использовать, в начале программы надо написать магическую строку
   ``from math import *``. Программа получается, например, такая:

   ::

       from math import *
       print(sqrt(4))

Все эти операции можно комбинировать. Например, команда
``print( (20 * 3) + sqrt( 2 + abs(5 - 7) ) )`` выведет на экран значение
выражения :math:`20\cdot 3 + \sqrt{2+|5-7|}`. Пробелы в команде
поставлены, чтобы проще было читать; вообще, в питоне пробелы можно
ставить в любом разумном месте (внутри названий команд и чисел нельзя,
но около скобок, знаков препинания и прочих символов можно), но
рекомендуется ставить их как минимум вокруг знаков действий.

В одной программе можно вычислять несколько выражений. Например,
программа

::

    print(2 * 2, 2 + 2)
    print(3 * 3)

вычисляет три выражения. Первая команда ``print`` выводит на экран две
четвёрки, разделённых пробелом. Вторая команда просто выводит одно число
9. Оно будет выведено на отдельной строке, т.к. каждая команда ``print``
выводит одну строку. Обратите еще раз внимание, что аргументы команды
разделяются запятыми.

Можно также, как мы видели раньше, смешивать текст (в кавычках) и выражения:

::

    print("Дважды два равно", 2 * 2, ".")

Простейший ввод и вывод. Переменные
-----------------------------------

Но не очень интересно писать программы, которые всегда выводят одно и то
же. Хочется, чтобы программа что-нибудь запрашивала у пользователя, и
работала с учётом того, что пользователь ввёл. Давайте, например,
напишем программу, которая будет спрашивать у пользователя два числа и
выводить на экран их сумму.

Но для этого нам придётся научиться ещё одной важной вещи. Когда
пользователь вводит два числа, программе надо их как-то запомнить, чтобы
потом сложить между собой и результат вывести на экран. Для этого у
компьютера есть память (оперативная память). Программа может
использовать эту память и положить туда числа, введённые пользователем.
А потом посмотреть, что там лежит, сложить эти два числа, и вывести на
экран.

Во многих языках, чтобы использовать память, надо особо попросить
компьютер об этом. В питоне другой подход: питон достаточно умен, чтобы
самому догадаться, что вам нужна память. Давайте напишем следующую
программу:

::

    a = input()
    print("Вы ввели ", a, "!")

Прежде чем мы разберем, что обозначают все эти команды, наберите эту
программу и попробуйте ее запустить. Сначала запустите «зеленой
стрелочкой». В окошке Python Shell появится надпись
``[evaluate ...]``, после чего будет моргать курсор, а наверху
этого окошка будет надпись «Waiting for keyboard input», что обозначает
«Ожидаем ввод с клавиатуры». Введите что-нибудь в этом окошке и нажмите
Enter. Вы тут же увидите, что то, что вы ввели, вывелось еще одной
строчкой на экран, с дополнительными словами («Вы ввели»), с дополнительными
пробелами и восклицательным знаком. Именно это и делает программа: она выводит на экран то, что
вы ей вводите, добавив еще текст.

Если вы запустите программу «красным жучком», то все будет аналогично,
только текст вам надо будет вводить в пустом окошке «Debug I/O», которое
появится на месте окошка «Python Shell».

Теперь разберем, как эта программа работает.

Команда ``input()`` обозначает «подожди, пока пользователь введет
что-нибудь с клавиатуры, и запомни то, что он ввел». Но просто так
попросить «запомнить» довольно бессмысленно, нам ведь потом надо будет
как-то сказать компьютеру, чтобы он вспомнил то, что он запомнил.
Поэтому мы пишем ``a = input()``. Это обозначает «запомни то, что ввел
пользователь, в памяти, и дальше это место в памяти мы будем называть
буквой ``a``\ ». Соответственно, команда ``print(a)`` обозначает
«посмотри, что лежит в памяти, называемой буквой ``a``, и выведи это на
экран», а команда ``print("Вы ввели ", a, "!")`` обозначает «выведи сначала
фразу ``Вы ввели``, потом то, что лежит в ``a``, потом восклицательный знак, 
и раздели это все пробелами».

Обратите внимание, что ``a`` написано без кавычек. 
Если бы мы написали ``print("Вы ввели ", "a", "!")``, то питон бы
вывел просто букву ``a`` (ну и весь остальной текст), он не понял бы,
что надо вывести то, что лежит в памяти ``a``.

Вот такие «места в памяти» называются *переменные*. Т.е. говорят:
«переменная ``a``\ ». Говорят: в первой строке мы считали, что ввел
пользователь с клавиатуры, и записали это в переменную ``a``, а во
второй строке мы прочитали, что записано в переменной ``a``, и вывели
это на экран.

В программе можно заводить несколько переменных. Простейший вариант
может выглядеть так:

::

    a = input()
    b = input()
    print(b, a)

Эта программа считывает две строки, которые вводит пользователь, и
выводит их, причем сначала вторую, а потом первую.

Но мы хотели написать программу, которая выводит сумму двух чисел.
Простой подход тут не сработает:

::

    a = input()
    b = input()
    print(a + b)

сделает вовсе не то, что вы могли ожидать: питон пока считает, что в
``a`` и ``b`` могут лежать какие угодно строки, и не понимает, что вы
имели в виду числа.

Чтобы объяснить, что вы имеете в виду числа, надо написать так:

::

    a = int(input())
    b = int(input())
    print(a + b)

Мы используем новую команду (точнее, функцию) — ``int``. Она обозначает:
возьми то, что получилось у команды ``input()`` (т.е. ту строку, которую
вводит пользователь), и преврати это в число. Пока это не надо до конца
осознавать, просто запомните, что, чтобы считать одно число, надо
написать ``... = int(input())``, где на место многоточия надо подставить
имя той переменной, куда надо записать результат.

Запустите эту программу. В окошке ввода наберите какое-нибудь число,
нажмите Enter, наберите второе число и еще раз нажмите Enter. Вы
увидете, что программа вывела их сумму.

Если вы этой программе попытаетесь ввести два числа на одной строке
(т.е. введете «2 пробел 3 Enter»), то программа выдаст ошибку. Еще бы:
вы пропросили строку «\ ``2 3``\ » превратить в число (в одно!) и
записать в переменную ``a``, но ведь это не есть верная запись одного
числа.

Чтобы вводить числа через пробел, надо использовать другую конструкцию:

::

    a, b = map(int, input().split())

Это пока магия, ее придется запомнить наизусть. Потом вы поймете, что
здесь что значит. Обратите внимание, что после слова ``int`` тут нет
скобок, а вот после ``input`` и ``split`` есть.

Так можно вводить сколько угодно чисел; например, чтобы считать четыре
числа, вводимые в одной строке, надо написать

::

    a, b, c, d = map(int, input().split())

Переменные не обязательно называть ``a`` и ``b``, можно использовать
более-менее любые строки из английских букв и цифр (есть некоторые исключения,
но пока это не так важно); например, можно было назвать переменные
``first`` и ``second``, или ``x1`` и ``x2`` и т.п. Конечно, переменных можно делать столько,
сколько вам понадобится; вообще, переменные — это основная вещь, с
которой работают программы.

Ещё несколько замечаний по нашей программе. Во-первых, программа не
вывела на экран никаких «приглашений» типа «Введите a и b». Питон ничего
за вас делать не будет; если вы хотите, чтобы программа вывела это на
экран, то так и сделайте: ``print("Введите a и b")``. Но мы не будем
выводить такие приглашения в наших программах, мы будем считать, что
пользователь сам знает, что от него требуется. В задачах, которые вы
будете решать, будет чётко написано, что надо вывести на экран — и
ничего лишнего выводиться не должно.

Присваивания
------------

Пока мы умеем записывать в переменные только то, что пользователь ввел с
клавиатуры. На самом деле, намного чаще приходится записывать в
переменные значения, которые программа сама вычисляет. Для этого есть
специальная команда, которая называется *присваивание* (и на самом деле
мы ее уже видели):

::

    a = 10

обозначает «в переменную ``a`` записать 10».

Справа от знака «равно» можно писать любые выражения (например,
``a = 10 + abs(5 - 9)``). Более того, там же можно использовать другие
переменные, в которые уже что-то записано. Например, программа

::

    a = 20
    b = a + 10
    print(b)

выведет на экран 30, потому что сначала в ``a`` записывается 20, потом
компьютер смотрит, что записано в ``a``, прибавляет 10, и результат
записывает в ``b``, потом смотрит, что записано в ``b``, и выводит на
экран.

Если в переменной уже было что-то записано, то после присваивания старое
значение затирается:

::

    a = 20
    a = 30

в результате в ``a`` лежит 30, а про 20 все забыли.

Особый интересный вариант — справа можно упоминать ту же переменную,
которая стоит слева — тогда будет использоваться ее предыдущее значение:

::

    a = 20
    a = a + 10

обозначает «в ``a`` запиши 20. Потом посмотри, что записано в ``a``,
прибавь к этому 10 и то, что получится, запиши обратно в ``a``\ ». В
итоге в ``a`` будет записано 30.

Та команда ``a = input()``, которую мы раньше видели, на самом деле тоже
является присваиванием: она говорит: «прочитай то, что пользователь ввел
с клавиатуры, и запиши это в ``a``\ ».

Слева от знака «равно» можно указывать несколько переменных через
запятую. Тогда справа тоже должно быть несколько значений через запятую
(или специальные функции типа уже упоминавшейся ``map``, но их мы
подробнее пока обсуждать не будем):

::

    a, b = 10, 20

обозначает «в ``a`` записать 10, а в ``b`` — 20».

Запись ``a = 10`` читается «переменной ``a`` присвоить 10», или кратко «``a`` присвоить 10». 
Не надо говорить «``a`` равно 10», т.к. «равно» — это не глагол, и не понятно,
какое действие совершается. Более того, если запись ``a = a + 1``
прочитать с «равно», то получается «``a`` равно ``a`` плюс один», что
никак не похоже на команду, а скорее на уравнение, которое не имеет
решений. Поэтому говорите «присвоить», а не «равно».

Есть еще ряд полезных команд, которые совмещают арифметическое действие
и присваивание. Например, запись ``a += 10`` обозначает ``a = a + 10``
(«увеличить ``a`` на 10»). Аналогично можно поступать с остальными
арифметическими действиями: ``a /= 5`` обозначает ``a = a / 5``,
``a %= 5`` обозначает ``a = a % 5``, и т.п.

Комментарии
-----------
(Эта информация вам прямо сейчас не нужна, но будет полезна при чтении дальнейших разделов.)

В программе можно оставлять так называемые *комментарии*. А именно, если где-то в программе
встречается символ «решетка» (``#``), то этот символ и все, что идет за ним до конца строки,
полностью игнорируется питоном. Таким образом можно в программе оставлять пометки для себя,
или для других программистов, которые будут читать вашу программу. Например

::

    a = int(input())  # считали число
    
Здесь запись ``# считали число`` полностью игнорируется питоном, как будто этих символов нет вообще,
а запись ``a = int(input())`` работает как и должна.
    
В частности, решетка может стоять в начале строки, тогда вся эта строка будет игнорироваться::

    # для начала, считаем число
    a = int(input())
    
Питону совершенно не важно, где и как вы оставляете комментарии, вы их оставляете только для себя,
или для других людей, которые будут читать вашу программу. В простейших программах комментарии не нужны,
и вам поначалу они не понадобятся, но я буду их использовать в дальнейших разделах этого курса,
чтобы пояснять фрагменты кода.

Язык программирования как конструктор
-------------------------------------

Выше я рассказал ряд самых основных конструкций языка питон. Теперь ваша
задача будет из этих конструкций, как из конструктора, собирать
программы. Относитесь к этому именно как к конструктору: все
программирование — это сборка больших программ из таких отдельных
команд.

Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::
    Вася купил :math:`N` булочек, а Маша — на :math:`K` булочек больше.
    Сколько всего булочек купили ребята?

    **Входные данные**: На первой строке входных данных вводится одно число :math:`N`, на второй — одно число :math:`K`.

    **Входные данные**: Выведите одно число — ответ на задачу.

    **Пример**:

    Входные данные::

        4
        2

    Выходные данные::

        10
    |
    |
    |

Ну, во-первых, надо считать данные. Два числа вводятся на двух отдельных строчках, поэтому
они считываются так::

    n = int(input())
    k = int(input())

Дальше надо понять, по какой формуле вычисляется ответ. В этой задаче несложно догадаться, что ответ равен :math:`2\cdot N + K`.
Так и выводим::

    print(2 * n + k)

Полная программа получается такая::

    n = int(input())
    k = int(input())
    print(2 * n + k)

Можно было поступить и по-другому: можно было, считав данные, сначала отдельно посчитать, сколько булочек купила Маша::

    m = n + k

после чего вывести ответ как сумму ``n`` и ``m``::

    n = int(input())
    k = int(input())
    m = n + k
    print(n + m)

Еще один альтернативный вариант — сохранить ответ в переменную, и только потом ее выводить, например, так::

    n = int(input())
    k = int(input())
    ans = 2 * n + k
    print(ans)

Все эти варианты правильные, и несложно придумать еще ряд правильных вариантов.

.. task::
    С начала суток прошло :math:`N` минут. Определите, сколько часов и минут будут показывать электронные часы в этот момент.
    Гарантируется, что :math:`N` меньше 1440, т.е. что прошло меньше полных суток.

    **Входные данные**: Вводится целое число :math:`N`.

    **Входные данные**: Выведите ответ на задачу.

    **Пример**:

    Входные данные::

        150

    Выходные данные::

        2 30
    |
    |
    |

Тут, опять-таки, надо придумать, какой математической формулой решается задача.
Если с ходу не очевидно, то подумайте: как бы вы сами решали задачу для конкретного ввода?
Вот прошло с начала суток, например, 150 минут — как понять, сколько это часов и сколько минут?

Если немного подумать, то становится понятно, что надо :math:`N` разделить с остатком на 60 (количество минут в часе),
после чего неполное частное будет как раз количеством часов, а остаток — количеством минут.
Соответственно пишем программу::

    n = int(input())
    print(n // 60, n % 60)

Также, как и в прошлой задаче, можно было ответы сохранить в переменные при желании.

.. task::
    Маше надо купить :math:`A` больших бусин, :math:`B` средних и :math:`C` маленьких.
    Одна большая бусина стоит :math:`X` рублей, средняя — :math:`Y` рублей, маленькая — :math:`Z` рублей.
    Сколько всего рублей придется потратить Маше?

    **Входные данные**: На первой строке вводятся три числа :math:`A`, :math:`B` и :math:`C`.
    На второй строке вводятся три числа :math:`X`, :math:`Y` и :math:`Z`.

    **Входные данные**: Выведите одно число — сколько рублей придется потратить Маше.

    **Пример**:

    Входные данные::

        3 2 1
        6 5 4

    Выходные данные::

        32
    |
    |
    |

Очевидно, что ответ на задачу равен :math:`A\cdot X + B\cdot Y + C\cdot Z`.
Осталось аккуратно ввести и вывести данные. Тут задаются две строки по три числа,
поэтому вводить данные надо два раза через ``map(int(...``::

    a, b, c = map(int, input().split())
    x, y, z = map(int, input().split())
    print(a * x + b * y + c * z)

.. task::
   Машина едет со скоростью :math:`N` километров в час. Выведите эту информацию по-английский
   по образцу: «The speed is :math:`N` kmph.», подставив вместо :math:`N` введенное число (см. пример).

    **Входные данные**: Вводится одно число :math:`N`.

    **Входные данные**: Выведите строку.

    **Пример**:

    Входные данные::

        55

    Выходные данные:

    .. code-block:: text

        The speed is 55 kmph.
    |
    |
    |

Считывание числа, думаю, уже не должно представлять проблем, а вот для вывода надо вспомнить,
что можно выводить не только числа, но и строки::

    n = int(input())
    print("The speed is", n, "kmph.")


Что дальше?
-----------

(Естественно, это раздел только для учеников моего курса.)

Во-первых, если вы еще этого не сделали, прочитайте на страничке курса
все тексты в «шапке» курса, особенно раздел «Работа с сайтом...», после
чего начинайте решать «Задачи на арифметические операторы». И двигайтесь
дальше.

**Внимание!** Не надо прямо сейчас читать следующие разделы этого текста, 
не надо нажимать кнопку «Next» ниже. Дальше идет теория для следующих тем,
поэтому сначала прорешайте задачи на арифметические операции на сайте,
потом уже переходите к следующим темам (по ссылкам на сайте).


И по любым вопросам пишите мне.

.. [1] Конечно, предложения «написать мне» относятся только к ученикам моего курса.
