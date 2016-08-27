classdef carObject
    properties
        xcord = 0;
        ycord = 0;
        theta = 0;  % convention here is theta of any car object can take 0 to 359 values (in other places it is -180 to 180)
        status = 0;
        visibility_range = 4;   % this variable cannot be accessed by any function, any change must be made here itself
        visible_cars = [];              % stores a 2d matrix where each row has the nearest car index and its distance (2d matrix is of variable dimensions)
        inputs = zeros(4,3);         % basically ann has 12 total inputs of 4 nearest cars, each giving 3 inputs
                                                % 1st input is inversely prop to dist i.e, 1/(dist+1) hence min value is 0 if car is not in visibility
                                                % theta1 is the angle subtended by the center of the visible car wrt the viewing car
                                                % theta2 is the orientation of the visible car wrt the viewing car
                                                % the theta1 and theta2 for the
                                                % car inputs are -180 to 180
                                                % because they are relative to the
                                                % viewing car
    end
    
    methods
        function obj = set.xcord(obj, value)    
            obj.xcord = value;
        end
        
        function obj = set.ycord(obj, value)    
            obj.ycord = value;
        end
        
        function obj = set.theta(obj, value)    
            obj.theta = value;
        end
        
        function obj = set.status(obj, value)    
            obj.status = value;
        end
        
        function obj = set.visible_cars(obj, value)    
            obj.visible_cars = value;
        end
        
        function obj = set.inputs(obj, value)    
            obj.inputs = value;
        end
    end
end