%�������
clc,clear
a = load('data2.txt');
b = zscore(a);%�����׼��
r = corrcoef(b)%�������ϵ������
%d = tril(1-r);d = nonzeros(d)';%��һ�ּ������ķ�ʽ
d = pdist(b','correlation');%�������ϵ����������
z = linkage(d,'average');%����ƽ��������
h = dendrogram(z);%������ͼ
set(h,'Color','k','LineWidth',1.3);
T = cluster(z,'maxclust',6);%�Ѷ����Ϊ3��
for i=1:6
    tm = find(T == i);%���i��Ķ���
    tm = reshape(tm,1,length(tm));%��ɵ�i�����
    fprintf('��%d�����%s\n',i,int2str(tm));%��ʾ������
end