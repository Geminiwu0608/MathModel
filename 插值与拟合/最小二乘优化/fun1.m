function f = fun1(canshu,xdata);
%����canshu(1)Ϊk1,canshu(2)Ϊk2
f = exp(-canshu(1)*xdata(:,1)).*sin(canshu(2)*xdata(:,2))+xdata(:,3).^2;