current += dir;
if(current >= maximum){
    current = maximum;
    dir *= -1;
}
else if(current <= minimum){
    current = minimum;
    dir *= -1;
}
image_alpha = current;
alarm[0] = 10;