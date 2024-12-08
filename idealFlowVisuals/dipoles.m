% Field size
nx = 30;
ny = 30;
xx = linspace(1,nx,nx);
yy = linspace(1,ny,ny);
[XX, YY] = meshgrid(xx, yy);


% source parameters
m_so = 1;
x_so = 20;
y_so = 15;

% sink parameters
m_si = -1;
x_si = 10;
y_si = 15;

Vx = zeros(nx, ny);
Vy = zeros(nx, ny);

for y = 1:1:nx
  for x = 1:1:ny
   r_so = sqrt((x-x_so)^2 + (y-y_so)^2);
   r_si = sqrt((x-x_si)^2 + (y-y_si)^2);
   Vx(y, x) = m_si*(x-x_so)/(2*pi*r_so^2) + m_so*(x-x_si)/(2*pi*r_si^2);
   Vy(y, x) = m_si*(y-y_so)/(2*pi*r_so^2) + m_so*(y-y_si)/(2*pi*r_si^2);
  endfor
endfor

figure(1, 'position',[1000,500,1000,1000]);
quiver(Vx, Vy, 'r-');
xlim([min(xx) max(xx)]);
ylim([min(yy) max(yy)]);
xlabel('X axis');
ylabel('Y axis');
