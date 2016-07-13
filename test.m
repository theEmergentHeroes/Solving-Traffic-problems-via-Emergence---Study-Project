clear
clc
noOfCars = 1;                           % Number of cars
map_size = 100;
num_trans = 100;
cars_cell = cell(1,noOfCars);

[ cars, roads ] = initialize_traffic( noOfCars, map_size );

for i=1:noOfCars
    for j = 1:num_trans
    cars_cell{i}(j,:) = [randi([0 5]) randi([0 60])];
    end
end
cars = animate_traffic( cars_cell, cars, roads,  map_size);
