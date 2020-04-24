prologues:=3;
u:=1cm;

vardef drawsub(expr A)=
pair BB,CC;
BB:=A+(0.4u,-1u);
CC:=A+(-0.4u,-1u);
filldraw A--BB--CC--cycle withpen pencircle scaled(u/4) withcolor (0.8,0.8,0.8);
%draw A--0.8[A,BB] dashed evenly;
%draw A--0.8[A,CC] dashed evenly;
enddef;

beginfig(1)
pair A,B,C,D;
A:=(-0.5u,1u);
B:=(0,0);
C:=(-1u,-1u);
D:=(1u,-1u);
drawsub(C);
drawsub(D);
draw A--B;
draw B--C;
draw B--D;
draw C+(-0.2u,-0.8u)..0.5[B,C]+(-0.8u,0)..A+(-0.2u,0) dashed evenly;
label.lft(btex 1 etex, 0.5[B,C]+(-0.8u,0));
draw D+(0,-0.8u)--C+(0,-0.3u) dashed evenly;
label.bot(btex 2 etex, 0.5[D+(0,-0.8u),C+(0,-0.3u)]);
pickup pencircle scaled (u/7);
draw B;
draw C;
draw D;
label.rt(btex $u$ etex,B);
label.rt(btex $v_1$ etex, C);
label.rt(btex $v_2$ etex, D);
endfig;

bye