%���Իع�
clc,clear
ab = textread('data2.txt');
Y = ab(:,[2:5:10]); Y = nonzeros(Y);
ab([1:12],[8:10]);
x123 = [ab([1:13],[3:5]);ab([1:12],[8:10])];
X = [ones(25,1),x123];
%beta�����ع�ϵ����betaint�����ع�ϵ����������ƣ�r�����вrint������������
%st�������ڼ���ع�ģ�͵�ͳ��������4����ֵ���ж�ϵ��R^2��Fͳ�����۲�ֵ�������p��ֵ������Ĺ���
[beta,betaint,r,rint,st] = regress(Y,X);

% q = sum(r.^2);
% ybar =mean(Y)
