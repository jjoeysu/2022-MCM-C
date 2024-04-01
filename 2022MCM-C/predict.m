clear;clc;tic;
t=load('data.mat').BG;t1=t(:,2);
plot(1:length(t1),t1);hold on                       
[imf, residual, info] =emd(t1,'Interpolation','pchip','Display',1);
[mm,nn]=size(imf);ttstar=zeros(mm,1);
for cc=1:length(t1)-29
E=zeros(30,30);
d=zeros(nn+1,1);
xh=zeros(nn+2,1);
for ab=1:nn
E=dvg(imf(cc:cc+29,ab));
K=sum(E,2);Kin=sum(E);Ks=sum(Kin);
Q=zeros(length(K));
for i=1:length(K)-1
Q(i,:)=E(i,:)/K(i);
end
alpha=0.2;
Q=Q*(1-alpha)+alpha*eye(length(K));
Pai=eye(length(K));Pai=Q'*Pai;
for i=2:length(K)
Pai=Q'*Pai+Pai;
toc;
end
S=zeros(length(K),length(K));
for i=1:length(K)
for j=1:length(K)
S(j,i)=(K(i)*Kin(j)/(2*Ks))*Pai(j,i);
end
end
[m,n]=max(S(length(K),:));
d(ab)=30-n;
xh(ab)=cc+30-d(ab);
end
d(nn+1,1)=d(1);
xh(nn+1,1)=cc+30-d(nn+1,1);xh(nn+2,1)=cc+29;tt=zeros(nn+1,1);
for i=1:nn+1
if xh(i,1)==xh(i+1,1)
tt(i,1)=t1(cc+29);
else
tt(i,1)=(t1(xh(i,1))-t1(xh(i+1,1)))/(xh(i,1)-xh(i+1,1))+t1(cc+29);
end
w(i)=d(i,1)/sum(d);
end
ttstar(cc+30,1)=sum(tt'.*w);
end
plot(ttstar,'r');
% save("bite.mat","ttstar")
% save("gold.mat","ttstar")
%%%%%%%%%%%%%%%%%%%%
function E=dvg(x)
n=length(x);
E=zeros(n,n);
for i=1:n
for j=i:n
if j==i+1
E(i,j)=1;continue;
end
for k=i+1:j-1
y(k)=x(j)+(x(i)-x(j))*(j-k)/(j-i);
if y(k)<=x(k)
E(i,j)=0;break;
else
E(i,j)=1;
end
end
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%