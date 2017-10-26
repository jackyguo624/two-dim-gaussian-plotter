
n=50; %每个轴上取n个点

x_range=10; %x范围
y_range=10; %y范围

%sigma parameter
a1=1; 
a2=5;
b1=5;
b2=1;

%mu parameter
c1=0;
c2=2;
d1=0;
d2=-2;

sigma1=[[a1,0];[0,a2]];
sigma2=[[b1,0];[0,b2]];


x=linspace(-x_range, x_range, n); % 在x轴上取n点
y=linspace(-y_range, y_range, n); % 在y轴上取n点
[X,Y]=meshgrid(x,y);

mat1=zeros(n*n,2);
mat2=zeros(n*n,2);

i=1;
j=1;
k=1;
for i=1:n
    for j=1:n
        mat1(k,1) = X(i,j)-c1;
        mat1(k,2) = Y(i,j)-c2;
        k = k + 1;
    end
end


k=1;
for i=1:n
    for j=1:n
        mat2(k,1) = X(i,j)-d1;
        mat2(k,2) = Y(i,j)-d2;
        k = k + 1;
    end
end

zz1 = ( ((2*pi)^2.*det(sigma1))^(-1./2) )* exp(-1./2.*dot( (mat1*inv(sigma1))',mat1')) ; 
zz2 = ( ((2*pi)^2.*det(sigma1))^(-1./2) )* exp(-1./2.*dot( (mat2*inv(sigma2))',mat2')) ; 

res1=zeros(n,n);
for i=0:n*n-1
    res1(floor(i/n)+1,mod(i,n)+1) = zz1(i+1);
end


res2=zeros(n,n);
for i=0:n*n-1
    res2(floor(i/n)+1,mod(i,n)+1) = zz2(i+1);
end

hold on
surf(X,Y,res1);
surf(X,Y,res2);
surfc(X,Y,res1);
surfc(X,Y,res2);
contour(X,Y,res);
colorbar; %色卡
hold off
