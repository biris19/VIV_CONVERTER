% BASIC POTENTIAL FLOWS -

% Field size
nx = 40;
ny = 40;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);

% Field parameters
U = 10;
alpha = pi/6;
Vx = ones(nx, ny)*U*cos(alpha);
Vy = ones(nx, ny)*U*sin(alpha);

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');
