[x, y, z] = meshgrid (-1:0.1:1, -1:0.1:1, -3:0.1:0);
u = -x / 10 - y;
v = x - y / 10;
w = - ones (size (x)) / 10;
ostreamtube (x, y, z, u, v, w, 1, 0, 0);
