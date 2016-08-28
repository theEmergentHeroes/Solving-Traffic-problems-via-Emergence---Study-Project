function [ x,y ] = vertices_of_carobject( car, type )
if(strcmp(type,'normal'))
    l = 2;                 % length of car
    w = 1;                  % width of car
elseif(strcmp(type,'extended'))
    l = 2.4;
    w = 1.2;
end
trans_matx = [1 l/2 -w/2;...
    1 l/2  w/2;...                    % transformation matrix for obtaining car's vertices(x-component) from (x,y,ori) form present in cars matrix
    1 -l/2 w/2;...
    1 -l/2 -w/2];
trans_maty = [1 w/2  l/2;...
    1 -w/2 l/2;...
    1 -w/2 -l/2;...
    1 w/2 -l/2];                     % transformation matrix for obtaining car's vertices(y-component) from (x,y,ori) form present in cars matrix

x = trans_matx*[car.xcord;cosd(car.theta);sind(car.theta)];
y = trans_maty*[car.ycord;cosd(car.theta);sind(car.theta)];


end

