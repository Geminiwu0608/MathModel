clc,clear
x1 = [6.683,6.681,6.676,6.678,6.679,6.672];
x2 = [6.661,6.661,6.667,6.667,6.664];
[h1,p1,cil,std1] = ttest(x1,mean(x1),'Alpha',0.1)   %��ֵ��֤���������
[h2,p2,ci2,std2] = ttest(x2,mean(x2),'Alpha',0.1)
[h3,p3,ci3,std3] = vartest(x1,mean(x1),'Alpha',0.1) %���������������
[h4,p4,ci4,std4] = vartest(x2,mean(x2),'Alpha',0.1)