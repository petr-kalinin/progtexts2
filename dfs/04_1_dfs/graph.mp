prologues:=3;
u:=1cm;

pair A,B,C,D,E,F;
A:=(0,0);
B:=(-1u,1u);
C:=(-2u,0);
D:=(-1u,-1u);
E:=(1u,1u);
F:=(1u,-1u);

def drawgr=
draw A--B--C--D--E--F--A--C;
pickup pencircle scaled (u/5);
draw A;
draw B;
draw C;
draw D;
draw E;
draw F;
label.top(btex 1 etex,A);
label.bot(btex 3 etex,B);
label.top(btex 2 etex,C);
label.top(btex 4 etex,D);
label.rt(btex 5 etex,E);
label.rt(btex 6 etex,F);
enddef;

beginfig(1)
drawgr;
endfig;

beginfig(2)
drawgr;
pickup pencircle scaled (u/10);
draw A--C--B;
draw C--D;
draw A--E--F;
endfig;

bye
