%parameters
nx=30;                           %Length of region(x)
ny=30;                           %Length of region(y)       
numiter=5000;                    %Number of iterations 

dx=2/(nx-1);                     %Width of(x)
dy=2/(ny-1);                     %Width of (y)
lx=0:dx:2;                        
ly=0:dy:2;       
u = cos(x).*y;
v = sin(x).*y;

%Initial Conditions
p=zeros(ny,nx);                  %array p
pn=zeros(ny,nx);                 %array pn

%Boundary conditions
p(:,1)=0;
p(:,nx)=ly;
p(1,:)=1;                %for iterative unable to reach 
p(ny,:)=p(ny-1,:);               

j=2:nx-1;
i=2:ny-1;

for iter=1:numiter
    pn=p;
    p(i,j)=((dy^2*(pn(i+1,j)+pn(i-1,j)))+(dx^2*(pn(i,j+1)+pn(i,j-1))))/(2*(dx^2+dy^2));
    %Boundary conditions
    p(:,1)=0;
    p(:,nx)=ly;
    p(1,:)=p(2,:);
    p(ny,:)=p(ny-1,:);   
end

%Plot with surf and quiver
figure(1)
surf(lx,ly,p,'EdgeColor','none'); 
title({'Laplace''s equation';['{\itNumber of iterations} = ',num2str(iter)]})
xlabel('(x)')
ylabel('(y)')
figure(2)
quiver(lx,ly,u,v);
title({'Laplace''s equation';['{\itNumber of iterations} = ',num2str(iter)]})
xlabel('(x)')
ylabel('(y)')