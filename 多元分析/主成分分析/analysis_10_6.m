clc,clear
data = load('data2.txt');
data = zscore(data);
r = corrcoef(data);
%下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分系数
[vec1,lamda,rate] = pcacov(r);%lamda 为r的特征值，rate为各成分的贡献率
contr = cumsum(rate);%计算累积贡献率
f = repmat(sign(sum(vec1)),size(vec1,1),1)%构造与vec1同维数的元素为正负1的矩阵
vec2 = vec1.*f %修改特征向量的正负号，使得每个特征向量的分量和为正
num = 4;%num为选取主成分数
df = data * vec2(:,1:num); %计算各个主成分的得分
tf = df * rate(1:num)/100;%计算综合得分
[stf,ind] = sort(tf,'descend');%把得分按高低次序排列
stf = stf',ind = ind'