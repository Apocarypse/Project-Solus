dir = 0.005
minimum = 0.1;
maximum = 0.2;
current = 0;
alarm[0] = 10;
wobble = 0.001;
color = c_purple;
intensity = 0.1;
sineWave = 0.15 + (1 + sin(2 * pi * current_time / 1000 * 0.30)) * 0.05;

