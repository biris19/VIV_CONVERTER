
% Field size
nx = 20;
ny = 20;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% field variables
m = -100;
X0 = 5;
Y0 = 5;
Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for y = 1:1:nx
  for x = 1:1:ny
   r = sqrt((x-X0)^2 + (y-Y0)^2);
   Vx(y, x) = m*(x-X0)/(2*pi*r^2);
   Vy(y, x) = m*(y-Y0)/(2*pi*r^2);
  endfor
endfor


figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');






