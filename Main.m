% Main program
clear
clc
% Initialziation of Cars
noOfCars = 1;                           % Number of cars

% for i=1:noOfCars
%     cars(i).xcord=i*10;
%     cars(i).ycord=i*10;
%     cars(i).theta=i*10;
% end
     cars(1).xcord=10;
     cars(1).ycord=10;
     cars(1).theta=0;

% cars(3) = transform_car(cars(3),0,60);
% plot_traffic( cars )

cars_cell = cell(1,noOfCars);

cars_cell{1} = [1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;1 5;];
%cars_cell{2} = [5 0;20 00];
% cars_cell{3} = [0 0;0 00];
cars = animate_traffic( cars_cell, cars);