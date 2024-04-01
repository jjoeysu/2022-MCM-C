clear;clc;tic;
[Bn,~,Bc]=xlsread('BCHAIN-MKPRU','A2:B1827');
[Gn,~,Gc]=xlsread('LBMA-GOLD','A2:B1266');
Gn(isnan(Gn))=0;
figure(1);subplot 121;
bar(1:length(Gn),Gn,'k');
xlabel('The serial number of the gold price data sample');
ylabel('Gold price');kk=[];
for i=1:1265 
if Gn(i)==0
Gn(i)=(Gn(i-1)+Gn(i+1))/2;
kk=[kk,i];
end
end
subplot 122;
b=bar(1:length(kk),kk);
xtips = b.XEndPoints;
ytips = b.YEndPoints;
labels = string(b.YData);
xlabel('Count of missing samples');
ylabel('The serial number of the missing sample');
text(xtips,ytips,labels,'HorizontalAlignment','center',...
'VerticalAlignment','bottom');
Gcc=cell(1265,1);
for i=1:1265
tchar=char(Gc(i,1));
if length(tchar)>8
Gcc{i}=tchar(3:end);
else
Gcc{i}=tchar;
end
end
Gcn=zeros(1265,1);
for i=1:1265
Gcn(i)=datenum(Gcc(i),'mm/dd/yy');
end
dn=Gcn(1):Gcn(end);
Bi=[[dn(1)-1;dn'],Bn];BG=[Bi,zeros(1826,2)];
for i=1:1826
for j=1:1265
if BG(i,1)==Gcn(j)
BG(i,3)=Gn(j);
BG(i,4)=1;
end
end
end
BG(1,3)=BG(2,3);
for i=1:1826
if BG(i,3)==0
BG(i,3)=BG(i-1,3);
end
end
Bitcoin=BG(1:500,2);gold=BG(1:500,3);
% save("data.mat","BG");
% save("bg.mat","BG");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
