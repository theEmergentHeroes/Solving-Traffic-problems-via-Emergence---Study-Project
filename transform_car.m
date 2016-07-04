function [car] = transform_car(car,rotation,translation )

car_x = car(1);                    % x-coordinate of centre point of car
car_y = car(2);                    % y-coordinate of centre point of car 
car_ori = car(3);                  % orientation of car

car_x = car_x + translation*cosd(car_ori);           % translate car
car_y = car_y + translation*sind(car_ori);

car_ori = car_ori + rotation;                        % add rotation to car's current orientation
if(car_ori >= 360)
    car_ori = 360-car_ori;                          % the orientation must be kept between 0 and 360 degrees
end
car = [car_x car_y car_ori];                    % return altered values to car

end

