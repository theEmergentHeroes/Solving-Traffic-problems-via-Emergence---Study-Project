function [ Fx, Fy ] = repulsion_roads( roads, car )

 [noOfRoads,~] = size(roads);
 Q = 5; 
 dist = zeros(1,noOfRoads);
    x = car.xcord;
    y = car.ycord; 
    P = [x;y];
 for i=1:noOfRoads
     
     P1 = [roads(i,1);roads(i,2)];
     P2 = [roads(i,3);roads(i,4)];
     
     R = (P-P1)-(dot((P-P1),(P2-P1))/norm(P2-P1)^2)*(P2-P1);     % calculate the perpendicular distance of car from a road
     dist(i) = norm(R);
     
 end
%    dist
   [M,I] = min(dist);
     P1 = [roads(I,1);roads(I,2)];
     P2 = [roads(I,3);roads(I,4)];
     
     R = (P-P1)-(dot((P-P1),(P2-P1))/norm(P2-P1)^2)*(P2-P1);
     Fx = Q*R(1)/M^2;
     Fy = 0;
    if(M < .3)
    Fx = Inf;
%     Fy = Inf;
     end
end

