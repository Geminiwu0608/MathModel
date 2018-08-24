%�������
clc,clear
gj = load('data3.txt');
gj(:,[3:6]) = [];%ɾ��3-6�У���ֻʹ�ñ���1,2,3,8,9,10
b = zscore(gj);%�����׼��
y = pdist(gj);%������ŷʽ���룬ÿһ�ж���һ������
z = linkage(y,'average');%����ƽ��������
h = dendrogram(z);%������ͼ
set(h,'Color','k','LineWidth',1.3);
T = cluster(z,'maxclust',6);%�Ѷ����Ϊ3��
for k=3:5
    fprintf('���ֳ�%d��Ľ������:\n',k);
    T = cluster(z,'maxclust',k);%�������㻮�ֳ�k��
    for i = 1:k
        tm = find(T == i);%���i��Ķ���
        tm = reshape(tm,1,length(tm));%��ɵ�i�����
        fprintf('��%d�����%s\n',i,int2str(tm));%��ʾ������
    end
    if k == 5
        break
    end
    fprintf('****************************************\n');
end