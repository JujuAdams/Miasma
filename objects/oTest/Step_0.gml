prevailingDirection  += prevailingRotationSpeed;
prevailingDirection2 += prevailingRotationSpeed2;

distance0 += speed0;
distance1 += speed1;
distance2 += speed2;
distance3 += speed3;

x0 = lengthdir_x(distance0, direction0 + prevailingDirection);
y0 = lengthdir_y(distance0, direction0 + prevailingDirection);
x2 = lengthdir_x(distance2, direction2 + prevailingDirection);
y2 = lengthdir_y(distance2, direction2 + prevailingDirection);

x1 = lengthdir_x(distance1, direction1);
y1 = lengthdir_y(distance1, direction1);
x3 = lengthdir_x(distance3, direction3 + prevailingDirection2);
y3 = lengthdir_y(distance3, direction3 + prevailingDirection2);