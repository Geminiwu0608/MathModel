clc,clear
data = load('data2.txt');
data = zscore(data);%���ݱ�׼��
r = corrcoef(data) %�������ϵ������
%�����������ϵ������������ɷַ���,x����Ϊr�����������������ɷֵ�ϵ��
[x,y,z] = pcacov(r)%yΪr������ֵ,zΪ�������ɷֵĹ�����
f = repmat(sign(sum(x)),size(x,1),1)%����ͬά�ȵ�����һ����
x = x.*f %�޸�����������������,ÿ�����������������еķ���ͷ��ź�����ֵ
num = 3;%numΪѡȡ�����ɷָ���
df = data*x(:,[1:num]) %����������ɷֵĵ÷�
tf = df*z(1:num)/100 %�����ۺϵ÷�
[stf,ind] = sort(tf,'descend') %���յ÷�����
stf = stf';
ind = ind';