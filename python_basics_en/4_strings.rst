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

Here, the #32 is the space character (blank area " ").

Characters enumerated from #0 to #31 are the so-called *control codes* 
which aren't really interesting to us yet (as well as the character #127),
that'swhy they aren't shown in the table. Characters with codes greater 
than #128 depend on the encoding, we will not discuss this now.
.. (See more in the :ref:`encodings section<encodings>`, but you won't need it yet.)

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

    i = ord('$')         # assign the code of dollar sign to i
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

Note that we don't need to know that the zero code is 48. We just type 
``ord('0')``, not 48, and the computer will calculate the code for us!

Сравнения символов
---------------------------------------

Символы можно сравнивать операторами =, >, <, >=, <=. На самом деле
сравниваются их коды:

::

    if ch1 == ch2:  # если два символа совпадают...
        ....
    if ch1>ch2:  # если код первого символа больше кода второго
        ....

Благодаря тому, что однотипные символы идут подряд, очень легко можно
проверять тип символа. Например, чтобы проверить, является ли символ
цифрой, можно написать:

::

    if ch>='0' and ch<='9': 
        ... 

Массивы и циклы
-----------------------

Если вам надо сделать массив, в
элементах которого хранить что-то, связанное с цифрами, то надо
переходить к кодам:

::

    a = [0] * 256  # у нас всего 256 символов
    a[ord('d')] = 10  # в элемент, соответствующий d, записали 10
    ...
    for x in range(ord('a'), ord('z')+1):
        ch = chr(x)
        print(ch)  # выводим все символы от a до z

Но вообще это продвинутая тема, сейчас пока вам не особо нужная.

Строки
------

Строка — это последовательность символов. Поэтому представляется
естественным использовать для хранения строк массив символов:

::

    s = ["T", "e", "s", "t"]
    # Но так делать не надо!


Но так делать не надо! Чтобы записать строку в переменную, надо просто записать
строку в переменную:

::

    s = "Test"

В питоне строка — это *массив*, каждым элементом
которого является символ, но это не просто массив, а массив с
дополнительными функциями.

Длину строки, как и у массива, можно узнать командой ``len(s)``:

::

    print(len(s))

Далее, строки, конечно, можно считывать и выводить. На питоне это
делается стандартными командами: вывод обычным ``print``, а ввод — обычным ``input()``,
никакой лишней конвертации не надо, пишете ``s = input()``:

::

    s = input()
    print(s)

В-третьих, строки можно складывать. Сложить две строки — значит
приписать к одной строке другую:

::

    s1 = input()
    s2 = input()
    s = s1 + s2
    print(s)  # выведет две строки одну за другой

Прибавлять можно и символы:

::

    s = s + 'A'

Наконец, *строковые константы* — это уже привычные вам
последовательности символов в кавычках:

::

    s = "Test"
    s = s + '2'
    print(s)  # выводит Test2

На самом деле, в питоне можно использовать как апострофы (символы
``'``), так и кавычки (символы ``"``)

Может возникнуть вопрос, как в строковой константе ввести собственно
символ апостроф или кавычку. Просто так написать ``'It's a string'`` не
получится, т.к.питон подумает, что строка закончилась
на втором апострофе; аналогично не сработает ``"Text"Text"``.
Поэтому надо приписывать символ ``\`` перед апострофом или кавычкой.
Например, чтобы записать в переменную строку ``It's a string``, надо
написать так:

::

    s = 'It\'s a string'
    # или так
    s = "It's a string"
    # а если нужны и апострофы, и кавычки:
    s = "It's a \"string\""

Аналогично для записи символа "апостроф"/"кавычка" в переменную типа
char:

::

    ch = '\''
    ch = "'"
    ch = "\""
    ch = '"'

Поскольку символ ``\`` имеет такой особый смысл, то чтобы записать в строку
прямо этот символ, его надо написать два раза::

    s = "test\\test\\\\test"

получится строка ``test\test\\test``.

Еще частный случай строки — *пустая* строка, т.е. строка длины ноль:

::

    s = ""  # питон

Ну и наконец, строка — это все-таки массив символов. Можно использовать
все известные вам операции над массивами (писать s[i], чтобы получить
доступ к i-му символу строки, и т.д.). Например, так можно проверить, есть ли в
строке пробелы:

::

    # питон
    for i in range(len(s)):
        if s[i] == ' ':
            ...

int и т.п.
------------------

Есть еще три полезных команды:

::

    int
    float
    str

Они переводят числа в строки и обратно, с ``int`` вы уже сталкивались.

::

    print(str(23) + 'abc' + str(45));     # выводит 23abc45
    print(float('2.5') * 2);              # выводит 5.0000e0
    print(str(2.5) + 'a');                # выводит 2.5000e0a

Другие операции
---------------

Вы знаете ряд хитрых команд работы с массивами, и иногда будет
возникать желание их использовать при работе со строками. Лучше их не
используйте, пока вы точно не будете понимать не только что, но и
насколько быстро они работают. В большинстве случаев можно обойтись без
них (и так даже будет проще!), плюс вы точно не знаете, как долго они
работают. 

Аналогично есть другие функции специально для строк, про которые вы 
можете где-то еще прочитать, например, ``find``.
Я не советую их использовать, пока вы не понимаете, как конкретно они работают
и насколько долго.

Например, пусть вам надо из строки удалить все
пробелы. Можно писать примерно так (считаем, что у вас уже есть исходная
строка ``s``):

::

    while s.find(" ") != -1:
        s = s[:s.find(" ")] + s[s.find(" ")+1:]  # вырезаем этот символ

Но это работает долго (поверьте мне :) ) и требует от вас помнить все
эти команды, а еще и осознавать не самый тривиальный код. Проще так:

::

    s1 = '';
    for i in range(len(s)):
        if s[i] != ' ':
            s1 = s1 + s[i]; 

Результат лежит в ``s1``. Поймите, как это работает.


Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::

    Дан символ. Определите, верно ли, что он является маленькой латинской буквой.

    **Входные данные**: Вводится один символ.

    **Входные данные**: Выведите ``yes``, если это маленькая латинская буква, и ``no`` в противном случае.

    **Пример**:

    Входные данные::

        t

    Выходные данные::

        yes
    |
    |
    |

Считаем символ::

    ch = input()

Далее надо проверить, является ли этот символ маленькой латинской буквой. Тут (как и в других аналогичных примерах)
нужно воспользоваться тем, что символы в таблице ASCII идут подряд. Поэтому достаточно проверить ``'a' <= ch and ch <='z'``. 
Итоговый код::

    ch = input()
    if 'a' <= ch and ch <='z':
        print('yes')
    else:
        print('no')

.. task::

    Дана цифра. Считайте ее как символ, и переведите в число (в ``int``), не пользуясь стандартными функциями типа ``int``.

    **Входные данные**: Вводится один символ — цифра.

    **Входные данные**: Выведите число.

    **Пример**:

    Входные данные::

        1

    Выходные данные::

        1
    |
    |
    |

Конечно, чтобы чисто пройти все тесты, в этой задаче можно просто вывести то же самое, что и вводится. Но давайте честно научимся превращать цифру в число.
Считываем символ::

    ch = input()

и дальше надо понять, какая это цифра. Все цифры в таблице ASCII идут подряд, поэтому достаточно из кода символа вычесть код нуля. В итоге получаем

::

    ch = input()
    print(ord(ch) - ord('0'))

.. task::

    Дана строка. Посчитайте, сколько в ней маленьких латинских букв.

    **Входные данные**: Вводится одна строка.

    **Входные данные**: Выведите одно число — ответ на задачу.

    **Пример**:

    Входные данные::

        foo bar 123

    Выходные данные::

        6
    |
    |
    |

Давайте считаем строку::

    s = input()

Далее надо пройтись по строке::

    for i in range(len(s)):

и очередной символ (:math:`s[i]`) проверить: буква это или нет. Как проверять, мы уже знаем: ``if s[i] >= 'a' and s[i] <= 'z'``.
Если буква, то увеличиваем счетчик, надо еще этот счетчик заранее завести. Итоговый код::

    s = input()
    ans = 0
    for i in range(len(s)):
        if s[i] >= 'a' and s[i] <= 'z':
            ans += 1
    print(ans)
