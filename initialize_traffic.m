function [ cars, roads_outer ] = initialize_traffic( noOfCars, map_size )
%% below code initializes the roads, plan_roads allows for a GUI for making
% a road map using mouse in a manner similar to as done in paint however it
% must be uncommented before use. Other initialization for a road is also
% present which a simple road with defined width and height. Note that
% roads must be marked so as to maintain continuity while marking.

% roads = plan_roads(map_size);
width = 10;             % width of roads
% roads = [map_size/4 map_size/4 map_size/4 map_size*.75; map_size/4+width map_size*.75 map_size/4+width map_size/4];
roads = [map_size/4 0 map_size/4 map_size; map_size/4+width 0 map_size/4+width map_size];
roads_outer = roads;
roads_outer(1,1) = roads_outer(1,1)-2;
roads_outer(1,3) = roads_outer(1,3)-2;
roads_outer(2,1) = roads_outer(2,1)+2;
roads_outer(2,3) = roads_outer(2,3)+2;
%plot(roads(:,[1 3])',roads(:,[2 4])','k','LineWidth',3);   % plot the roads marked by user
% hold on;
%% initialize cars
[num_roads,~] = size(roads);                                 % number of distinct roads used in the simulation
cars(noOfCars) = carObject;              % initialize car objects
j=1;
for i=1:num_roads
    xv(j) = roads(i,1);yv(j) = roads(i,2);                   % vector containing the x,y-coordinates of line segment points
    j=j+1;
    xv(j) = roads(i,3);yv(j) = roads(i,4);
    j=j+1;
end
i=1;
%% The following code first creates a car with random initialization. This car is then checked
% for constraints like it should lie on road and that it should be at a
% safe distance from other cars
while(i <= noOfCars)
    flag = 0;
    cars(i).xcord=randi([0 map_size]);                        % random initialization of car
    cars(i).ycord=randi([0 map_size]);
    cars(i).theta=randi([0 359]);
    [in,on] = inpolygon(cars(i).xcord,cars(i).ycord,xv,yv);      % check weather the centre of car lies within the polygon formed by road map
    if(in && ~on)
        if(i>1)
            for j=1:i-1
                dist = sqrt((cars(i).xcord-cars(j).xcord)^2+(cars(i).ycord-cars(j).ycord)^2);    % distance between any two cars
                if(dist<2.5)
                    flag = 0;
                    break;                                          % safe distance approx. the diagonal of car must be there between any two cars
                else
                    flag  = 1;
                end
            end
            if(flag)
                i=i+1;
            end
        else
            i=i+1;
        end
    end
end
plot_traffic( cars, roads_outer, map_size)                 % plot the entire traffic
end

