%�������
clc,clear
a =  textread('data1.txt');
d = 1 - abs(a);%�������ݱ任�������ϵ��ת��Ϊ����
d = tril(d);%��������
b = nonzeros(d);%ȥ0���������
b = b';
z = linkage(b,'complete');%�������뷨����
y = cluster(z,'maxclust',2);%�ֳ�����
ind1 = find(y == 1);ind1 = ind1'
ind2 = find(y == 2);ind2 = ind2'
h = dendrogram(z);%������ͼ
set(h,'Color','k','LineWidth',1.3);

