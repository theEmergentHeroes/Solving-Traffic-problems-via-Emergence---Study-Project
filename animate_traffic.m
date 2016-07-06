function [cars] = animate_traffic( cars_cell, cars)
% This function is used for animating the traffic of cars
delay = .1;                        % delay between frames of simulation
plot_traffic( cars );             % plotting the initial traffic
pause(delay);
%dim = size(cars_cell);
[~, noOfCars] = size(cars);                % number of cars in the traffic
num_trans = zeros(noOfCars,2);
for j=1:noOfCars
    num_trans(j,:) = size(cars_cell{j});            % number of transformations performed on jth car
end
max_trans = max(num_trans(:,1));                    % maximum number of transformations performed

for i=1:max_trans                                  % i is the index of transformation
    for j=1:noOfCars                                  % j is the car number currently being plotted
        %% perform ith transformation on j th car in accordance to transformations mentioned in cars_cell
        % Also update the cars matrix with the above transformation
        
        cars(j) = transform_car(cars(j),cars_cell{j}(i,1),cars_cell{j}(i,2));
        
    end
    %% plot the traffic after all cars have gone through i th transformation
    plot_traffic( cars );
    %% Following code allows for a trailing line as the car moves
    
    hold on;
    X(i) = cars(1).xcord;
    Y(i) = cars(1).ycord;
    
    XX = min(X):.1:max(X);
    if(i>1)
        YY = spline(X,Y,XX);
        plot(XX,YY,'r');
    end
    hold on;
    hold off;
    %% trailing line code ends here, comment in between if not required
    pause(delay);
end
end

