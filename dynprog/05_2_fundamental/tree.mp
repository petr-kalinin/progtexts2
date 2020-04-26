prologues:=3;

dx:=0.8cm;
dy:=1cm;
levmax:=3;
input TEX.mp
pw:=0.2cm;

def drawtree(expr i,j,x,y,lev)=
numeric xx,yy;

if lev<levmax:
   xx:=x-dx*(2**(levmax-lev));
   yy:=y-dy;
   draw (x,y)--(xx,yy);
   drawtree(i+1,j,xx,yy,lev+1);
   
   xx:=x+dx*(2**(levmax-lev));
   yy:=y-dy;
   draw (x,y)--(xx,yy);
   drawtree(i,j+1,xx,yy,lev+1);
else:
   xx:=x-dx*(2**(levmax-lev))*0.5;
   yy:=y-dy*0.5;
   draw (x,y)--(xx,yy);
   
   xx:=x+dx*(2**(levmax-lev))*0.5;
   yy:=y-dy*0.5;
   draw (x,y)--(xx,yy);
fi;

string si,sj;
if i=0 :
   si=""
else: si="-"&decimal(i);
fi;
if j=0 :
   sj=""
else: sj="-"&decimal(j);
fi;
picture lab;
lab:=thelabel(TEX("$(N"& si & ",M" & sj & ")$"),(x,y));
unfill bbox lab;
draw lab;
enddef;

def drawshade(expr xx,yy,lev)=
picture lab;
lab:=thelabel(TEX("$(N-2,M-2)$"),(0,0));
pair dim;
dim:= (urcorner lab - llcorner lab);
pair z;
z:=(-xpart dim,ypart dim)/2+(-dx/10,dy/10);
path p;
p:=z;                        
for i=lev step 1 until levmax-1:
    z:=z-(dx*(2**(levmax-i)),dy);
    p:=p--(z);
endfor;
p:=p--z-(0,ypart dim/2)-(0,dy*0.6);
p:=p--reverse p xscaled -1--cycle;
fill p shifted (xx,yy) withpen pencircle scaled (pw) withcolor (0.6,0.6,0.6);
enddef;

beginfig(1)
drawshade(-dx*(2**(levmax-1)),-dy*2,2);
drawshade(+dx*(2**(levmax-1)),-dy*2,2);
drawtree(0,0,0,0,0);
endfig;

bye