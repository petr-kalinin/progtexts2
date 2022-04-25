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
entering data via  ``input``, setting variables' values, printing data, other ``if``-s, whatever you need
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

First, these can be "simplest" conditions. You can take two arbitrary expressions and compare them in some way.
THe following operators are used for comparison:

- ``==`` used for equality check. Script ``if a == 137`` means "if variable ``a`` is equal to 137". Note that here
we have two equality symblos because single equality symbol is used for assignment, which cannot be used in ``if``
(and that would be quite senseless).
- ``>`` — greater than: ``if a > 137:`` means "if value of variable ``a`` is greater than 137".
- ``<`` — less than.
- ``>=`` — greater than or equal to. Note that it's typed in a similar way to how we spell it: "greater than or equal to", so it's ``>=``, not ``=>``.
- ``<=`` — less than or equal to. As the previous one, typed exactly like ``<=``, not ``=<``.
- ``!=`` — not equal.

On the left and on the right of the operator you can put any expressions.
These can be just numbers or variables, but can also be complex, such as this::

    if sqrt(a*b+10) >= abs(2*(3-c)) + 5:

Logical operators
--------------------

Second, you can combine several conditions in your ``if``.
E.g., if you need to check that ``a == 10`` **and** ``b == 20``, here you go::

    if a == 10 and b == 20:

The code under the condition will be run only if **both** of stated simple conditions
are true, i.e. only if ``a == 10`` and ``b == 20`` at the same time.


Есть следующие такие операторы («логические операторы»):

- ``and`` — И. Проверка ``... and ...`` срабатывает, только если оба условия, замененные на ``...``, верны.
- ``or`` — ИЛИ. Проверка ``... or ...`` срабатывает, если верно хотя бы одно из двух указанных условий (или оба одновременно).
- ``not`` — НЕ. Оно применяется к одному условию (а не к двум, как выше) и инвертирует его значение: ``not ...`` срабатывает, только если
  условие, замененное на ``...``, *неверно*.

Например::

    if a == 0 or not (b > 0 and c < 0):

сработает, если ``a`` равно нулю, или если не выполняется условие «одновременно ``b>0`` и ``c<0``». 

Обратите внимание на скобки для указания порядка действий;
если бы вы написали без скобок ``if a == 0 or not b > 0 and c < 0:``, то было бы непонятно,
к чему относится ``not`` и в каком порядке надо делать действия.

Более конкретный пример про скобки: сравните следующие два выражения::

    if a == 0 and (b == 0 or c == 0):

::

    if (a == 0 and b == 0) or c == 0:

Эти выражения имеют разный смысл; например, ситуация ``a==1``, ``b==1``, ``c==0`` подходит под второе выражение,
но не под первое. Поймите, почему, и заодно подумайте, какие есть еще случаи,
в которых значения этих выражений отличатся. 

Поэтому в любых сложных логических выражениях надо обязательно ставить скобки для указания порядка действий.
Запись просто ``if a == 0 and b == 0 or c == 0`` обозначает непонятно что. Конечно, компьютер выберет некоторый порядок действий,
но лучше всегда указать его явно.

Еще замечу, что выше все примеры для простоты были с разными переменными и с простыми сравнениями. Конечно,
с логическими операторами можно использовать любые другие выражения, например ::

    if a + 24 < b * 3 or (sqrt(a + 2) > b + a and a > 3):

И наконец, логические операторы работают только с логическими выражениями — со сравнениями, либо 
с выражениями, которые уже составлены из сравнений и логических операторов. То есть следующая запись::

    if a or b == 0:

вовсе **не** обозначает «если ``a`` или ``b`` равны нулю», потому что сравнение ``==0`` тут относится только к ``b``,
а левая часть оператора ``or``, в которой написано просто ``a``, не является сравнением.
Запись ``if a:`` не имеет смысла (представьте себе, что ``a==40``; что тогда обозначает запись «если 40»? Не «если 40 больше нуля», 
а просто «если 40»), потому и запись ``a or b == 0`` не имеет смысла. И даже если вы поставите скобки: ``if (a or b) == 0``,
это тоже не будет работать, потому что совершенно непонятно, чему равно, например, ``40 or 30``.

.. note::
  
    На самом деле сказанное в предыдущем абзаце, конечно же, не совсем верно. Запись ``if a:`` в питоне обозначает «если ``a`` не равно нулю», соответственно запись
    ``if a or b == 0`` обозначает «если ``a`` **не** равно нулю, или ``b`` равно нулю». Но это вовсе не то, чего вы могли ожидать,
    и вообще, таким наявным сравнением с нулем лучше не пользоваться, за исключением особых случаев. Если вы хотите сравнить переменную
    с нулем, так явно и пишите: ``if a == 0`` и т.п.

.. note::

    Запись ``if (a or b) == 0`` тоже на самом деле имеет некоторый смысл, но тоже не тот, который вы можете подумать.
    Но поясню эту ситуацию чуть подробнее. Питон, как и любой язык программирования — он достаточно формален и не понимает чистого человеческого языка,
    пусть даже иногда кажется, что понимает. В частности, любые выражения, что арифметические, что вот такие логические,
    питон вычисляет по порядку. Вас в школе учили вычислять значение арифметических выражений с учетом порядка действий: например,
    если есть выражение ``10 + 20 * 30``, то надо сначала умножить ``20 * 30``, получить 600, и потом вычислить ``10 + 600``.
    Аналогично выражение ``(a or b) == 0`` вычисляется так: надо сначала вычислить ``a or b``, и только полученный результат уже сравнивать с нулем.
    А вовсе не сравнить с нулем отдельно ``a`` и отдельно ``b``, как вы могли бы подумать.

.. note::

    И конечно тут правильнее говорить про *логический тип данных* — это собственно то, что получается в результате сравнений
    и логических операций, и то, что можно использовать в ``if``. Это тип данных, который может хранить
    только два значения, которые в питоне называются ``True`` (истина, условие верно) и ``False`` (ложь, условие неверно), 
    например, у выражения ``10 > 0`` результат будет ``True``,
    а у выражения ``True and False`` результат будет ``False``. И, например, если у вас написано::

        (10 > 0) and (8 > 10)

    то питон поступает так: он сначала вычисляет значение ``10 > 0``, получает ``True``, потом вычисляет ``8 > 10``,
    получает ``False``, потом вычисляет ``True and False``, получает ``False``, т.е. условие не верно.

    Но для базового понимания того, как работает ``if``, это пока не нужно.

.. highlight:: python

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

Please note that you cat put an ``if``-statement inside of another ``if``-statement,
and its body will accordingly need an additional indent. In this example,
``print("That's also zero!")`` will be executed only if ``b`` is also equal to zero
but ``print("-----")`` will run regardless of ``b`` value (but of course it needs ``a`` to be zero).

Once again, as stated in the previous section: Python, as any other programming language,
is a constructor. Actually, programming is the assembly of a big program from small "bricks"
which are statements. So you can use any of these bricks inside of the ``if``-statement.

else и elif
-----------

То, что мы писали выше — это, как говорят, краткая форма ``if``. Она указывает только что делать, если условие *выполнилось*.
Есть полная форма ``if``, она указывает, что делать, если условие выполнилось, а что делать, если оно *не выполнилось*::

    if a == 0:
        print("Ноль")
    else:
        print("Не ноль")

Часть «что делать, если условие не выполнилось», начинается с команды ``else:`` (с двоеточием!), причем она должна быть на том же уровне отступа,
что и сам ``if``. Под ``else``, как и под ``if``, можно писать любые команды,
тоже с дополнительным отступом.

Пример::

    if a == 0:
        if b == 0:
            print("Два нуля")
        else:
            print("Только b не ноль")
    else:
        if b == 0:
            print("Только a не ноль")
        else:
            print("Обе переменные не нули")

Естественно, в ``else`` нельзя писать никаких еще условий — питон будет выполнять там код всегда, если условие соответствующего ``if``
не выполнилось. Иногда бывает нужно, если условие ``if`` не выполнилось, то проверить какое-нибудь еще условие.
Это, конечно, можно писать так::

    if a < 0:
        print("Отрицательное")
    else:
        if a == 0:
            print("Ноль")
        else:
            print("Положительное")

Но это длинновато и сложно, плюс если таких вариантов много, то получится очень большой отступ. Поэтому есть еще специальная команда
``elif``, обозначающая ``else if``. Можно писать так::

    if a < 0:
        print("Отрицательное")
    elif a == 0:
        print("Ноль")
    else:
        print("Положительное")

Это полный эквивалент предыдущего кода, только чуть покороче и — главное — без лишних отступов ступенькой.
Еще раз: ``elif`` — это просто сокращение от ``else if``, позволяющее чуть красивее писать код, ничего больше.

Еще пример::

    if d = "Notrh":
        print("Идем на север")
    elif d == "South":
        print("Идем на юг")
    elif d == "West":
        print("Идем на запад")
    elif d == "East":
        print("Идем на восток")
    else:
        print("??!!")

То же самое можно было бы написать и через ``else``/``if``, но были бы очень некрасивые отступы.

Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::

    Кондиционер включается, если в комнате температура больше 20 градусов; если же температура 20 градусов или ниже,
    кондиционер выключается [1]_. Напишите программу, которая определит, что будет делать кондиционер.

    **Входные данные**: Вводится одно целое число — текущая температура в комнате.

    **Входные данные**: Выведите строку ``on``, если кондиционер включится, и ``off``, если выключится.

    **Пример**:

    Входные данные::

        22

    Выходные данные::

        on
    |
    |
    |

Надо считать одно число, дальше написать сравнение с 20 и, в зависимости от результата, вывести одну из двух строк::

    n = int(input())
    if n > 20:
        print("on")
    else:
        print("off")

.. task::

    Новая модель кондиционера учитывает еще и влажность в помещении. Поскольку при охлаждении влажность повышается,
    то кондиционер ни в коем случае не включается, если влажность в помещении превышает 80%.

    Кроме того, на этом кондиционере требуемую температуру можно настраивать с пульта. Таким образом, если пользователь выставил
    с пульта температуру :math:`T` градусов, то кондиционер включается, если температура в комнате строго больше :math:`T`, а влажность 80% или ниже.
    Если же хотя бы одно из условий не выполняется, то кондиционер выключается.

    **Входные данные**: На одной строке вводятся три числа — выставленная пользователем температура (:math:`T`), 
    текущая температура в комнате и текущая влажность в комнате. Температуры указаны в градусах, влажность — в процентах.

    **Входные данные**: Выведите строку ``on``, если кондиционер включится, и ``off``, если выключится.

    **Пример**:

    Входные данные::

        20 22 60

    Выходные данные::

        on
    |
    |
    |

Тут надо написать чуть более сложное условие: если температура превышает заданную, а влажность не превышает, то кондиционер включается, иначе нет::

    t0, t1, h = map(int input().split())
    if t1 > t0 and h <= 80:
        print("on")
    else:
        print("off")

Обратите внимание, что надо очень аккуратно писать строгие или нестрогие условия («больше» или «больше или равно»; аналогично «меньше» 
или «меньше или равно»).
В условии сказано, что кондиционер включается, только если температура **строго выше** заданной (т.е. «больше», а не «больше или равна»),
а влажность **не превышает** 80% (т.е. «меньше или равна», а не «меньше»).

.. task::

    У Маши в комнате висит простой кондиционер. Он включается, если в комнате температура больше 20 градусов; если же температура 20 градусов или ниже,
    кондиционер выключается. Маша хочет охладить комнату, но она умная и понимает, что если температура воздуха на улице ниже, чем в комнате, 
    то надо не включать кондиционер, а открыть окно. Напишите программу, которая определит, что будет делать Маша.

    **Входные данные**: На первой строке вводится одно число — температура в комнате. На второй строке одно число — температура на улице.

    **Входные данные**: Выведите строку ``ac on``, если Маше надо включить кондиционер и он включится, ``ac off``, если Маша
    попробует включить кондиционер, но он не включится, и ``open window``, если Маше достаточно просто открыть окно.

    **Пример**:

    Входные данные::

        22
        10

    Выходные данные:

    .. code-block:: text

        open window

    Входные данные::

        18
        20

    Выходные данные::

        ac off
    |
    |
    |

Сначала, конечно, надо считать два числа::

    t_in = int(input())
    t_out = int(input())

Тут (как и во многих других задачах) есть несколько способов решения. Можно, например, сначала написать условие, когда стоит включать кондиционер:
``if t_in <= t_out``, и дальше внутри этого ``if``'а разобрать ситуацию с кондиционером. Полный код получится такой::

    t_in = int(input())
    t_out = int(input())
    if t_in <= t_out:
        if t_in > 20:
            print("ac on")
        else:
            print("ac off")
    else:
        print("open window")

Но можно и сделать так, чтобы вложенные ``if``'ы не были нужны, сначала проверив, не стоит ли открыть окно::

    t_in = int(input())
    t_out = int(input())
    if t_in > t_out:
        print("open window")
    elif t_in > 20:
        print("ac on")
    else:
        print("ac off")

.. task::

    На уроке физкультуры тренер говорит «на первый-второй рассчитайтесь». Вася стоит :math:`N`-ым по счету. Что он скажет, «первый» или «второй»?

    **Входные данные**: На первой строке вводится одно число :math:`N`.

    **Входные данные**: Выведите строку ``first``, если Вася скажет «первый», и ``second``, если «второй».

    **Пример**:

    Входные данные::

        3

    Выходные данные:

    .. code-block:: text

        first
    |
    |
    |

Очевидно, ответ зависит от того, четное число :math:`N` или нет. Четность числа можно проверить, взяв остаток от деления на 2::

    n = int(input())
    if n % 2 == 1:
        print("first")
    else:
        print("second")


.. [1] Конечно, настоящие кондиционеры работают не совсем так, у них пороги включения и выключения разные (так называемый гистерезис).

