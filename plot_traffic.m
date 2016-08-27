function [  ] = plot_traffic( cars, roads, map_size )
l = 2;                 % length of car
w = 1;                  % width of car
trans_matx = [1 l/2 -w/2;...
              1 l/2  w/2;...                    % transformation matrix for obtaining car's vertices(x-component) from (x,y,ori) form present in cars matrix
              1 -l/2 w/2;...
              1 -l/2 -w/2];
trans_maty = [1 w/2  l/2;...
              1 -w/2 l/2;...
              1 -w/2 -l/2;...
              1 w/2 -l/2];                     % transformation matrix for obtaining car's vertices(y-component) from (x,y,ori) form present in cars matrix

[~, noOfCars] = size(cars);                % number of cars in the traffic

for i=1:noOfCars                                 % run this loop for all cars under consideration
    
    x = trans_matx*[cars(i).xcord;cosd(cars(i).theta);sind(cars(i).theta)];
    y = trans_maty*[cars(i).ycord;cosd(cars(i).theta);sind(cars(i).theta)];
    x1 = x(1);x2 = x(2); x3 = x(3);x4 = x(4);                                % x-vertex vector of rectangle associated with this car
    y1 = y(1);y2 = y(2); y3 = y(3);y4 = y(4);                                % y-vertex vector of rectangle associated with this car
    
    %    checking for length and width after transformation
    %     sqrt((x1-x2)^2+(y1-y2)^2)
    %     sqrt((x2-x3)^2+(y2-y3)^2)
    %    checking for 90 degree angle using dot-product
    %     (y1-y2)*(y3-y2)+(x1-x2)*(x3-x2)
    % Following code fills colour in cars depending upon the status of that car
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
    
    % Following code displays the buttons used for analyze function
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
   
   % plot a visibility circle
    x1 = cars(1).xcord;
    y1 = cars(1).ycord;
    r = cars(1).visibility_range;
    plotCircle(x1, y1, r);
end
