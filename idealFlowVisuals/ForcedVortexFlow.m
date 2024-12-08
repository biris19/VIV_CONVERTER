% Field size
nx = 30;
ny = 30;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% vortex parameters
k1=1;
x_fv = 15;
y_fv = 15;

Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for x = 1:1:nx
  for y = 1:1:ny
    A = y - y_fv;
    B = x - x_fv;
    r = sqrt(B^2 + A^2);
    Vx(y, x) = k1*(2*B*atan(A/B) - A);
    Vy(y, x) = k1*(2*A*atan(A/B) + B);
  endfor
end

zz = zeros(nx, ny);

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');
