%

% Field size
nx = 30;
ny = 30;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


dist = 0.01                                                                     ## distance between sink and source
mid_point = 15

% source parameters
m_so = 50000;
x_so = mid_point + dist/2;
y_so = 16;

% sink parameters
m_si = -50000;
x_si = mid_point - dist/2;
y_si = 16;

% Uniform flow field variables
U = 2;
alpha = 0; % rad


Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for y = 1:1:nx
  for x = 1:1:ny
   r_so = sqrt((x-x_so)^2 + (y-y_so)^2);
   r_si = sqrt((x-x_si)^2 + (y-y_si)^2);
   Vx(y, x) = m_si*(x-x_so)/(2*pi*r_so^2) + m_so*(x-x_si)/(2*pi*r_si^2) + U*cos(alpha);
   Vy(y, x) = m_si*(y-y_so)/(2*pi*r_so^2) + m_so*(y-y_si)/(2*pi*r_si^2) + U*sin(alpha);
  endfor
endfor

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r-');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');
title('Flow pass a doublet');

% plot streamlines
for i= 1:1:30
   streamline(XX, YY, Vx, Vy, (x_so+x_si)/2, i, -1);
   streamline(XX, YY, Vx, Vy, (x_so+x_si)/2, i, 1);
   streamline(XX, YY, Vx, Vy, x_si - 5, i, -1);
   streamline(XX, YY, Vx, Vy, x_si - 5, i, 1);
   streamline(XX, YY, Vx, Vy, x_si + 5, i, -1);
   streamline(XX, YY, Vx, Vy, x_si + 5, i, 1);
endfor
