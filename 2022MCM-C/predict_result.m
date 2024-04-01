clear;clc;tic;
bite=load('bite.mat').ttstar;bite(1827)=[];
hj=load('gold.mat').ttstar;hj(1827)=[];BG=load('bg.mat').BG;
%%%%%%%%%%%%%%%%%%%%%%
nn=31:1826;
figure(1);
plot(nn,BG(31:end,3),'b');hold on
plot(nn,hj(31:end),'r');
set(gca,'XTick',31:181:1826);
set(gca,'XTicklabel',{'10/11/2016','4/10/2017','10/8/2017',...
	'4/07/2018','10/5/2018','4/04/2019','10/02/2019','3/31/2020',...
	'9/28/2020','3/28/2021'})
xlim([31,1826]);
xlabel('Date : month/day/year');
ylabel('Price : U.S. dollars per troy ounce');
legend('Real','Predict');
title('Gold prices prediction graph');
%%%%%%%%%%%%%%%%%%%%%
nn=31:1826;
figure(2);
plot(nn,BG(31:end,2),'b');hold on
plot(nn,bite(31:end),'r');
set(gca,'XTick',31:181:1826);
set(gca,'XTicklabel',{'10/11/2016','4/10/2017','10/8/2017',...
	'4/07/2018','10/5/2018','4/04/2019','10/02/2019','3/31/2020',...
	'9/28/2020','3/28/2021'})
xlim([31,1826]);
xlabel('Date : month/day/year');
ylabel('Price : U.S. dollars per bitcoin');
legend('Real','Predict');title('Bitcoin prices prediction graph');
sseg=0;sseb=0;
for i=31:1826
sseg=sseg+(hj(i)-BG(i,3))^2;
sseb=sseb+(bite(i)-BG(i,2))^2;
end
mseg=sseg/(1826-31+1);mseb=sseb/(1826-31+1);
[~,areg,accuracy5g]=fscores(hj(31:end),BG(31:end,3));
[~,areb,accuracy5b]=fscores(bite(31:end),BG(31:end,2));
%%%%%%%%%%%%%%%%%%
function[ape,mape,accuracy5]=fscores(y_e,y)
n=length(y);
ape=abs(y_e-y)./y;
mape=sum(ape)/n;
k=0;
for i=1:n
if ape(i)<=0.05
k=k+1;
end
accuracy5=k/n;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%