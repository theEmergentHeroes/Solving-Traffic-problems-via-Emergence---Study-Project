% Main program
clear
clc
% Initialziation of Cars 
for i=1:3
    cars(i).xcord=i*10;
    cars(i).ycord=i*10;
    cars(i).theta=i*10;
end
cars(3) = transform_car(cars(3),0,60);
plot_traffic( cars )
