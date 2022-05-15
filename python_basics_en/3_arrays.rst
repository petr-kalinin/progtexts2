.. highlight:: python

Arrays
======

It's a typical situation in programming that you need to work with 
a large number of variables that are all of the same type. 
For example, suppose you need to save the height of everybody in
the class — this is a huge amount of integers. You can use one variable 
for each student, but this is highly inconvenient. Arrays 
were designed specifically for this purpose.

General idea
------------

An array is a kind of variable (more strictly, a data type) 
in which a number of values can be stored. 
(In Python it's also called "list", in this particular case
it's the same, but in other programming lanugages
"list" and "array" mean radically diffrernt things)
You can imagine an array like kind of cell sequence, where in each cell
a certain number is written.

|image0|

These cells are enumerated consecutively, **starting from zero**.

On the figure above, the numbers inside the cells represent the values 
stored in the array (they're also called *elements* of the array)
and the numbers under the cells are the "numbers of these elements" 
(they're also called *indices* of the elements).
For example, an element with index 2 has the value -3.
Note that there are 6 elements in the array, but the last one has 
index 5, because the numbering starts from zero. This is important!

So, one variable can store the entire array.
Such an array can be created, for example, by listing all the values in
square brackets::

    a = [7, 5, -3, 12, 2, 0]

Now this array is wholly stored in ``a``.  

Array elements can also be accessed through square brackets:
``a[2]`` is element number 2, i.e. in our case it is ``-3``.
Similarly, ``a[5]`` is ``0``. You can put any arithmetic expressions
and even other variables into square brackets: ``a[2*2-1]`` is ``12``, 
``a[i]`` means "take the element with the index equal to the value of 
the variable ``i``", similarly ``a[2*i+1]`` means "take the element 
with the index equal to ``2*i+1``", and even ``a[a[4]]`` means 
"take the element whose index is equal to the value of the fourth
element of our array" (in our example, ``a[4]`` is ``2`` so
``a[a[4]]`` is `a[2]", i.e. ``-3``)

If the specified number is too big (greater than the length of the array),
then Python will stop running the program and output an error 
(i.e. in the example above, ``a[100]`` will cause an error, and even
``a[6]`` too). If a negative number is given, then a tricky
rule applies here. Negative numbers define enumerating the array from the end:
``a[-1]`` is always the last element, ``a[-2]`` is the one before last, 
and etc. In our example, ``a[-6]`` is 7. Too big negative number 
will also cause an error (in our example, ``a[-7]`` is already faulty).

You can work with array elements as with usual variables.
You can assign values to them: ``a[3] = 10``, input from keyboard:
``a[3] = int(input())``, output to the screen: ``print(a[3])``,
use in expressions: ``a[3+i*a[2]] = 3+abs(a[1]-a[0]*2+i)``
(here ``i`` is some sample integer variable), use in if: 
``if a[i]>a[i-2]: ...``, or ``for a[2] in range(n)``, etc.
Wherever you've used variables before, you can also use
an element of the array.

Iterating over the array
------------------------
Usually you need to work with all the elements at once. More precisely,
not with all the elements simultaneously but with each one in order 
(it's called "run through the array" or "iterate over the array"). 
The ``for`` loop is quite useful for this. If you know that there are 
``n`` elements in the array (i.e. if you have a variable `n` and 
it stores the number of elements in the array), then it is done like this:
::

    for i in range(n):
        ... processing element a[i]

For example, let's display all the elements 
of the array on the screen:
::

    for i in range(n):
        print(a[i])

or increase every element of the array by one:
::

    for i in range(n):
        a[i] += 1

And so on Of course, you can perform several operations in the loop 
if you need. Note that there's no magic, this just fully corresponds 
to what you already know about the ``for`` loop.

If there's no such variable ``n``, you can always use a special 
``len`` function which returns the number of elements in
the array::

    for i in range(len(a)):
        ...

Of course, you can use ``len`` anywhere, not just in
the loop header. For example, you may just output the 
length of the array: ``print(len(a))``.

Array operations
----------------

Here's a set of useful operations which can be applied to arrays:

-   ``a[i]`` (repeating it just to make it easier to find) — 
    returns the element of the array with the index (number) ``i``.
-   ``len(a)`` (repeating it just to make it easier to find) — 
    returns the length of the array.
-   ``a.append(x)`` — appends a new element with the value ``x``
    to the array. As a result, the length of the array increases by 1.
    Of course, any arithmetic expression can be used instead of x.
-   ``a.pop()`` — symmetric to the previous one, removes the last 
    element from the array. The length of the array decreases by 1.
    If you need to save the value of the deleted element, you may just 
    save the result of the call to a new variable: ``res = a.pop()``.
-   ``a * 3`` — returns an array obtained by appending the array ``a`` to itself 
    three times. For example, ``[1, 2, 3] * 3`` will return
    ``[1, 2, 3, 1, 2, 3, 1, 2, 3]``. Of course, instead of the number 3 
    here can be any arithmetic expression. The most common use of this
    construction is such: if you need an array of length ``n`` filled with,
    for example, zeros, just write ``[0] * n``.
-   ``b = a`` — assignment of arrays. Now in ``b`` is written exactly
    the same array as in ``a``. The same — in the literal sense: now
    ``a`` and ``b`` mean **the same array**, and all **changes in** ``b`` 
    **will be reflected in** ``a`` **and vice versa.** Once again,
    because this is very important. Assigning arrays (and generally any 
    complex objects) in python **does not copy the array**, but simply 
    makes both variables refer to the same array, and via changing 
    any of them you in fact change one array. But actually at the same time 
    there are many nuances, just be ready for the unexpected things.
-   ``b = a[1:4]`` ("slice") — makes a new array consisting of elements
    the old array beginning from the first (remember numbering from zero!)
    and ending with the third (i.e. up to the fourth but not inclusive,
    similar to how ``range`` works); this array is saved to ``b``.
    For the example above, it will result ``[5, -3, 12]``. Of course, 
    istead of 1 and 4 can be any arithmetic expression. Moreover, these
    indexes can be omitted. If so, the beginning and the end of
    the original array will be implied respectively. For example, 
    ``a[:3]`` means the first three elements of the array
    (zero, first and second),
    ``a[1:]`` — all elements except zero,
    ``a[:-1]`` — all elements except the last one (!), and 
    ``a[:]`` is a copy of the entire array. And this is exactly
    a **copy**, i.e. the notation ``b = a[:]`` naturally copies
    the array, the resulting arrays are not related in any way,
    and here changes in ``b`` will not affect ``a`` (unlike ``b = a``).

How to input and output an array
--------------------------------

How to input an array? At first, let's assume that all its elements
are on the one line of the input file. Then there are two ways.
The first is rather long but pretty clear::

    a = input().split()  # reading a line and  splitting it in places of spaces
                         # the result is already an array, but Python doesn't yet know it contains numbers
    for i in range(len(a)):
        a[i] = int(a[i])  # taking each element and turning it into an integer number

The second one is shorter but looks kind of magic::

    a = list(map(int, input().split()))


May seem scary, but in fact you've already seen ``map(int, input().split())``
in this construction::

    x, y = map(int, input().split())

where you had to input two numbers from one line.
This instruction set inputs a string (``input()``),
splits it according to location of spaces (``.split()``)
and turns each of the resulting strings into an integer number (``map(int, ...)``).
When reading an array it's all the same, but besides 
you also need to wrap it into ``list(...)`` to 
explicitly tell Python that you need the result as an array
(as ``list`` is a regular name for array type in Python).

Which of these two way to use for reading arrays from one line?
You may choose yourself, there's no significant difference.

Note that in both ways you don't need to know in advance
how many elements will the array contain — you will get as many
as the quantity of numbers in the string. In tasks it's
really typical that first the number of elements is given,
and then (usually on the next line) the elements themselves are set.
This is convenient in Pascal, C++, etc., where there is no way 
to easily read numbers up to the end of the line.
In Python you don't need it, as you cal easily read at once all
the elements of the array up to the end of the line.
So you have to read the given number of elements
but have no need to use it afterwards::

    n = int(input())  # n is not used anymore
    a = list(map(int, input().split()))

There's also an option that one value in each line is given.
Then it's good to know their overall quantity. Usually 
in such case the data is given exactly in the following way:
first the number of elements, then the elements themselves,
one per line. Then the input is quite easy::

    n = int(input())
    a = []  # an empty array, i.e. of zero length
    for i in range(n):
        a.append(int(input()))  # reading a number and appending it to the end of the array

Besides what we've just discussed, there are more complex cases, such as:
a sequence of lines with one element in each line, ending with zero,
or the number of elements and then elements themselves on the same line.
Think of processing them by yourself (you may do it now or later when you'll
come across them in problems). Now you already know everything you need for that.

How to output an array? If it's ok to write one element in one line, it's simple::

    for i in range(len(a)):
        print(a[i])

Whereas if you need to put all elements in one line, there are two ways.
First, you may use ``print`` with a special parameter ``end=" "``
which means "terminate the output with a space (instead of line break)"::

    for i in range(len(a)):
        print(a[i], end=" ")

There's another, more simple way::

    print(*a)

This magic means the following: "take all the elements of the array ``a``
and pass it as separate arguments to the ``print`` instruction".
So, it's like ``print(a[0], a[1], a[2], ...)``. 

Two-dimensional (2D) arrays
---------------------------

Above, the array elements were only numbers. But in fact,
array elements can contain anything, including other arrays. For example::

    a = [10, 20, 30]
    b = [-1, -2, -3]
    c = [100, 200]
    z = [a, b, c]

What's going on here? Three usual arrays ``a``, ``b`` and ``c`` are created, 
and then the array ``z`` is created, whose elements are
exaclty the arrays ``a``, ``b`` and ``c``.

What does it mean? For example, ``z[1]`` is element #1 of the array
``z``, i.e. it's ``b``. But ``b`` is also an array, so 
``z[1][2]`` is the same as `b[2]`, i.e. ``-3`` (do not forget
that the enumeration of array elements starts from zero).
Similarly, ``z[0][2] == 30``, etc.

The same thing can be implemented easier::

    z = [[10, 20, 30], [-1, -2, -3], [100, 200]]

Here we got what's called two-dimensional array. You can 
as well represent it as one of the two following tables: 

|image1| |image2|

The first table should be interpreted like this: if you see ``z[i][j]``,
then you need to take row number ``i`` and column number ``j``.
For example, ``z[1][2]`` is the element on row #1 and column #2, i.e. -3. 
The second table should be interpreted like this: if you see ``z[i][j]``,
you need to take the column number ``i`` and the row number ``j``.
For example, ``z[1][2]`` is the element on column #2 and row #1, i.e. -3.
So, in the first table the row is the first index of the array
and the column is the second index, while in the second table it's vice versa.
(It's typical to use ``i`` as the first index and ``j`` as the second.)

When you think of the tables, the important thing is that Python
doesn't really know anything about rows and columns. For Python, there's 
only the first index and the second index, and whether it's a row or a column — 
you may decide for yourself, Python doesn't care. So, ``z[1][2]`` and ``z[2][1]`` 
are different, and Python certainly distinguishes that. But will 1 be
the row number or column number — that's your business, Python knows nothing 
about rows and columns. You may choose it as you wish, choose the one that is
better for your perception. You can use the first figure or the second one
— but it's highly important not to get confused and to use it 
in a unified way throughout your program. Or you may even throw away rows and
columns and just think of the first and second index.

Also note that in our example ``z[2]`` (the array which is the
second element of array ``z``) is shorter than other arrays
(that's why there's no number in the lower right corner of both tables).
It's a general rule: Python doesn't require the inner arrays to be
of the same length. You can easily create subarrays of different size, like this::

    x = [[1, 2, 3, 4], [5, 6], [7, 8, 9], [], [10]]

here the array number zero has length 4, the first one has length 2,
the second one has length 3, the third has length 0 
(it does not contain any elements), and the fourth has length 1.
This happens to be essetinal, but not so often,
in simple problems you will have all the subarrays of the same length.

(In fact, elements of one array even do not have to be of the same type.
You can type this: ``y = [[1, 2], 3, 4]``. Here the zero element
of the array ``z`` is an array itself, and two following elements are just
numbers. But it's needed very rarely.)


Operations for 2D arrays
------------------------

Actually, there are no new operations specific for two-dimensional arrays.
You always work either with an external array, or with an internal array, 
and you can use all the operations that you know for one-dimensional arrays.
For example, ``len(z)`` is the length of the "outer" array (according to 
the example above, it will return 3 because ``z`` contains three elements,
and it doesn't matter that each of them is also an array),
and ``len(z[2])`` is the length of the internal array on position 2
(i.e. 2 in the example above). For the array ``x`` above
(the one where each subarray has its own length) we get
``len(x) == 5``, and, for example, ``len(x[3]) == 0``.

All other operations work in a similar way. ``z.append([1,2])``
appends another internal array to the end of external array,
and ``z[2].append(3)`` appends the number 3 to the "inner" array
that is ``z[2]``. Then, ``z.pop()`` removes the last
internal from the external array, and ``z[2].pop()`` removes the last
element from the "inner" array on position 2. The same are slices 
(``z[1:2]``, ``z[1][0:1]``) and all other operations that I listed above.


Iterating over a 2D array
-------------------------

Of course, to iterate over all values of a two-dimensional array,
you need to iterate over all "inner" arrays.
To do it, you need a ``for`` loop for each "inner" array
and another ``for`` to iterate over these "inner" arrays,
as follows::

    for i in range(len(z)):
        # iterating over "inner" array z[i]
        for j in range(len(z[i])):
            ...processing element z[i][j]

Creating a 2D array
-------------------

Unexpectedly, a non—trivial operation is the creation
of a two-dimensional array of a certain size filled, for example,
with zeros. As described above, a one-dimensional array 
of length ``n`` can be created via ``[0] * n``.
So you may expect that writing ``a = [[0] * m] * n``
will create a two-dimensional array of size ``n x m``
(we want the first index of the array to range from 0 to ``n-1``
and the second index from 0 to ``m-1``, therefore, 
it is exactly ``[[0] * m] * n``, not ``[[0] * n] * m``).
Sadly, it won't work in the way you might think. Again, the point is 
that in Python arrays are not wholly copied by default. So the result
here is an external array of length ``n`` where *each* element
corresponds to **the same* array of length ``m``.
As a result, if you change ``a[1][2]`` for example,
then ``a[0][2]`` will also change, and ``a[3][2]``, and etc. 
— because all internal arrays actually correspond to the same array.

Therefore, an array of size ``n x m`` is created, for example, like this::

    a = []
    for i in range(n):
        a.append([0] * m)

Here, the new "inner" array is appended to ``a`` manually ``n`` times. 

Or you can do it via another single-line magic::

   a = [[0] * m for i in range(n)]

I won't yet describe in details how it works, you may 
just learn it by heart. Or use the previous option.

Note here that an important point is whether we want ``n``
to correspond to the first index or to the second. In the examples above,
``n`` is the range of the first index (i.e., the size of the "outer" array)
and ``m`` is the range of the second index (i.e., the size of each "inner" array).
If you want, you can do vice versa, but it's up to you to decide and
do it in a unified way throughout the program.


Input and output of a 2D array
------------------------------

Обычно двумерный массив вам задается как ``n`` строк по ``m`` чисел в
каждой, причем числа ``n`` и ``m`` вам задаются заранее. Такой двумерный
массив вводится эдакой комбинацией двух способов ввода одномерного
массива, про которые я писал выше:

::

    n, m = map(int, input().split())  # считали n и m из одной строки
    # m дальше не будет нужно
    a = []
    for i in range(n):
        a.append(list(map(int, input().split())))

Мы считываем очередную строку и получаем очередной "внутренний" массив:
``list(map(int, input().split()))``, и приписываем его (``append``) ко
внешнему массиву.

Обратите внимание, что здесь мы уже четко решили, что первый индекс
нашего массива соответствует *строкам* входного файла, а второй индекс —
столбцам, т.е. фактически мы уже выбрали левую из двух картинок выше. Но
это связано не с тем, как питон работает с двумерными массивами, а с
тем, как заданы входные данные во входном файле.

Вывод двумерного массива, если вам его надо вывести такой же табличкой,
тоже делается комбинацией способов вывода одномерного массива, например,
так:

::

    for i in range(len(a)):
        print(*a[i])

или так:

::

    for i in range(len(a)):
        for j in range(len(a[i])):
            print(a[i][j], end=" ")
        print()  # сделать перевод строки

Multidimensional arrays
-----------------------

Аналогично двумерным, бывают и трехмерные и т.д. массивы. Просто каждый
элемент "внутреннего" массива теперь сам будет массивом:

::

    a = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]

Здесь ``a[0]`` — это двумерный массив ``[[1, 2], [3, 4]]``, и ``a[1]`` —
двумерный массив ``[[5, 6], [7, 8]]``. Например, ``a[1][0][1] == 6``.

Многомерные массивы в простых задачах не нужны, но на самом деле бывают
полезны и не представляют из себя чего-то особо сложного. С ними все
аналогично тому, что мы обсуждали про двумерные массивы.

.. |image0| image:: data:image/png;base64,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

.. |image1| image:: data:image/png;base64,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

.. |image2| image:: data:image/png;base64,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

Примеры решения задач
---------------------

Приведу несколько примеров задач, аналогичных тем, которые встречаются на олимпиадах
и в моем курсе.

.. task::

    В классе :math:`N` школьников. На уроке физкультуры тренер говорит «на первый-второй рассчитайтесь».
    Выведите, что скажут ученики — сначала сформируйте массив с числами, а потом его вывдите.

    **Входные данные**: Вводится одно целое число — количество человек в классе.

    **Входные данные**: Выведите последовательность чисел 1 и 2, в том порядке, как будут говорить школьники.

    **Пример**:

    Входные данные::

        5

    Выходные данные::

        1 2 1 2 1
    |
    |
    |

Это в некотором плане искусственная задача, потому что массивы тут на самом деле не нужны.
Но давайте представим себе, что нам действительно надо сформировать такой массив.
Для этого есть два подхода.

Во-первых, мы можем сразу заготовить «пустой» массив длины :math:`N`. Точнее, конечно, не пустой,
а заполненный чем-то, не важно, чем, пусть, для примера, числами :math:`-1`::

    n = int(input())
    a = [-1] * n

Далее нам надо собственно установить в массиве элементы в правильные значения.
Для этого надо сделать какие-то действия с каждым элементом массива,
т.е. надо написать цикл::

    for i in range(len(a)):

На каждой итерации цикла нам надо решить, что делать с текущим, т.е. :math:`i`-м, элементом массива.
В зависимости от четности :math:`i` надо записать туда или 1, или 2::

    if i % 2 == 0:
        a[i] = 1
    else:
        a[i] = 2

Ну и наконец вывести массив, чтобы вывести в одну строку, надо написать

::

    print(*a)

Итоговый код::

    n = int(input())
    a = [-1] * n
    for i in range(len(a)):
        if i % 2 == 0:
            a[i] = 1
        else:
            a[i] = 2
    print(*a)

Альтернативное решение — создать сначала пустой массив, а дальше приписывать к нему числа по одному::

    n = int(input())
    a = []
    for i in range(n):
        if i % 2 == 0:
            a.append(1)
        else:
            a.append(2)
    print(*a)

.. task::

    Дан массив из :math:`N` чисел. Выведите их в обратном порядке.

    **Входные данные**: На первой строке вводится одно целое число :math:`N`. На второй строке вводятся :math:`N` чисел — заданный массив.

    **Входные данные**: Выведите массив в обратном порядке.

    **Пример**:

    Входные данные::

        5
        10 30 20 40 50

    Выходные данные::

        50 40 20 30 10
    |
    |
    |

Во-первых, считаем массив. Тут задается сначала число элементов, на следующей строке — сами элементы массива.
В питоне нам число элементов не нужно, мы можем использовать функцию ``len``, но считать число элементов все равно надо,
потому что оно есть во входных данных::

    n = int(input())
    a = list(map(int, input().split()))

Далее надо вывести элементы в обратном порядке. Это можно сделать разными способами.

Например, можно взять срез, дающий элементы в обратном порядке, сохранить в другой массив и вывести::

    b = a[::-1]
    print(*b)

или сразу, без промежуточной переменной::

    print(*a[::-1])

Полный код::

    n = int(input())
    a = list(map(int, input().split()))
    print(*a[::-1])

Альтернативный вариант — сделать цикл по убыванию и выводить числа::

    for i in range(len(a) - 1, -1, -1):
        print(a[i])

Единственная проблема — этот цикл выводит числа «в столбик», а не в одну строку. Во многих задачах в реальных тестирующих системах
это не так страшно, но если важно, можно попросить ``print`` не переводить строку после вывода числа,
а просто выводить пробел: ``print(a[i], end=' ')``.

Полный код::

    n = int(input())
    a = list(map(int, input().split()))
    for i in range(len(a) - 1, -1, -1):
        print(a[i], end=' ')

.. task::

    В вагоне поезда :math:`N` мест, занумерованных от 1 до :math:`N`. Всего в этот вагон продано :math:`K` билетов, занумерованных от 1 до :math:`K`. 
    В каждом билете указано место, на котором поедет пассажир, в разных билетах указаны разные места. 
    Занумеруем пассажиров в соответствии с их билетами от 1 до :math:`K`. Для каждого места
    выведите номер пассажира, который на нем поедет.

    **Входные данные**: На первой строке вводятся два целых числа — :math:`N` и :math:`K`. На второй строке вводятся :math:`K` чисел — 
    номера мест, указанные в билетах (начиная с первого билета и заканчивая :math:`K`-м).

    **Входные данные**: Выведите :math:`N` чисел — для каждого места от 1 до :math:`N` выведите номер пассажира, который поедет
    на этом месте, или 0, если место останется пустым.

    **Пример**:

    Входные данные::

        5 3
        2 5 1

    Выходные данные::

        3 1 0 0 2
    |
    |
    |

Сначала, конечно, считаем данные::

    n, k = map(int, input().split())
    a = list(map(int, input().split()))

Дальше самый простой способ состоит в следующем. Заведем новый массив для ответов, сразу длины :math:`N`, заполненный нулями
(как будто пока все места пустые)::

    b = [0] * n

Далее, пройдем по массиву билетов и каждого пассажира посадим на его место, т.е. прямо в массив :math:`b` на нужное место запишем
номер пассажира::

    for i in range(len(a)):
        b[a[i] - 1] = i + 1

Что здесь происходит? :math:`a[i]` — это номер места, на котором едет :math:`i`-й пассажир, 
соответственно, это индекс в массиве :math:`b`, куда надо поставить номер этого пассажира.
Только одна проблема — по условию, места нумеруются начиная с 1, а в массиве индексы нумеруются начиная с 0,
поэтому на самом деле нужный индекс в массиве :math:`b` равен не :math:`a[i]`, а :math:`a[i] - 1`.

Соответственно, в этот элемент массива :math:`b`, т.е. в :math:`b[a[i] - 1]`, записываем номер пассажира, т.е. :math:`i`.
Тут опять-таки проблема с тем, что по условию пассажиры нумеруются начиная с 1, а в программе
получается нумерация с нуля, поэтому надо записывать не :math:`i`, а :math:`i + 1`.

Остается только вывести массив :math:`b`. Полный код::

    n, k = map(int, input().split())
    a = list(map(int, input().split()))
    b = [0] * n
    for i in range(len(a)):
        b[a[i] - 1] = i + 1
    print(*b)


Альтернативное решение могло быть следующим: не будем создавать массив :math:`b`, а просто для каждого места
будем заново проходить по всему массиву :math:`a` и искать, кто же едет на этом месте::

    n, k = map(int, input().split())
    a = list(map(int, input().split()))
    for i in range(n):
        p = 0
        for j in range(k):
            if a[j] == i + 1:
                p = j + 1
        print(p, end=' ')

но это решение значительно дольше, потому что оно каждый раз заново бегает по массиву.

.. task::

    Дан массив из :math:`N` чисел. Переставьте элементы прямо в этом массиве в обратном порядке. Дополнительные массивы
    использовать запрещается.
    |
    |
    |

Я не буду в этой задаче указывать формат входных и выходных данных, потому что не в них суть. Надо придумать,
как, имея уже готовый массив, поменять его так, чтобы элементы шли в обратном порядке, но в целом в этом же массиве
(а не в новом). Естественно, можно использовать дополнительные переменные, но не массивы.

Решение этой задачи я тут писать не буду, напишу только подсказку, как решение можно придумать.

Представьте себе автомобильную паркову на :math:`N` мест в ряд. На ней стоят :math:`N` разных автомобилей.
Эта парковка — ваш массив, а автомобили — элементы массива.
Вам надо переставить их в обратном порядке, чтобы автомобиль, стоящий на первом месте,
оказался бы на последнем, и т.д. Вы можете передвигать любой автомобиль, но при этом у вас нет никаких помощников, вы
должны все делать в одиночку (т.е., например, вы не можете одновременно двигать два автомобиля). Зато у вас есть свободная площадка
снаружи — дополнительные переменные. Вы не можете туда перегнать все автомобили сразу (потому что это значит использовать
новый массив), но по 1-2 автомобиля перегонять туда вы можете.

Если в уме сложно придумать, найдите дома несколько (4-5) игрушечных машинок, и поэкспериментируйте на них.
Если нет машинок, возьмите другие однотипные элементы — ручки, карандаши и т.п.

.. task::

    Соревнования по фигурному катанию судят :math:`N` судей. В соревнованиях участвуют :math:`K` спортсменов.
    Каждый судья выставляет оценку каждому спорстмену.
    Итоговый балл каждого спортсмена равен сумме его :math:`N` оценок. По данным оценкам определите итоговый балл каждого спортсмена.

    **Входные данные**: На первой строке вводятся два целых числа — :math:`N` и :math:`K`. Далее следуют :math:`N` строк
    по :math:`K` чисел в каждой — оценки каждого судьи.

    **Входные данные**: Выведите :math:`K` чисел — суммарный балл каждого спорстмена.

    **Пример**:

    Входные данные::

        2 3
        1 2 3
        2 3 1

    Выходные данные::

        3 5 4
    |
    |
    |

Здесь надо уже работать с двумерными массивами. Давайте сначала считаем массив::

    n, k = map(int, input().split())
    a = []
    for i in range(n):
        a.append(list(map(int, input().split())))

(Обратите внимание, что нам повезло, что первое из введенных чисел равно количеству строк во входных данных дальше, а второе 
— количеству столбцов. Так чаще всего двумерные массивы и задаются. Но бывает и по-другому, например,
вполне могло бы сначала задаваться количество спортсменов, а потом количество судей, а дальше оценки в том же формате.
Тогда надо было бы аккуратно суметь не перепутать :math:`N` и :math:`K`.)

Далее заведем массив для итоговых баллов каждого спортсмена::

    b = [0] * k

Изначально массив заполнен нулями.

Дальше пройдемся по массиву :math:`a`, и каждую оценку прибавим к баллу соответствующего спорстмена.

Обходить двумерный массив можно так::

    for i in range(n):
        for j in range(k):

Теперь мы стоим в клетке :math:`(i, j)`, т.е. работает с элементом :math:`a[i][j]`. Здесь :math:`i` — номер судьи,
а :math:`j` — номер спортсмена (порядок индексов именно такой, потому что мы так вводили массив).
Значит, эту оценку надо прибавить к баллу :math:`j`-го спортсмена, т.е. к :math:`b[j]`::

    b[j] += a[i][j]

Итоговый код получается такой::

    n, k = map(int, input().split())
    a = []
    for i in range(n):
        a.append(list(map(int, input().split())))
    b = [0] * k
    for i in range(n):
        for j in range(k):
            b[j] += a[i][j]
    print(*b)
