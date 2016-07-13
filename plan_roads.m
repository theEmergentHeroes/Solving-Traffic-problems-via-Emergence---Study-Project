function [ roads] = plan_roads(map_size)
%% The following part of code make the road-map on which traffic will flow
figure;
axis([0 map_size 0 map_size]);                                       % traffic space
i=1;
while(~waitforbuttonpress)
[x, y] = ginput(2);                                        % take a 2-clicks input from mouse
x = round(x,-1);                                           % round off x-coordinate to nearest ten
y = round(y,-1);                                           % round off y-coordinate to nearest ten 
roads(i,:) = [x(1) y(1) x(2) y(2)];                        % append roads matrix
i=i+1;    
plot(roads(:,[1 3])',roads(:,[2 4])','k','LineWidth',3);   % plot the roads marked by user
axis([0 500 0 500]);                                       % traffic space
hold on;
end
hold off;
end

