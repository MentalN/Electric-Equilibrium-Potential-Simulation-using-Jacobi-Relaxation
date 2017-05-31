% Author: Nawaf k. Abdullah
% This script simulates electric equilibrium potential in a region of space
% that does not contain any electric charge. [3D box illustration]
% Reference: Computational Physics 2nd Edition - Nicholas J. Giordano and
% Hisao Nakanishi

N=100; %Box side length
V = zeros(N,N,N);
V(:,:,1)=1;
V(:,:,N)=-1;

for n=1:1000 %Iterations for Jacobi method
    for i=2:N-1
        for j=2:N-1
            for k=2:N-1
                V(i,j,k)=(V(i+1,j,k)+V(i-1,j,k)+V(i,j+1,k)+V(i,j-1,k)+V(i,j,k+1)+V(i,j,k-1))*(1/6);
            end
        end
    end
end



figure(1) %Graphing equilibrium potential
xslice = [100, 50];                 % location of y-z planes
yslice = [100, 50];                 % location of x-z plane
zslice = [1, 20, 50, 80];           % location of x-y planes
slice(V,xslice,yslice,zslice)
colorbar
hold on
title('Equillibrium Potential'); 
set(gca,'ZTick',0:10:100)
set(gca,'ZTickLabel',1:-0.2:-1)
zlabel('Voltage (V)');
hold off

figure(2)%Visualization of the electric field vectors
x=-V(:,j,k);
y=-V(i,:,k);
z=V(i,j,:);
h=zeros(3,3);
[x,y,z]=surfnorm(h);
quiver3(h,x,y,z,'yellow')
hold on
title('Electric Field Direction')
set(gca,'xTick',[]);
set(gca,'YTick',[]);
set(gca,'zTick',[0:10:100]);
set(gca,'ZTickLabel',1:-0.2:-1)
hold off