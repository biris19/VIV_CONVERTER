% Field size
nx = 30;
ny = 30;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% vortex parameters
k1=2;
x_0 = 15;
y_0 = 15;

Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for x = 1:1:nx
  for y = 1:1:ny
    A = y-y_0;
    B = x-x_0;
    r = sqrt((B)^2 + (A)^2);
    Vx(y, x) = -k1/r^2;
    Vy(y, x) = -k1*A*B/r^4;
  endfor
end

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');

for i= 1:1:30
   streamline(XX, YY, Vx, Vy, x_0, i, -1);
   streamline(XX, YY, Vx, Vy, x_0, i, 1);
   streamline(XX, YY, Vx, Vy, x_0 - 5, i, -1);
   streamline(XX, YY, Vx, Vy, x_0 - 5, i, 1);
   streamline(XX, YY, Vx, Vy, x_0 + 5, i, -1);
   streamline(XX, YY, Vx, Vy, x_0 + 5, i, 1);
endfor
