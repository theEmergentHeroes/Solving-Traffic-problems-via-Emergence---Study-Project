% this function takes in a single car object and rotates it
function [car] = transform_car(car,translation, rotation)

if(translation>0)
    translation = .5;
elseif(translation <0)
    translation = -.5;
end
if(rotation>20)
    rotation = 20;
elseif(rotation <-20)
    rotation = -20;
end
car.xcord = car.xcord + translation*cosd(car.theta + rotation);           % translate car
car.ycord = car.ycord + translation*sind(car.theta + rotation);
car.theta = mod(car.theta + rotation,360);                     % takes the remainder of orientation when divided by 360

end
