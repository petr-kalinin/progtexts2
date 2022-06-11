.. highlight:: python

Functions
=========

General idea
------------

You have already met standard functions: ``abs``, ``sqrt``,
even ``print`` and `input` are functions.
In fact, a function is a separate piece of code
that you can call from any point in your program.

For example, let's duscuss the modulus function (``abs``).
If you need to take a modulus of some value in the program,
of course, you can just write a simple ``if``. Let's consider 
that you need to calculate the value of the expression :math:`abs(x)`,
and save it to the variable y. You can do it like this::

   if x < 0:
      y = -x
   else:
      y = x

But if you need to calculate moduli of different values calculated
and do it many times, then this is quite inconvenient.
The standard ``abs`` function is much more useful, as you can write simply
::

   y = abs(x)

Moreover, you can use any complex expression
as an argument of the ``abs`` function, for example,
like ``abs(2 - 3 * x)``. You can also not only save 
the result of calculating the function to a variable,
but use it in any other way. For example, you can write
``print(10 + 137 * abs(2 - 3* x))``.
It's quite clear that writing all this through ``if``\ s would be more tricky.

``abs`` is a *standard function*, i.e. Python automatically
recognizes it. In other words, it is built into the language.
But you can write your own functions, and in this topic we discuss this.

How to define functions
-----------------------

Let's create a function that calculates the sign of a number,
i.e. it's result will be -1 if the number is negative,
0 if the number is zero, and 1 if the number is positive.
It is done like this::

   def sign(a):
      if a < 0:
         return -1
      elif a > 0:
         return 1
      else:
         return 0

(Here I assume that our function will only process integers,
otherwise the question of errors would immediately arise.)

Let's look at this piece of code in detail.
First comes the keyword ``def``, which actually means
that this is the definition of a function.
Next comes the name of the function (in our case it's ``sign``)
— this is the name that we'll use further in the program
when we need to call the function. Of course, you can use
any names you want (within reason, similar to variable names).
Then, in brackets, the *list of arguments* is set,
we'll discuss it below. And from the next line
with an indent comes the *body of the function* — 
these are the instructions that will be
executed upon a function call.

How will it work? After defining such a function,
further in the main program we can write, for example
::

   y = sign(2)

this means that Python should call the ``sign`` function, 
passing a number 2 to it as an argument, (similar to the notation 
``y = abs(x)`` which means that you need to apply 
the ``abs`` function to the number `x`). At this line,
the following actually happens: the function code is executed 
(starting from the line ``if a < 0``), and value 2 is assigned 
to the inner variable ``a``, because it was listed as an argument
when the function was called (in the notation ``sign(2)``).

Accordingly, the function performs the check whether ``a < 0`` is true, 
but since 2 is assigned to ``a``, this check fails.
Therefore, the further check is performed whether it's true that ``a > 0``.
this time the check is successful, and the instruction ``return 1`` is executed.

Here you see a new, unfamiliar instruction ``return``. This is
a special keyword that is used only in functions.
It means: stop executing the function and return to the point 
the function was called from, and meanwhile take the value specified
after ``return`` and use it as a result of the function. 
So, in our case it is 1.

Therefore, on this line the function execution will terminate,
the program execution will return back to the line ``y = sign(2)``,
while the value of the function will be considered 1. 
So the number 1 will be assigned to the variable `y`.

Similarly, the ``abs`` function, which was mentioned above,
if it wasn't a standard function, could be implemented like this::

    def abs(x):
        if x < 0:
            x = -x
        return x

Try to comprehend how it works.

Arguments of the function
-------------------------

What is written in brackets, both when defining a function 
and when calling it, is called *arguments* (may also be referred to
as *parameters*, these are synonyms). That is, by writing ``def sign(a):`` 
we declared a ``sign`` function that takes a single argument ``a``.
When, after that, we write ``y = sign(2)``, we call this function, passing to it 
a number 2 as the argument. (In fact, of course, these are two different meanings 
of the same word. There are even special terms for this: formal
and actual arguments. But we won't go further into terminology now,
especially since in real life both are simply called arguments.)

Let's discuss this in more detail. Arguments of the function in fact 
are special variables which will be "visible" only inside this function,
and which must be set externally when calling this function. By writing ``def sign(a):``,
we stated that the variable ``a`` will appear inside the function,
and meanwhile that its initial value will be set from outside.
The important thing is that this is a special separate variable
(it's called *local* variable, also described below)
that is not related to the variable ``a`` in the main program in any way
(moreover, there may be no variable ``a`` in the main program at all).

A function can have as many arguments as you wish.
Their names, of course, must be correct variable names.
For example, you can write ``def foo(bar, buz, bee):``
— this function has three arguments.

Accordingly, when calling the function, you must specify values of all its arguments. 
As you already know very well, this is done by listing the values of the arguments 
in brackets after the function name. If there are two or more arguments,
they are separated by commas. When calling a function, you can use any expressions as arguments,
for example, you can call ``sign(2 + 3 * x)`` (so inside the function it will be 
"implicitly assigned" as ``a = 2 + 3 * x``), or ``foo(2 + 3 * x, 2 - 3 * x, 3 * x)``
(this is just an abstract example, of course). Moreover, you can, of course, use in expressions 
some other functions. Or even the same one, for example, ``sign(2 + 3 * abs(3 - sign(x)))``.

Trying to specify too many or too few arguments when calling the function, of course, will cause an error.

The function also may have no arguments. Then both when declaring and 
when calling such a function, you just need to type empty brackets::

   def abc():
       ...

   ...
   x = abc()

Arguments do not have to be numbers; they can take any values that
common variables can take (arrays, strings, etc.). Certainly at the same time 
you need the interpretation of the argument inside the function 
and assignment of this argument when calling it to be the same:
if the function expects an array to be passed to it as an argument,
and you pass a number, then hardly anything good will happen.
The function will try to execute the code, but highly likely it will 
just stumble upon an error somewhere. (This, of course, should be applied
not only to *types* of arguments, but also to arguments in general.
Every argument, like every variable in the program, must have some meaning,
some purpose. And if you pass a value that doesn't correspond to this meaning,
nothing good will likely come out...)

In the simplest cases, the arguments of the function are "disconnected" from external variables: 
if you write ``sign(x)``, then the argument ``a`` inside the ``sign`` function will not be connected 
in any way with the variable ``x`` in the main program (only the value ``x`` is copied to ``a``).
If the value of ``a`` is changed in the function, the value of `x` will not change.
But when passing arrays and other complex objects to the function, you'll encounter
the same tricky effects as upon copying of arrays. If you write::

   def foo(a):
       a[1] = 10
       ...

   ...
   x = [1, 2, 3]
   foo(x)

then both the variable ``x`` of the main program and the argument ``a`` 
of the function will refer to the same array, and changes in ``a`` will be visible in ``x``. 
(And this is completely analogous to the usual copying of arrays: ``a = x``.)

.. note::
   In fact, what is described above is just the simplest way to set arguments. 
   Python supports more tricky options (for example, in this way you can't create functions like ``print``, 
   whose number of arguments is unknown in advance, and which, moreover, are able to take *named* arguments 
   like ``sep=' '``). But we won't discuss these advanced options now.

Local variables
---------------

You can create and use variables in the function. These variables 
are called *local*:  they are visible only inside the function, 
and can't be accessd from the outside. If you have a variable 
with the same name in the main program (it's called a *global* variable), 
it will not be associated with the eponymous local variable in any way.

But nevertheless, you can use global variables in a function 
if you don't have a same-name local variable.

.. note::

   Actually, since Python doesn't have a special syntax for declaring variables, 
   the difference between global and local variables is quite subtle 
   and at first glance not obvious. The rule is such: if you assign something 
   to a variable inside a function, then this variable is considered local
   (and will not be associated with the same-name global variable, if there is one). 
   If you don't assign anything, but only touch the variable in some other way, 
   then it will be assumed that you work with a global variable.
   In general, be ready for various tricks here.

As already mentioned above, arguments are essentially the same local variables,
just their initial value is set from the outside. Then they behave completely 
like local variables; in particular, they can be assigned new values if necessary.

Example::

   a = 30
   c = 40
   z = 100

   def do_something(x):
       a = x + 10
       b = a - 20
       return b + z

   do_something(c)

How does this code work? There are three global variables: ``a``, ``c`` and ``z``. 
In the line ``do_something(c)``, the function ``do_something`` is called, 
the value of ``c`` (i.e. 40) is passed to it as an argument. 
The function execution starts, and its argument ``x`` turns out to be equal to 40.
Then `x + 10`, i.e. 50, is assigned to the local variable ``a``.
(By this, the value of the global variable ``a`` isn't affected in any way.)
After that, ``a - 20``, i.e. 30, is assigned to the local variable ``b`` 
(Aе the same time, there is no global variable ``b`` at all, and it's alright.)
Finally, we return the value ``b + z``, where ``b`` is local 
(because we previously wrote 30 to it), and ``z`` is global 
(because we didn't create such a local variable).

.. note::

   Actually, you can change global variables 
   inside a function by using a special keyword ``global``::

      def do_something(x):
         global a
         a = x + 10
         
   here you specify that you want to operate with the global variable ``a``, 
   and all the changes in ``a`` will be visible from the outside.
   But this is needed quite rarely.

Return value
------------

As we have already discussed, the return value is what is set 
after the ``return`` instruction, and what will then be used as the "value"
of the function at the place where it's been called(i.e., what will, for example, 
be assigned to the variable ``y`` if we write ``y = sign(x)``).

Of course, you can write any expression in the ``return`` statement, 
it does not have to be a number. Similarly, you can use the result 
of the function execution  as we like, not just save it to a variable. 
For example, by writing ``y = 20 + sign(x)`` 
and even ``print(a[sign(x)])`` if you have an array named ``a``.

In particular, we can just refuse processing the return value in any way, 
simply by writing a standalone instruction (on a separate line), like this

::

   do_something(x)

In this case, the function code will be executed, but the result specified in ``return`` 
will be just thrown away. This can be useful if you need a function not for simple calculations 
(like ``abs`` or our ``sign``), but for performing some "external" actions. 
A typical example is the ``print`` function. There is no point in writing ``x = print(y)``,
at the same time ``print(y)`` makes perfect sense; you are calling ``print`` not to get the return value, 
but to output something on the screen. You may as well write such functions by yourself.

В частности, если вам надо просто выйти из функции, не возвращая никакого значения, и вы понимаете, что в месте вызова никакого значения не ожидается,
то вы можете просто написать ``return`` без аргументов. Аналогичное произойдет, если код функции дойдет до конца, не встретив по дороге ``return``, например,
так::

   def foo(x):
      print(x + 20)

Тут нет ни одного ``return``, поэтому функция просто доработает до конца своего тела и вернется.

.. note::

   На самом деле пустой ``return``, а также завершение функции без ``return`` не возвращает ничего, а возвращает специальное значение ``None``.
   
   Вообще, иногда говорят о разделении на *функции* и *процедуры* — функциями в этом, узком, смысле слова называют функции, которые *возвращают*
   какое-либо значение, а *процедурами* — то, что не возвращает никакое значение.
   В некоторых языках (в первую очередь в паскале) это яркое синтаксическое различие: есть два разных служебных слова:
   ``procedure`` и ``function`` для объявления процедур и функций, и в принципе эти два термина стараются не путать. В других языках (C++, Java) используется
   только термин «функция», но для функций, которые не возвращают никакое значение, используется специальный тип
   такого «возвращаемого» значения — ``void``, — и такие функции ведут себя немного по-другому (их результат в принципе
   нельзя никуда сохранить, компилятор не позволит), поэтому все-таки небольшая разница между процедурами и функциями есть,
   пусть даже термин «процедура» не используется.

   В питоне такой разницы нет. Вы вполне можете написать функцию, которая в определенных случаях будет возвращать что-то,
   а в определенных случаях не будет возвращать ничего::

      def test(x):
         if x < 0:
            return 10
         if x > 0:
            return
      
   тут если ``x < 0``, то возвращается значение 10, если ``x > 0``, то попадаем на пустой ``return``, а если ``x == 0``, то функция вообще просто дойдет до конца своего тела
   без ``return``'ов. (И в соответствии со сказанным выше в двух последних случаях на самом деле будет возвращено ``None``.)

   Но так делать не надо (ну, за исключением совсем особых случаев). Лучше и понятнее код, в котором у каждой функции есть вполне понятный смысл
   и назначение; и такие функции или всегда возвращают что-то, или никогда ничего (кроме ``None`` не возвращают). 
   Поэтому если вы предполагаете, что возвращаемое значение функции имеет смысл использовать,
   то пишите явный ``return`` со значение во всех возможных ветках, а если нет — то пишите везде пустой ``return`` (ну кроме самого конца функции,
   где его можно не писать.)

   При этом бывает так, что в функции, которая обычно что-то возвращает, вам иногда надо вернуть ``None`` (например, так нередко делают
   в функциях поиска какого-нибудь объекта: возвращается или найденный объект, или ``None``). Но тогда пишите явно ``return None``,
   чтобы было видно, что вы это делаете намеренно.

Зачем нужны функции
-------------------

На самом деле, спектр применения функций очень широк. В серьезных программах пишут огромное количество функций, можно даже сказать,
что функции, наравне с переменными и объектами — это основные строительные блоки кода.

В простейших ситуациях (с которыми вы и столкнетесь в первую очередь) можно выделить следующие причины, зачем вам нужны функции.

Первое и, может быть, самое главное для вас сейчас — это исключение дублирования кода. Собственно, мы это уже видели в самом начале этого раздела:
функция ``abs`` позволяет не писать громоздкий ``if`` каждый раз, когда она нам понадобилась. Вообще, в принципе надо всегда избегать дублирования кода;
если вы видите, что одни и те же вычисления у вас повторяются в нескольких местах программы — вынесите их в функцию.

Второе — это возможность выделения смысловых блоков программы. Функция в идеале должна быть некоторым законченным фрагментом кода,
который выполняет некоторую понятную задачу. И тогда, когда вы эту функцию вызываете, сразу понятно, что происходит.
В принципе, это видно даже на примере функции ``abs``: если вы пишете ``abs(5 - x)``, сразу понятно, что вы имеете в виду :math:`|5 - x|`.
А если бы вы писали бы через ``if``, то это было бы не очень очевидно, вам пришлось бы потратить несколько секунд на размышления и понимание того,
что этот ``if`` обозначает просто модуль.

Это еще важнее в более крупных программах, где нужная последовательность действий состоит из нескольких крупных шагов.
Пусть, например, вы делаете систему умного дома, и вам надо скачать прогноз погоды из интернета, выделить прогноз осадков в ближайшие 6 часов, 
и в зависимости от этого открыть или закрыть окно в комнате.
Даже если эти шаги нигде не повторяются, зачастую удобно их вынести в отдельные функции, чтобы сразу было видно:
тут мы скачиваем данные, тут решаем, открыть или закрыть, а вот тут собственно подаем команды на управляющий блок окна. Если каждый шаг не очень тривиален, 
то выделение шагов в функции резко повышает понятность и читаемость программ. (Конечно, для этого надо выбрать адекватное название для каждой функции.)
Кроме того, вам намного проще будет потом менять программу; если вы захотите поменять принцип, по которому открывается или закрывается окно,
вам вообще не придется трогать часть функций.
Заодно еще одно удобство — вы можете использовать локальные переменные, и они не будут мешаться друг другу.

Третья причина для использования функций, ну или на самом деле комбинация первой и второй, но заслуживающая отдельного упоминания — это создание *параметризуемого* кода.
То есть пусть у вас есть какая-то операция, какой-то фрагмент кода, который выполняется несколько раз, но каждый раз слегка по-разному.
Зачастую вы его тоже можете легко выделить в функцию, а это самое различие передавать просто аргументами функции.
Аналогично, если у вас есть какой-то смысловой блок, который тоже может выполняться по-разному (например, окно можно открыть, а можно и закрыть),
вы его тоже можете выделить в функцию, сделав параметром указание на то, как именно надо выполнять этот блок (надо конкретно открывать или закрывать окно).

Четвертая причина — это *рекурсия*. Вообще, понятно, что из функции вы в принципе можете вызывать другие функции (например, вы можете написать функцию ``foo``,
которая внутри себя будет использовать функцию ``abs``, если ей надо — почему бы нет?), но также вы из функции можете вызывать *её же саму*. Это и называется рекурсией.
(Естественно, надо делать какое-то ограничение таких вызовов, чтобы не получилась бесконечная рекурсия). Я не будут про это писать подробнее,
но если вы все, что было написано выше, уже поняли, то можете обдумать этот абзац отдельно.

Ну и пятая причина, которая на самом деле является вариацией второй причины (про смысловые блоки), но заслуживает отдельного упоминания — это, как говорят, *инкапсуляция* кода.
Функции позволяют вам скрыть всю свою сложность, всю нетривиальность, позволив вам в основной программе не задумываться о том, как функция устроена внутри,
а просто вызвать эту функцию. Ярким примером этого принципа являются функции ``print`` и ``input``. Вы сейчас, скорее всего, даже теоретически не понимаете,
что же такое делают эти функции внутри себя, как так получается, что функция ``print`` выводит текст на экран, а ``input`` считывает текст с клавиатуры.
Но вам это и не важно; вы просто пишете ``input`` и не задумываетесь о том, что там происходит внутри.
На это же можно посмотреть и с другой стороны: если у вас есть какая-то сложная система (например, тот же автоматический открыватель-закрыватель окна),
вы пишете функцию, которая открывает окно, подавая нужные сигналы на блок управления, и вот как раз эта функция должна будет знать,
как общаться с этим блоком. А в остальной программе уже не думаете, как конкретно открывается окно, а просто вызываете функцию.
