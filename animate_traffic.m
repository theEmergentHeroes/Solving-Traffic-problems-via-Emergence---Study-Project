function [cars] = animate_traffic( cars_cell, cars, roads, map_size)
% This function is used for animating the traffic of cars
delay = .03;                        % delay between frames of simulation
[~, noOfCars] = size(cars);                % number of cars in the traffic
car_status = zeros(1,noOfCars);             % array containing status of various cars
plot_traffic( cars,car_status, roads, map_size );             % plotting the initial traffic
pause(delay);
num_trans = zeros(noOfCars,2);
for j=1:noOfCars
    num_trans(j,:) = size(cars_cell{j});            % number of transformations performed on jth car
end
max_trans = max(num_trans(:,1));                    % maximum number of transformations performed
for i=1:max_trans                                  % i is the index of transformation
    car_status = zeros(1,noOfCars);                % reset car_status array after each step of iteration
    for j=1:noOfCars                                  % j is the car number currently being plotted
        %% perform ith transformation on j th car in accordance to transformations mentioned in cars_cell
        % Also update the cars matrix with the above transformation
        
        cars(j) = transform_car(cars(j),cars_cell{j}(i,1),cars_cell{j}(i,2));
        
    end
    %% plot the traffic after all cars have gone through i th transformation
    %% However, before plotting considerations must be done w.r.t. conditions such as 
    % which all cars hace met with an accident and other relevant cases.
    for k=1:noOfCars-1
        for l=k+1:noOfCars
           dist = sqrt((cars(k).xcord-cars(l).xcord)^2+(cars(k).ycord-cars(l).ycord)^2);
           if(dist < 2.5)
               car_status(k) = 1;
               car_status(l) = 1;
           end
        end
    end
   plot_traffic( cars,car_status, roads, map_size);
    %%  Options such as play, pause, forward, rewind will be required for proper analysis 
    % Following code pauses simulation when an accident is detected    
       
%         if(max(car_status))
%                analyze_traffic(map_size);
%         end
       
                
    %% Following code allows for a trailing line as the car moves
    
%     hold on;
%     X(i) = cars(1).xcord;
%     Y(i) = cars(1).ycord;
%     
%     XX = min(X):.1:max(X);
%     if(i>1)
%         YY = spline(X,Y,XX);
%         plot(XX,YY,'r');
%     end
%     hold on;
%     hold off;
    %% trailing line code ends here, comment in between if not required
    pause(delay);
end
end

