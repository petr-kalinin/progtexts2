prologues:=3;

dx:=0.4cm;
dy:=1cm;
levmax:=3;
input TEX.mp
pw:=0.2cm;

pair labelshift;
labelshift:=(0.3dx,0);

def drawtree(expr i,j,x,y,lev)=
numeric xx,yy;

if lev<levmax:
   xx:=x-dx*(2**(levmax-lev));
   yy:=y-dy;
   draw (x,y)--(xx,yy);
   label("0",1/2[(x,y),(xx,yy)]-labelshift*(2**(levmax-lev)));
   drawtree(i+1,j,xx,yy,lev+1);
   
   xx:=x+dx*(2**(levmax-lev));
   yy:=y-dy;
   draw (x,y)--(xx,yy);
   label("1",1/2[(x,y),(xx,yy)]+labelshift*(2**(levmax-lev)));
   drawtree(i,j+1,xx,yy,lev+1);
else:
   xx:=x-dx*(2**(levmax-lev))*0.5;
   yy:=y-dy*0.5;
   draw (x,y)--(xx,yy);
   
   xx:=x+dx*(2**(levmax-lev))*0.5;
   yy:=y-dy*0.5;
   draw (x,y)--(xx,yy);
fi;
enddef;

beginfig(1)
drawtree(0,0,0,0,0);
endfig;

bye