function [ out] = check_collision( car1,car2 )
%% This function checks whether the cars, car1 and car2 have collided by checking if they overlap eachother.
%% It returns 1 if they collide else it return 0 if no collision
[x1,y1] = vertices_of_carobject( car1,'extended' );
[x2,y2] = vertices_of_carobject( car2,'extended' );
out = ~isempty(polybool('intersection', x1, y1, x2, y2));
 
end

