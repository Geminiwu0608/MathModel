% Q-Qͼ������������Ŷ�
% ����
clc,clear
a = textread('data1.txt');
a = nonzeros(a);
xbar = mean(a);%ƽ����
s = std(a);%��׼��
% pd = normpdf(min(a):0.01:max(a),xbar,s)
pd = ProbDistUnivParam('normal',[xbar s]);%������̬�ֲ�
qqplot(a,pd);