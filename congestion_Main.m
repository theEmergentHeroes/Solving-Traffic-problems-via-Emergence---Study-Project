% Program to simulate the problem of congestion using predefined Rules
%% This program aims to first create an environment of a road and associated
% traffic. The cars in this traffic will follow simple rules to solve
% congestion. The rules that will be used are:-
% 1. Align with other cars taking into account the free space available
% which will influence the car to allign in the direction of motion of
% traffic.
% 2. The distance moved by the rear wheel of car will depend upon the
% magnitude of the vector sum of repulsions from neighbouring cars and
% attractive force from goal point. The repulsive forces are to be of
% inverse square nature while that of attracting forces will be a constant

clear
clc
noOfCars = 25;                           % Number of cars
map_size = 50;                          % size of map for simulating cars
num_trans = 100;                         % Max number of transformations in the simulation
cars_cell = cell(1,noOfCars);            % initializing cars_cell cell for storing transformations
visiblity_range = 4;                     % visiblity range of a car to see other cars
Q = 30;
%% Initialization of traffic, for furthere details check function initialize_traffic.m
[ cars, roads ] = initialize_traffic( noOfCars, map_size );
%   cars(1).xcord = 20;
%   cars(1).ycord = 20;
%   cars(1).theta = 20;
%   roads = [0 0 0 0];
cars0 = cars;
for k=1:num_trans
    for i=1:noOfCars
    cars(i).visible_cars = [];
    end
%% The following code calculates all the cars which are in visible range of any given car.
for i=1:noOfCars
    for j=1:noOfCars
        if(j ~= i)
            dist = sqrt((cars(i).xcord-cars(j).xcord)^2+(cars(i).ycord-cars(j).ycord)^2);    % distance between any two cars
            if(dist < visiblity_range)
                cars(i).visible_cars = [cars(i).visible_cars,j];
            end
            
        end
    end
end

%% The following code is for the rule which calculates the distance moved by rear wheel based on the vector sum of attracting and repelling forces
for i=1:noOfCars
    Fx = 0; Fy = 0;
    for j=cars(i).visible_cars
        dist = sqrt((cars(i).xcord-cars(j).xcord)^2+(cars(i).ycord-cars(j).ycord)^2);
        Fx = Fx + Q*(cars(i).xcord-cars(j).xcord)/dist^3;
        Fy = Fy + Q*(cars(i).ycord-cars(j).ycord)/dist^3 ;   
    end
%% Force calculation for repulsion due to roads
    [Frx, Fry] = repulsion_roads(roads, cars(i));
    Fx = Fx + Frx;
    Fy = Fy + Fry;
%% Force due to attraction of goal   
   [~,noOfvisibleCars] = size(cars(i).visible_cars);
    if(noOfvisibleCars < 3);
    Fy = Fy + 2;
    end
    [cars_cell{i}(k,1),cars_cell{i}(k,2)] = force2motion(cars(i), Fx, Fy);

end
 for i=1:noOfCars
        cars(i) = transform_car(cars(i),cars_cell{i}(k,1),cars_cell{i}(k,2));
      % cars = animate_traffic( cars_cell, cars, roads,  map_size);
 end
end
cars = animate_traffic( cars_cell, cars0, roads,  map_size);