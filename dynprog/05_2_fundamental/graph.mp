prologues:=3;

dx:=1.5cm;
dy:=1cm;
levmax:=3;
input TEX.mp
pw:=0.2cm;
path box;

def drawgraph(expr i,j,x,y,lev)=
numeric xx,yy;

if lev<levmax:
   xx:=x-dx;
   yy:=y-dy;
   drawarrow (x,y)--(xx,yy) cutafter box shifted (xx,yy);
   if j=0:
     drawgraph(i+1,j,xx,yy,lev+1);
   fi;
   
   xx:=x+dx;
   yy:=y-dy;
   drawarrow (x,y)--(xx,yy) cutafter box shifted (xx,yy);
   drawgraph(i,j+1,xx,yy,lev+1);
else:
   xx:=x-dx*0.5;
   yy:=y-dy*0.5;
   draw (x,y)--(xx,yy);
   
   xx:=x+dx*0.5;
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

beginfig(1)
picture lab;
lab:=thelabel(TEX("$(N-2,M-2)$"),(0,0));
box:=bbox lab;
drawgraph(0,0,0,0,0);
endfig;

bye