prologues:=3;
u:=1.5cm;
ahlength:=u/4.5;
ahangle:=30;

pair A,B,C,D,E,F,DEu,DEd;
A:=(0,0);
B:=(0u,1u);
C:=(1u,0);
D:=(1u,1u);
E:=(2u,1u);
F:=(2u,0);
DEu:=0.5[D,E]+(0,0.2u);
DEd:=0.5[D,E]-(0,0.2u);

def drawgr=
drawarrow A--B;
drawarrow B--C;
drawarrow C--A;
drawarrow B--D;
drawarrow D..DEu..E;
drawarrow E..DEd..D;
drawarrow E--F;
drawarrow C--F;
drawarrow C--D;
pickup pencircle scaled (u/10);
draw A;
draw B;
draw C;
draw D;
draw E;
draw F;
label.bot(btex 1 etex,A);
label.top(btex 2 etex,B);
label.bot(btex 3 etex,C);
label.top(btex 4 etex,D);
label.rt(btex 5 etex,E);
label.rt(btex 6 etex,F);
enddef;

beginfig(1)
drawgr;
endfig;

beginfig(2)
linejoin:=rounded;
filldraw A--B--C--cycle withpen pencircle scaled (u/3) withcolor (0.8,0.8,0.8);
filldraw D..DEu..E--E..DEd..D--cycle withpen pencircle scaled (u/3) withcolor (0.8,0.8,0.8);
draw F withpen pencircle scaled (u/3) withcolor (0.8,0.8,0.8);
drawgr;
endfig;

beginfig(3)
pair AA,BB,CC,AC;
AA:=(0,0);
BB:=(1u,0);
CC:=(2u,0);
AC:=0.5[AA,CC]+(0,0.4u);
drawarrow AA--BB;
drawarrow BB--CC;
drawarrow AA..AC..CC;
pickup pencircle scaled (u/10);
draw AA;
draw BB;
draw CC;
label.bot(btex $\{1,2,3\}$ etex,AA);
label.bot(btex $\{4,5\}$ etex,BB);
label.bot(btex $\{6\}$ etex,CC);
endfig;

bye
