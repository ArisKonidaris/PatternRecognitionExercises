clear ; close all; clc
DT=0.1;
%% Draw the gaussians (likelihoods)
x1=[-2:DT:12]; %Horizontal axis
x2=[-2:DT:12];
[X1,X2]=meshgrid(x1,x2);
mu1 = [3 3];
SIGMA1 = [1.2 -0.4; -0.4 1.2];
mu2 = [6 6];
SIGMA2 = [1.2 0.4; 0.4 1.2];

pY1_1=0.1;
pY2_1=1-pY1_1;
pY1_2=0.25;
pY2_2=1-pY1_2;
pY1_3=0.5;
pY2_3=1-pY1_3;
pY1_4=0.75;
pY2_4=1-pY1_4;
pY1_5=0.9;
pY2_5=1-pY1_5;
Y1=mvnpdf([X1(:) X2(:)],mu1,SIGMA1);
%Y2=mvnpdf([X1(:) X2(:)],mu2,SIGMA2);
Y2=mvnpdf([X1(:) X2(:)],mu2,SIGMA1);
Dif1 = pY1_1.*Y1-pY2_1.*Y2;
Dif2 = pY1_2.*Y1-pY2_2.*Y2;
Dif3 = pY1_3.*Y1-pY2_3.*Y2;
Dif4 = pY1_4.*Y1-pY2_4.*Y2;
Dif5 = pY1_5.*Y1-pY2_5.*Y2;
Y1R=reshape(Y1,length(x2),length(x1));
Y2R=reshape(Y2,length(x2),length(x1));
DifR1=reshape(Dif1,length(x2),length(x1));
DifR2=reshape(Dif2,length(x2),length(x1));
DifR3=reshape(Dif3,length(x2),length(x1));
DifR4=reshape(Dif4,length(x2),length(x1));
DifR5=reshape(Dif5,length(x2),length(x1));

for i=1:size(DifR1,1)
  for j=1:size(DifR1,2)
    if DifR1(i,j)>0
      DifR1(i,j)=1;
    else
      DifR1(i,j)=0;
    endif
    if DifR2(i,j)>0
      DifR2(i,j)=1;
    else
      DifR2(i,j)=0;
    endif
    if DifR3(i,j)>0
      DifR3(i,j)=1;
    else
      DifR3(i,j)=0;
    endif
    if DifR4(i,j)>0
      DifR4(i,j)=1;
    else
      DifR4(i,j)=0;
    endif
    if DifR5(i,j)>0
      DifR5(i,j)=1;
    else
      DifR5(i,j)=0;
    endif
  endfor
endfor

figure(1);hold on;
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'b','LineWidth',2)
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'g','LineWidth',2)
contour(x1,x2,DifR1,'r','LineWidth',2)
grid on
title('P(omega1)=0.1  P(omega2)=0.9');
zlabel('f(x1,x2)');
xlabel('x1');
ylabel('x2');

figure(2);hold on;
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'b','LineWidth',2)
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'g','LineWidth',2)
contour(x1,x2,DifR2,'r','LineWidth',2)
grid on
title('P(omega1)=0.25  P(omega2)=0.75');
zlabel('f(x1,x2)');
xlabel('x1');
ylabel('x2');

figure(3);hold on;
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'b','LineWidth',2)
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'g','LineWidth',2)
contour(x1,x2,DifR3,'r','LineWidth',2)
grid on
title('P(omega1)=0.5  P(omega2)=0.5');
zlabel('f(x1,x2)');
xlabel('x1');
ylabel('x2');

figure(4);hold on;
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'b','LineWidth',2)
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'g','LineWidth',2)
contour(x1,x2,DifR4,'r','LineWidth',2)
grid on
title('P(omega1)=0.75  P(omega2)=0.25');
zlabel('f(x1,x2)');
xlabel('x1');
ylabel('x2');

figure(5);hold on;
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'b','LineWidth',2)
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999],'g','LineWidth',2)
contour(x1,x2,DifR5,'r','LineWidth',2)
grid on
title('P(omega1)=0.9  P(omega2)=0.1');
zlabel('f(x1,x2)');
xlabel('x1');
ylabel('x2');
