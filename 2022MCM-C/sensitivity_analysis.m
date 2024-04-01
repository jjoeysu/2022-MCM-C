clear;clc;tic;
bite=load('bite.mat').ttstar;bite(1827)=[];
hj=load('gold.mat').ttstar;hj(1827)=[];
BG=load('bg.mat').BG;HG=load('resultnew.mat').HG;
HB=load('resultnew.mat').HB;
%%%%%%%%%%%%%%%%%%%%
delta=-0.01:0.001:0.01;
figure(1);%Influence of gold transaction disturbance
subplot(2,2,1);
plot(delta,HG(:,1));
xlabel('Delta');ylabel('Final cash : U.S. dollars');
subplot(2,2,2);plot(delta,HG(:,2));
xlabel('Delta');ylabel('Final gold : per troy ounce');
subplot(2,2,3);plot(delta,HG(:,3));
xlabel('Delta');ylabel('Final bitcoin');
subplot(2,2,4);plot(delta,HG(:,4));
xlabel('Delta');ylabel('Final assets : U.S. dollars');
%%%%%%%%%%%%%%%%%%%
figure(2);%Influence of bitcoin transaction disturbance
subplot(2,2,1);plot(delta,HB(:,1));
xlabel('Delta');ylabel('Final cash : U.S. dollars');
subplot(2,2,2);plot(delta,HB(:,2));
xlabel('Delta');ylabel('Final gold : per troy ounce');
subplot(2,2,3);plot(delta,HB(:,3));
xlabel('Delta');ylabel('Final bitcoin');
subplot(2,2,4);plot(delta,HB(:,4));
xlabel('Delta');ylabel('Final assets : U.S. dollars');