clear;clc;tic;
%%%%%%%%%%%%%%%%%%%%%%%
bite=load('bite.mat').ttstar;bite(1827)=[];
hj=load('gold.mat').ttstar;hj(1827)=[];BG=load('bg.mat').BG;
delta=-0.01:0.001:0.01;
%%%%%%%%%%%%%%%%%%%%%%%%%
HG=zeros(21,4);
for j=1:length(delta)
C=1000;
G=0;
B=0;
for i=30:1825
PG=BG(i,3);PB=BG(i,2);PGn=hj(i+1);PBn=bite(i+1);aG=0.01+delta(j);
aB=0.02;c=[-PGn+PG*(1-aG),-PBn+PB*(1-aB),PGn-PG*(1+aG),PBn-PB*(1+aB)];
A=[-PG*(1-aG),-PB*(1-aB),PG*(1+aG),PB*(1+aB)];b=C;
lb=zeros(4,1);
if BG(i,4)==-3
ub=[0,B,0,1000];
else
ub=[G,B,1000,1000];
end
t=linprog(-c,A,b,[],[],lb,ub);
m=t(1);n=t(2);x=t(3);y=t(4);
C=C+m*PG*(1-aG)+n*PB*(1-aB)-x*PG*(1+aG)-y*PB*(1+aB);
G=G-m+x;B=B-n+y;
R=BG(i+1,3)*G+BG(i+1,2)*B+C;
disp([1,j,i]);toc;
end
HG(j,:)=[C,G,B,R];
toc;
end
%%%%%%%%%%%%%%%%%%%%%%%%
HB=zeros(21,4);
for j=1:length(delta)
C=1000;G=0;B=0;
for i=30:1825
PG=BG(i,3);PB=BG(i,2);PGn=hj(i+1);PBn=bite(i+1);
aG=0.01;aB=0.02+delta(j);
c=[-PGn+PG*(1-aG),-PBn+PB*(1-aB),PGn-PG*(1+aG),PBn-PB*(1+aB)];
A=[-PG*(1-aG),-PB*(1-aB),PG*(1+aG),PB*(1+aB)];b=C;lb=zeros(4,1);
if BG(i,4)==0
ub=[0,B,0,1000];
else
ub=[G,B,1000,1000];
end
t=linprog(-c,A,b,[],[],lb,ub);
m=t(1);n=t(2);x=t(3);y=t(4);
C=C+m*PG*(1-aG)+n*PB*(1-aB)-x*PG*(1+aG)-y*PB*(1+aB);G=G-m+x;B=B-n+y;
R=BG(i+1,3)*G+BG(i+1,2)*B+C;
disp([2,j,i]);toc;
end
HB(j,:)=[C,G,B,R];toc;
end
% save("resultnew.mat","HB","HG");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%