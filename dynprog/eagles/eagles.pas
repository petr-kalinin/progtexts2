uses sysutils;
type int=longint;
const maxn=100;
var xxx,yyy,xx,yy,x,y:array[0..maxn] of int;
    isin:array[1..maxn,1..maxn,1..maxn] of byte;
    sq:array[1..maxn,1..maxn,1..maxn] of int;
    ans:array[0..maxn,0..maxn] of int;
    from:array[0..maxn,0..maxn] of integer;
    ttn,tn:array[0..maxn] of integer;
    mmax,max:int;
    best:array[0..maxn] of integer;
    f:text;
    n,m,nn:integer;
    i,j,k,l,jj,kk:integer;

function vect(x1,y1,x2,y2:int):int;
begin
vect:=x1*y2-x2*y1;
end;

function isinn(a,b,c:int):boolean;
begin
isinn:=((a<=b)and(b<=c))or((c<=b)and(b<=a));
end;

function sgn(i:int):int;
begin
if i>0 then sgn:=1
else if i=0 then sgn:=0
else sgn:=-1;
end;

function liein(x0,y0,x1,y1,x2,y2,x3,y3:int):boolean;
{Лежит ли точка (x0,y0) внутри треугольника (x1,y1)-(x2,y2)-(x3,y3)}
begin
if (x3=x1)and(y3=y1)and(x3=x2)and(y3=y2) then begin
   liein:=(x0=x1)and(y0=y1);
   exit;
end;
liein:=(sgn(vect(x3-x1,y3-y1,x0-x1,y0-y1))*
        vect(x0-x1,y0-y1,x2-x1,y2-y1)>=0)and
       (sgn(vect(x3-x2,y3-y2,x0-x2,y0-y2))*
        vect(x0-x2,y0-y2,x1-x2,y1-y2)>=0)and
       (sgn(vect(x1-x3,y1-y3,x0-x3,y0-y3))*
        vect(x0-x3,y0-y3,x2-x3,y2-y3)>=0) and
       (( isinn(x1,x0,x2) and isinn(y1,y0,y2)) or
        ( isinn(x1,x0,x3) and isinn(y1,y0,y3)) or
        ( isinn(x3,x0,x2) and isinn(y3,y0,y2)) )
end;

procedure sort(x0,y0:int;l,r:integer);
{Сортирует массив точек (xx,yy) по полярному углу
относительно точки (x0, y0).
Стандартный алгоритм сортировки слиянием
с кастомным компаратором.}
var i,i1,i2,o:integer;
    t:int;

  function less(i,j:integer):boolean;
  {Сравнение двух точек по полярному углу относительно точки (x0,y0)}
  begin
    less:=vect(xx[i]-x0,yy[i]-y0,xx[j]-x0,yy[j]-y0)<0;
  end;

begin
if l>=r then exit;
if l=r-1 then begin
    if less(r,l) then begin
        t:=xx[l];xx[l]:=xx[r];xx[r]:=t;
        t:=yy[l];yy[l]:=yy[r];yy[r]:=t;
        t:=tn[l];tn[l]:=tn[r];tn[r]:=t;
    end;
    exit;
end;
o:=(l+r) div 2;
sort(x0,y0,l,o);sort(x0,y0,o+1,r);
i1:=l;i2:=o+1;
for i:=l to r do 
    if (i2>r)or((i1<=o)and(less(i1,i2))) then begin
       xxx[i]:=xx[i1];yyy[i]:=yy[i1];
       ttn[i]:=tn[i1];
       inc(i1);
    end else begin 
       xxx[i]:=xx[i2];yyy[i]:=yy[i2];
       ttn[i]:=tn[i2];
       inc(i2);
    end;
for i:=l to r do begin
    xx[i]:=xxx[i];
    yy[i]:=yyy[i];
    tn[i]:=ttn[i];
end;
end;

begin
assign(f,'input.txt');reset(f);
read(f,n);
for i:=1 to n do read(f,x[i],y[i]);
read(f,m);
for i:=1 to m do read(f,xx[i],yy[i]);
fillchar(isin,sizeof(isin),0);
{Предподсчитаем площади всех треугольников,
а также для каждого треугольника -- есть ли
внутри него дятлы}
for i:=1 to n do
    for j:=i to n do
        for k:=j to n do begin
            {Площадь}
            sq[i,j,k]:=abs(vect(x[i]-x[j],y[i]-y[j],x[k]-x[j],y[k]-y[j]));
            sq[i,k,j]:=sq[i,j,k];
            sq[j,i,k]:=sq[i,j,k];
            sq[j,k,i]:=sq[i,j,k];
            sq[k,i,j]:=sq[i,j,k];
            sq[k,j,i]:=sq[i,j,k];
            {Есть ли дятлы}
            for l:=1 to m do 
                if liein(xx[l],yy[l],x[i],y[i],x[j],y[j],x[k],y[k]) then begin
                    isin[i,j,k]:=1;
                    isin[i,k,j]:=1;
                    isin[j,i,k]:=1;
                    isin[j,k,i]:=1;
                    isin[k,i,j]:=1;
                    isin[k,j,i]:=1;
                end;
         end;
max:=0;best[0]:=0;
for i:=1 to n do begin
    {Берем точку i за левую нижнюю}
    nn:=0;
    fillchar(tn,sizeof(tn),0);
    {Формируем массив точек, лежащих выше или правее}
    fillchar(xx,sizeof(xx),0);
    fillchar(yy,sizeof(yy),0);
    xx[0]:=x[i];yy[0]:=y[i];
    tn[0]:=i;
    for j:=1 to n do 
        if (j<>i)and((y[j]>y[i])or((y[j]=y[i])and(x[j]>x[i]))) then begin
            inc(nn);
            xx[nn]:=x[j];yy[nn]:=y[j];
            tn[nn]:=j;
        end;
    {Сортируем по полярному углу}
    sort(x[i],y[i],1,nn);
    {Начальные значения динамики: точка номер ноль -- это наша левая нижняя точка,
    а остальные точки нумеруются с 1}
    for j:=0 to nn do 
        if isin[i,i,tn[j]]=0 then ans[0,j]:=0
        else ans[0,j]:=-(1 shl 30);
    ans[0,0]:=0;
    {Основной цикл динамики}
    for j:=2 to nn do
        for k:=1 to j-1 do begin
            {Решаем подзадачу dp[j][k]}
            ans[k,j]:=-(1 shl 30);
            from[k,j]:=-1;
            if isin[tn[j],tn[k],tn[0]]=0 then {Если в треугольнике нет дятлов}
               for l:=0 to k-1 do if ans[l,k]>=0 then
                   {Перебираем предпредпоследнюю точку, проверяем, что ответ на нее есть
                   и что поворот идет в нужную сторону}
                   if vect(xx[k]-xx[l],yy[k]-yy[l],xx[j]-xx[k],yy[j]-yy[k])<=0 then
                        {Если ответ лучше, то запоминаем его}
                        if ans[l,k]+sq[tn[k],tn[j],tn[0]]>ans[k,j] then begin
                            ans[k,j]:=ans[l,k]+sq[tn[k],tn[j],tn[0]];
                            from[k,j]:=l;
                        end;
        end;
    {Находим максимум ответов с текущей левой нижней точкой}
    mmax:=0;
    for j:=2 to nn do 
        for k:=1 to j-1 do
            if ans[k,j]>mmax then begin
                mmax:=ans[k,j];
                jj:=j;kk:=k;
            end;
    {И сравниваем с глобальным вообще максимумом}
    if mmax>max then begin
        max:=mmax;
        best[0]:=2;
        best[1]:=tn[jj];
        best[2]:=tn[kk];
        j:=jj;k:=kk;
        {Восстанавливаем ответ в виде последовательности точек}
        repeat
          l:=from[k,j];
          j:=k;k:=l;
          inc(best[0]);
          best[best[0]]:=tn[k];
        until k=0;
    end;
end;
assign(f,'output.txt');rewrite(f);
writeln(f,best[0]);
for i:=1 to best[0] do write(f,best[i],' ');
close(f);
end.