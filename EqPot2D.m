% Author: Nawaf k. Abdullah
% This script simulates electric equilibrium potential in a region of space
% that does not contain any electric charge. [2D box surface illustration]
% Reference: Computational Physics 2nd Edition - Nicholas J. Giordano and
% Hisao Nakanishi

N=100; %Side length of the Box surface
V = zeros(N,N);
V(:,1)=1;
V(:,N)=-1;

for n=1:400 %Iterations for Jacobi method
    for i=2:N-1
        for j=2:N-1
            V(i,j)=(V(i-1,j)+V(i+1,j)+V(i,j+1)+V(i,j-1))*0.25; %Discretized Laplace equation in 2D
        end
    end
end

figure(1)%Graphing equilibrium potential
surface(V)
colorbar
title('Equillibrium Potential'); 
hold on
set(gca,'XTick',0:10:100)
set(gca,'XTickLabel',1:-0.2:-1)
xlabel('Voltage (V)');
hold off


figure(2) %Visualization of the electric field vectors
whitebg('black')
x = -V(:,j); % Necessary to make the electric field goes from the positive to the negative pole.
y = -V(i,:);
[xg,yg] = meshgrid(x,y);
quiver(xg',yg,'yellow');
xlim([0 102])
ylim([0 102])
title('Electric Field Direction')
hold on
set(gca,'XTick',0:10:100)
set(gca,'XTickLabel',1:-0.2:-1)
xlabel('Voltage (V)');
hold off