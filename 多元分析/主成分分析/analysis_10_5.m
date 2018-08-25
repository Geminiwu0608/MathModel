clc,clear
data = load('data1.txt');
[m,n] = size(data);
x0 = data(:,[1:n-1]);
y0 = data(:,n);
hg1 = [ones(m,1),x0]\y0;%������ͨ��С���˷��ع�ϵ��
hg1 = hg1';%�����������ʾ�ع�ϵ�������е�һ�������ǳ����������X1,...,Xn����
fprintf('y = %f',hg1(1));%��ʼ��ʾ��ͨ��С���˷��ع���
for i=2:n
    if hg1(i) > 0
        fprintf('+%f*x%d',hg1(i),i-1);
    else
        fprintf('%f*x%d',hg1(i),i-1);
    end
end
fprintf('\n\n');
r = corrcoef(x0);%�������ϵ������
xd = zscore(x0);%��׼������
yd = zscore(y0);
[vec1,lamda,rate] = pcacov(r); %vec1Ϊr������������lamdaΪ����ֵ��rateΪ�������ɷֵĹ�����
f = repmat(sign(sum(vec1)),size(vec1,1),1);%������vec1ͬά����Ԫ��Ϊ����1�ľ���
vec2 = vec1.*f ;%�޸����������������ţ�ʹ�������������з�����Ϊ��
contr = cumsum(rate); %�����ۻ������ʣ���i��������ʾǰi�����ɷֵĹ�����
df = xd * vec2;%�����������ɷֵĵ÷�
num = 3;
% num = input('��ѡ�����ɷֵĸ���:');%ͨ���ۻ������ʽ���ʽѡ�����ɷֵĸ���
hg21 = df(:,[1:num])\yd %���ɷֱ����Ļع�ϵ���������������ݱ�׼�����ع鷽�̵ĳ�����Ϊ0
hg22 = vec2(:,1:num)*hg21%��׼�������Ļع�ϵ������
hg23 = [mean(y0)-std(y0)*mean(x0)./std(x0)*hg22,std(y0)*hg22'./std(x0)];%����ԭʼ�����ع鷽��ϵ��
fprintf('y=%f',hg23(1));%��ʼ��ʾ���ɷֻع���
for i=2:n
    if hg23(i) > 0
        fprintf('+%f * x%d',hg23(i),i-1);
    else
        fprintf('%f * x%d',hg23(i),i-1);
    end
end
fprintf('\n');
rese1 = sqrt(sum((hg1(1)+x0*hg1(2:end)')-y0).^2/(m-n));%���n������
rese2 = sqrt(sum((hg1(1)+x0*hg23(2:end)')-y0).^2/(m-num));%���num������