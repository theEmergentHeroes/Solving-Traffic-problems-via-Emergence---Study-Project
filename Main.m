% Main program
clear
clc
% Initialziation of Cars 
cars = zeros(2,3);
cars(1,:) = [0 0 90];
cars(2,:) = transform_car(cars(1,:),60,0);
plot_traffic( cars )


