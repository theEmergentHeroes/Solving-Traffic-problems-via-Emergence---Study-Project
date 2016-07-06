% this function takes in a single car object and rotates it
function [car] = transform_car(car,translation, rotation)

car.xcord = car.xcord + translation*cosd(car.theta + rotation);           % translate car
car.ycord = car.ycord + translation*sind(car.theta + rotation);
car.theta = mod(car.theta + rotation,360);                     % takes the remainder of orientation when divided by 360


end
