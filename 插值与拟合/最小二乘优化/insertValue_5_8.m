clc,clear
a = textread('data1.txt');
y0 = a(:,[2,7]);%����������y
y0 = nonzeros(y0);%ȥ������0Ԫ�ز��ұ��������
x0 = [a(:,[3:5]);a([1:end-1],[8:10])]; %����������x,�����������
canshu0 = rand(2,1);
lb = zeros(2,1);
ub = [20;2];
canshu = lsqcurvefit(@fun1,canshu0,x0,y0,lb,ub);
