%�� svmtrain ѵ��֧������������ svmclassify ����
clc,clear
a0 = load('data1.txt');
a = a0';
b0 = a(:,[1:27]);%��ȡ�ѷ�������
dd0 = a(:,[28:end]);%��ȡ����������
[b,ps] = mapstd(b0);%�ѷ������ݱ�׼��
dd = mapstd('apply',dd0,ps);%���������ݱ�׼��
group = [ones(20,1);2*ones(7,1)];%��֪������������
s = svmtrain(b',group) %ѵ��֧��������
% sv_index = s.SupportVectorIndices;%����֧�������ı��
% beta = s.Alpha; %���ط��ຯ����Ȩϵ��
% bb = s.Bias;%���ط��ຯ���ĳ�����
% mea_and_std_trans = s.ScaleData;%��һ�з��ص�����֪�������ֵ�������෴������2�з��ص��Ǳ�׼�������ĵ���
check = svmclassify(s,b');%��֤��֪������
err_rata = 1 - sum(group == check)/length(group);%���������
soluruib = svmclassify(s,dd') %�Դ������������