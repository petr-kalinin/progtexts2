.. highlight:: python

Functions
=========

General idea
------------

You have already met standard functions: ``abs``, ``sqrt``,
even ``print`` and ``input`` are functions.
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

But if you need to calculate moduli of different values
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
But you can create your own functions, 
and this is exactly what we'll discuss in this section.

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

and this means that Python should call the ``sign`` function, 
passing a number 2 to it as an argument, (similar to the notation 
``y = abs(x)`` which means that you need to apply 
the ``abs`` function to the number ``x``). At this line,
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
So 1 will be assigned to the variable ``y``.

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
we defined a ``sign`` function that takes a single argument ``a``.
When, after that, we write ``y = sign(2)``, we call this function, passing to it 
a number 2 as the argument. (In fact, of course, these are two different meanings 
of the same word. There are even special terms for this: formal
and actual arguments. But we won't go further into terminology now,
especially since in real life both are simply called arguments.)

Let's discuss this in more detail. Arguments of the function in fact 
are special variables which will be "visible" only inside this function,
and which must be set externally when calling this function. By writing ``def sign(a):``
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
As you already know very well, this is done by listing them 
in brackets after the function name. If there are two or more arguments,
they are separated by commas. When calling a function, you can use any expressions as arguments,
for example, you can call ``sign(2 + 3 * x)`` (so inside the function it will be 
"implicitly assigned" as ``a = 2 + 3 * x``), or ``foo(2 + 3 * x, 2 - 3 * x, 3 * x)``
(this is just an abstract example, of course). Moreover, you can, of course, use in expressions 
some other functions. Or even the same one, for example, ``sign(2 + 3 * abs(3 - sign(x)))``.

Trying to specify too many or too few arguments when calling the function, of course, will cause an error.

The function also may have no arguments. Then both when you define and 
call such a function, you just need to type empty brackets::

   def abc():
       ...

   ...
   x = abc()

Arguments do not have to be numbers; they can take any values that
common variables can take (arrays, strings, etc.). Certainly 
you need the interpretation of the argument inside the function 
and at the moment of the call to be the same:
if the function expects an array to be passed to it,
and you pass a number, then hardly anything good will happen.
The function will try to execute the code, but highly likely it will 
just stumble upon an error somewhere. (This, of course, should be applied
not only to *types* of arguments, but also to arguments in general.
Every argument, like every variable in the program, must have some meaning,
some purpose. And if you pass a value that doesn't correspond to this meaning,
nothing good will likely come out...)

Basically, the arguments of the function are "disconnected" from external variables: 
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
(And this is completely analogous to copying arrays: ``a = x``.)

.. note::
   In fact, what is described above is just the simplest way to set arguments. 
   Python supports more tricky options (for example, this way you can't create functions like ``print``, 
   where number of arguments is unknown in advance, and which, moreover, are able to take *named* arguments 
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
just their initial value is set from the outside. After that, they behave completely 
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
after the ``return`` instruction, and what will then be used as the value
of the function at the place where it's been called (i.e., what will, for example, 
be assigned to the variable ``y`` if we write ``y = sign(x)``).

Of course, you can write any expression in the ``return`` statement, 
it does not have to be a number. Similarly, you can use the result 
of the function execution as we like, not just save it to a variable. 
For example, by writing ``y = 20 + sign(x)`` 
and even ``print(a[sign(x)])`` if you have an array named ``a``.

In particular, we can just refuse processing the return value in any way, 
simply by writing a standalone instruction (on a separate line), like this::

   do_something(x)

In this case, the function code will be executed, but the result specified in ``return`` 
will be just thrown away. This can be useful if you need a function not for simple calculations 
(like ``abs`` or our ``sign``), but for performing some "external" actions. A typical example 
is the ``print`` function. There is no point in writing ``x = print(y)``, at the same time 
just ``print(y)`` makes perfect sense; you are calling ``print`` not to obtain some value, 
but to output something on the screen. You may as well write such functions by yourself.

In particular, if you just need to terminate the function without returning any value,
and you know that no value is expected at the place where it's called, then you can 
simply write ``return`` without arguments. The same thing will happen if the function code 
executes to the end without a single ``return`` statement on the way, for example, like this::

   def foo(x):
      print(x + 20)

Here, there's no ``return``, so the function will execute until the end and return the control to the main program.

.. note::

   In fact, a ``return`` with no arguments, as well as exiting the function without ``return``
   doesn't "return absolutely nothing", but instead returns a special ``None`` value. 
   
   In general, sometimes the division into *functions* and *procedures* is introduced.
   Functions in this narrow sense of the word are the functions that *return* some value, 
   and *procedures* are ones that do not return any value. In some languages (primarily in Pascal), 
   this makes a salient syntactic difference: there are two different keywords
   ``procedure`` and ``function`` respectively, and there these two terms,
   generally, shouldn't be mixed. In other languages (C++, Java) only "function" is used, 
   but for functions that do not return any value, there's a special ``void`` type of such  "return value", 
   and moreover, such functions behave a little differently (you just can't save their result anywhere, 
   the compiler won't allow you), so there is still a slight difference between procedures and functions, 
   even though the term "procedure" is not used.

   There is no such difference in Python. You may easily declare a function 
   that in certain cases will return something,
   and in certain cases won't return anything::

      def test(x):
         if x < 0:
            return 10
         if x > 0:
            return
   
   Here, if ``x < 0``, then the value 10 is returned.
   If ``x > 0``, then we get to an empty ``return``. 
   And if ``x == 0``, then the function will just execute to the end of its body
   without meeting any ``return``. (And according to what was said above,
   in the last two cases, it will actually return ``None``.)

   But you shouldn't do this (except some very special cases). The code is better and clearer 
   when each function in it has an understandable meaning and purpose — and such functions 
   either always return something, or never return anything (always return ``None``).
   Therefore, if you assume that the return value of the function may be used,
   then write an explicit ``return`` with a value in all possible branches,
   and if not, then write an empty ``return`` everywhere
   (except for the very end of the function, where it can be omitted).
   
   Nevertheless, it may happen that in a function that usually returns something,
   you sometimes need to return ``None`` (for example, this is typical
   for search functions: they return either the found object or ``None``).
   But then type explicitly ``return None`` to make it clear that you are doing this intentionally.

What are functions designed for?
--------------------------------

Actually, functions are applied very widely. In serious programs, a huge number of functions
is being implemented and used, one can even say that functions, 
along with variables and objects, are the main construction blocks of the code.

In the basic cases (which you will meet first) there are several reasons 
why you need functions and they are the following.

The first and perhaps the most important reason for you now is to avoid code duplication. 
Actually, we have already seen this at the very beginning of this section:
the ``abs`` function allows us not to write a cumbersome ``if`` every time we need 
the absolute value of a number. It's general rule in programming that you should 
avoid code duplication; if you see that the same calculations are repeated 
in several places of the program — put them in a function.

The second is the ability to highlight semantic blocks of the program. 
The function should ideally be some complete piece of code that performs some reasonable task. 
So when you call this function, it is immediately clear what is happening upon its execution.
Generally, you can see it even by the example of the ``abs`` function: 
if you write ``abs(5 - x)``, it is immediately clear that you mean :math:`|5 - x|`.
And if you were using ``if`` instead, then it would not be very obvious, you'd have to 
spend a few seconds thinking and understanding that this ``if`` simply means the modulus.

This is even more important in big and complex programs, where the desired sequence of operations 
consists of several big steps. Let's imagine, for example, you are developing a smart home system, 
and you need to download the weather forecast from the Internet, process the 6-hour precipitation forecast
and, depending on it, open or close a window in the room. Even if these steps are not repeated anywhere else, 
it's often useful to put them in separate functions so that it can be immediately seen:
here we download data, here we decide whether to open or close, 
and here we actually send instructions to the window control unit. If each step is not very trivial, 
turning these steps into functions dramatically increases the clarity and readability of programs. 
(Of course, you also need to choose an adequate name for each function.) 
Moreover, it will be much easier for you to change the program later; if you want to change the condition 
by which the window is opened or closed, you won't need to touch some of the functions at all.
At the same time, another convenience is that you can use local variables, and they will not interfere with each other.

The third reason for using functions, or actually rather a combination of the first and second, 
but worthy of a special mention, is the ability to create *parameterizable* code. Let's explain what this means.
Suppose you have some operation, some piece of code that is executed several times, but each time 
slightly differently. Often you can also easily transform it to a function,
and transmit this difference simply via arguments. Similarly, if you have some semantic block,
which can also be executed in different ways (for example, a window can be opened, or it can be closed), 
you can also turn it into a function and introduce a parameter indicating exactly how to perform this block 
(you need specifically to open or to close the window).

The fourth reason is *recursion*. In general, it is clear that you can call other functions from a function
(for example, you can write a function ``foo``, which will call ``abs`` inside itself, if it needs to — why not?), 
but the function can also call *itself* from inside. This is called recursion.
(Of course, it's necessary to set some limit of such calls to avoid infinite recursion).
I won't describe it here in detail, but if you've already understood
everything discussed above, you can think about this paragraph separately.

And the fifth reason, which is actually a variation of the second one (about semantic blocks), 
but deserves a special mention, is *encapsulation* of the code.
Functions allow you to hide all their complexity, non-triviality, 
allowing you to escape thinking in the main program about how the function is organized inside,
and simply call it. Striking examples of this principle are ``print`` and ``input``. 
Right now you may have no idea what do these functions do inside themselves,
how does it happen that ``print`` outputs text to the screen and ``input`` reads text from the keyboard.
But it doesn't matter to you; you just write ``input`` and don't think about what's going on inside.
You can also look at it from the other side: if you have some kind of complex system
(for example, the same automatic window opener-and-closer), you create a function that opens the window 
by giving necessary signals to the control unit, and only this function needs to know
how to communicate with this unit. And in the rest of the program you no longer think of
how exactly the window opens, but simply call this function.
