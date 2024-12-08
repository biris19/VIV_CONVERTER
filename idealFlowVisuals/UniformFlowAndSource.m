
% Field size
nx = 40;
ny = 40;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% Source field variables
m = 150;
X0 = 20;
Y0 = 20;

% Uniform flow field variables
U = 5;
alpha = 0; % rad


Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for y = 1:1:nx
  for x = 1:1:ny
   r = sqrt((x-X0)^2 + (y-Y0)^2);
   Vx(y, x) = m*(x-X0)/(2*pi*r^2) + U*cos(alpha);
   Vy(y, x) = m*(y-Y0)/(2*pi*r^2) + U*sin(alpha);
  endfor
endfor


figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');


for i= 1:1:nx

   streamline(XX, YY, Vx, Vy, X0 - 5, i, -1);
   streamline(XX, YY, Vx, Vy, X0 - 5, i, 1);
   streamline(XX, YY, Vx, Vy, X0 + 5, i, -1);
   streamline(XX, YY, Vx, Vy, X0 + 5, i, 1);
endfor


xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');

