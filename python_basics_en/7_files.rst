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

Inputting data
--------------

Inputting analogous to standard ``input``
`````````````````````````````````````````

To read data from a file, you first need to "open the file for reading".
This is done by the following instruction::

    f = open("input.txt", "r")

Here ``input.txt`` is exactly the file from which you need to read the data, 
and the parameter ``"r"`` indicates that you are going to **r**\ead the data, 
and not write (then you should use ``"w"`` instead, see this below).

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

Чтение до конца файла
`````````````````````

Пока файл не кончился, функция ``readline`` будет вам всегда возвращать 
*непустую* строку (в ней будет как минимум символ ``"\n"``). Как только файл кончится,
``readline`` вернет пустую строку. Поэтому читать до конца файла можно так::

    f = open("input.txt", "r")
    while True:
        s = f.readline()
        if s == "":
            break
        # обрабатываем s, в частности, теперь можно вызвать s = s.rstrip("\n")


Альтернативный вариант — можно сразу считать весь файл в массив строк::

    data = open("input.txt", "r").readlines()

Теперь ``data`` — это массив строк, каждый элемент которого — это
очередная строка из входного файла. Например, если в файле было написано

::

    1 2 3
    4 5 6
    some text

то ``data`` будет содержать массив
``["1 2 3\n", "4 5 6\n", "some text\n"]``, и дальше вы можете работать с этим массивом как вам надо.

Еще можно написать ``open("input.txt", "r").read()``, это считает весь файл в одну большую строку
(в том числе в середине этой строки могут быть символы перевода строки,
но это все равно будет одна большая строка, а не массив строк).

Output
------

Для вывода данных вы можете открыть файл *на вывод*::

    f = open("output.txt", "w")

(буква ``w`` обозначает write, запись). И дальше можно использовать ``f``
в качестве опционального аргумента уже знакомой вам функции ``print``::

    print(a, b, file=f)

После окончания всего вывода рекомендуется вызвать ``f.close()``,
чтобы данные реально оказались записаны на диск
(хотя в большинстве случаев все работает и без этого).

Как это использовать в олимпиадах
---------------------------------

Основное достоинство ввода из файлов при решении алгоритмических задач
(на олимпиадах, тут на сайте и т.д.) — что вам не надо каждый раз заново
вводить весь тест. Если вы отлаживаете программу на некотором тесте,
разбираетесь, почему она не работает, пытаетесь исправить ошибки,
вы будете много раз запускать программу на одном и том же тесте.
Каждый раз его вводить — сложно и долго. Намного проще его один раз записать в файл,
и дальше делать ввод из файла.

Вторая причина использовать файлы — вы намного легче можете «жонглировать» тестами.
Вы можете записать несколько тестов в другой, вспомогательный, файл,
и просто копировать нужный тест во входной файл.
Более того, в большинстве случаев вы можете даже хранить много тестов
прямо во входном файле. 

А именно, во многих задачах у вас чтение данных идет не до конца файла
— например, вы считываете только два числа, или только одну строку, или вам 
задается число ``N`` и дальше ``N`` чисел — во всех этих случаях
программе не важно, что идет после этих данных. Вы там можете хранить
другие тесты, а потом, когда вам нужно, переносите просто нужный тест
в самое начало файла.

(А вообще, можете даже написать программу так, чтобы она обрабатывала
вообще все тесты, которые есть во входном файле — это так называемый мультитест.
На тестирующем сервере будет только один тест, и программа отработает только 
его, а при вашем тестировании программа будет сразу запускаться на многих тестах.
А еще, бывают задачи, где во входных данных сразу мультитест, т.е. задается сразу много тестов.
Тогда тем более вы можете тестировать сразу на многих тестах.)

Ну и при :ref:`стресс-тестировании <stresstesting>` ввод из файла вам тоже будет удобнее.
