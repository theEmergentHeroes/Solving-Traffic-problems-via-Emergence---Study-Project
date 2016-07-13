function [ translation, rotation ] = force2motion( car, Fx, Fy )

F_dir = mod(atan2d(Fy,Fx),360);    % get the direction of force vector in the range (0,360)
phi = mod(F_dir - car.theta,360);  % amount of rotation required to be done

translation = Fx*cosd(car.theta) + Fy*sind(car.theta);  % dot product of Force vector and car's orientation
if(translation > 3)
    translation = 3;            % limiting the maximum translation in one step
elseif(translation<-3)                 
    translation = -3;
end

if(phi < 45)
    rotation = phi;
elseif(phi < 90)
    rotation = 45;
elseif(phi < 135)
    rotation = 45;  
elseif(phi < 180)
    rotation = 180-phi;                 % rotation of car's wheel to accomodate the required force
elseif(phi < 225)
    rotation = 180-phi;
elseif(phi < 270)
    rotation = -45;
elseif(phi < 315)
    rotation = -45;
else
    rotation = phi-360;
end

[translation,rotation];
end

