classdef carObject
    properties
        xcord = 0;
        ycord = 0;
        theta = 0;
        status = 0;
        visible_cars = [];
        inputs = zeros(4,3); % basically ann has 12 total inputs of 4 nearest cars, each giving 3 inputs
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