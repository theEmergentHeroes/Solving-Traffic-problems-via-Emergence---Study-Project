function [  ] = plot_traffic( cars, roads, map_size )
[~, noOfCars] = size(cars);                % number of cars in the traffic

for i=1:noOfCars                                 % run this loop for all cars under consideration       
 [x,y] =  vertices_of_carobject( cars(i),'normal');
  x1 = x(1);x2 = x(2); x3 = x(3);x4 = x(4);                                % x-vertex vector of rectangle associated with this car 
  y1 = y(1);y2 = y(2); y3 = y(3);y4 = y(4);                                % y-vertex vector of rectangle associated with this car
%% Following code fills colour in cars depending upon the status of that car
%currently a car has two status one indicating that the particular car has
%met with an accident (Red colour) while other for no such case

if(cars(i).status == 0)
fill([x1;x2;x3;x4],[y1;y2;y3;y4],'y');                                  % Fill blue colour in the rectangle associated with vertex vectors obtained
hold on;
fill([x1;x2;cars(i).xcord],[y1;y2;cars(i).ycord],'b');
else
fill([x1;x2;x3;x4],[y1;y2;y3;y4],'r');
end
plot(cars(i).xcord,cars(i).ycord,'*k');
plot(roads(:,[1 3])',roads(:,[2 4])','k','LineWidth',3);   % plot the roads marked by user
%% Following code displays the buttons used for analyze function
fill([0;0;5;5],[map_size;map_size-5;map_size-5;map_size],'y');
fill([5;5;10;10],[map_size;map_size-5;map_size-5;map_size],'y');
fill([0;0;5;5],[map_size-5;map_size-10;map_size-10;map_size-5],'y');
fill([5;5;10;10],[map_size-5;map_size-10;map_size-10;map_size-5],'y');
txt1 = 'stop';
txt2 = 'play';
txt3 = 'back';
txt4 = 'forward';
text(0,map_size-3,txt1);
text(5,map_size-3,txt2);
text(0,map_size-7,txt3);
text(5,map_size-7,txt4);
end
   axis([0 map_size 0 map_size]);                                                  % Alter this to magnify the traffic area
   hold off;
end
