clc,clear
x0=[2.874,3.278,3.39,3.679,3.77,3.8]; %ԭʼ��������
n=length(x0);
a_x0=diff(x0)';  %��1���ۼ����У���1����ǰ���
B= [-x0(2:end)',ones(n-1,1)]
u = B\a_x0 %��С�˷���ϲ���
syms x(t)
x = dsolve(diff(x)+u(1)*x == u(2)*x^2,x(0) == x0(1)) %����Ž�
xt = vpa(x,6)
yuce = subs(x,'t',[0:n-1]) %����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x0_hat = [yuce(1),diff(yuce)] %����֪���ݵ��Ԥ��ֵ
epsilon = x0 - x0_hat %��в�
delta - abs(epsilon./x0) %��������