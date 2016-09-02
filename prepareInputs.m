function [cars] = prepareInputs(cars, roads)
% this function just takes the object of cars, and updates their inputs by
% looking at the cars around it
% the convention for theta (or any angle) is that it ranges from -180 to
% 180 so basically use atan2d

    [~, noOfCars] = size(cars);
    visiblity_range = cars(1).visibility_range; % visibility range is same for all cars
    
    for i=1:noOfCars
        for j=1:noOfCars
            if(j ~= i)
                dist = sqrt((cars(i).xcord-cars(j).xcord)^2+(cars(i).ycord-cars(j).ycord)^2);    % distance between any two cars
                if(dist < visiblity_range)
                    cars(i).visible_cars = [cars(i).visible_cars; j, dist];   % stores a 2d matrix where each row has the nearest car index and its distance
                end
            end
        end
        % now to sort the 2d matrix of visible_cars according to the distance given
        % by 2nd column
        [s, ~] = size(cars(i).visible_cars);
        if  s ~= 0
            [~,sortedIndices] = sort(cars(i).visible_cars(:,2));
            cars(i).visible_cars = cars(i).visible_cars(sortedIndices,:);
            % now the matrix of visible_cars is sorted!
        end
    end

    % preparing of inputs 
    for i = 1 : noOfCars
        % considering 4 nearest cars 
        [numVisibleCars, ~] = size(cars(i).visible_cars);
        if numVisibleCars>=4
            numVisibleCars=4;
        end
        for j = 1 : numVisibleCars
            % details of the visible car
            visibleCarIndex = cars(i).visible_cars(j,1);
            x2 = cars(visibleCarIndex).xcord;
            y2 = cars(visibleCarIndex).ycord;
            theta2 = cars(visibleCarIndex).theta;

            % details of the viewing car
            x1 = cars(i).xcord;
            y1 = cars(i).ycord;
            theta1 = cars(i).theta;

            % calculate the 3 inputs (i.e r,theta of the visible car wrt the viewing car, and orientation of the visible car)
            r_input = 1/(cars(i).visible_cars(j,2) + 1);  % proximity of visible car wrt original car (nearer the car larger the value)
            theta1_input = atan2d(y2-y1, x2-x1); % theta of the line joining the center of the cars
            theta2_input = theta2 - theta1; % direction the visible car is facing wrt the viewing car
            theta2_input = mod(theta2_input, 360); % makes sure that the range is between 0 and 360
            %convert theta2_input to -180 to 180 format
            if theta2_input > 180
                theta2_input = theta2_input - 360;
            end
            cars(i).inputs{1}(j,:) = [r_input, theta1_input, theta2_input];
        end
        % now checking for roads in visibility range
        point = cars(i).xcord;
        a = [roads(1,1), roads(1,2)];   % a and b are end points of first line
        b = [roads(1,3), roads(1,4)];
        perpDist1 = abs(det([point-a;b-a]))/norm(b-a);        
        c = [roads(2,1), roads(2,2)];   % c and d are end points of second line 
        d = [roads(2,3), roads(2,4)];   % computing distance from other line as well
        perpDist2 = abs(det([point-c;d-c]))/norm(d-c);
        
        if perpDist1 < visiblity_range
            cars(i).inputs{2}(1,1) = 1/(perpDist1+1);
        elseif perpDist2 < visiblity_range
            cars(i).inputs{2}(1,1) = 1/(perpDist2+1);
        end     
        theta = cars(i).theta;
        cars(i).inputs{2}(1,2) = 0; % implies road is visible
        cars(i).inputs{2}(1,3) = 180 - mod(theta+90, 360);  
        if cars(i).inputs{2}(1,1) == 0
            cars(i).inputs{2}(1,2) = 1; % implies road is not visible
            cars(i).inputs{2}(1,3) = 500;   % garbage value when road is not visible
        end
    end
end

