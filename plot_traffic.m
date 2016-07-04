function [  ] = plot_traffic( cars )
l = 2;                 % length of car
w = 1;                  % width of car
k = 10;                 % Alter this to vary the magnification of traffic area
trans_matx = [1 l/2 -w/2;...
              1 l/2  w/2;...                    % transformation matrix for obtaining car's vertices(x-component) from (x,y,ori) form present in cars matrix
              1 -l/2 w/2;...
              1 -l/2 -w/2];
trans_maty = [1 w/2  l/2;...
              1 -w/2 l/2;...
              1 -w/2 -l/2;...
              1 w/2 -l/2];                     % transformation matrix for obtaining car's vertices(y-component) from (x,y,ori) form present in cars matrix

dim = size(cars);

for i=1:dim(1)                                  % run this loop for all cars under consideration
        
       x = trans_matx*[cars(i,1);cosd(cars(i,3));sind(cars(i,3))];         
       y = trans_maty*[cars(i,2);cosd(cars(i,3));sind(cars(i,3))];          
  x1 = x(1);x2 = x(2); x3 = x(3);x4 = x(4);                                % x-vertex vector of rectangle associated with this car 
  y1 = y(1);y2 = y(2); y3 = y(3);y4 = y(4);                                % y-vertex vector of rectangle associated with this car
%%    %checking for length and width after transformation
%     sqrt((x1-x2)^2+(y1-y2)^2)                                     
%     sqrt((x2-x3)^2+(y2-y3)^2)
%%
%%    %checking for 90 degree angle using dot-product
%     (y1-y2)*(y3-y2)+(x1-x2)*(x3-x2)
%%
fill([x1;x2;x3;x4],[y1;y2;y3;y4],'b');                                  % Fill blue colour in the rectangle associated with vertex vectors obtained
   hold on;
   
end
   axis([-k k -k k]);                                                  % Alter this to magnify the traffic area
   hold off;
end

