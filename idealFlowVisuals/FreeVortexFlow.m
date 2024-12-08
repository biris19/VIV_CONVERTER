% Field size
nx = 40;
ny = 40;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% vortex parameters
k1=1;
x_fv = 20;
y_fv = 15;

Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for x = 1:1:nx
  for y = 1:1:ny
    r = sqrt((x-x_fv)^2 + (y-y_fv)^2);
    Vx(y, x) = -k1*(y-y_fv)/(r^2);
    Vy(y, x) = k1*(x-x_fv)/(r^2);
  endfor
end

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');
% plot streamlines
for i= x_fv:-1:10
  streamline(XX, YY, Vx, Vy, i, y_fv);
endfor
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');
