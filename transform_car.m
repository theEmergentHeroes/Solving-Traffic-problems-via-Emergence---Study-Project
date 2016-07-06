% this function takes in a single car object and rotates it
function [car] = transform_car(car,translation, rotation)

car.xcord = car.xcord + translation*cosd(car.theta);           % translate car
car.ycord = car.ycord + translation*sind(car.theta);

car.theta = car.theta + rotation;                        % add rotation to car's current orientation
car.theta = mod(car.theta,360);                     % takes the remainder of orientation when divided by 360

end
