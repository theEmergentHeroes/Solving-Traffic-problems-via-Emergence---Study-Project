classdef neuralNetObject
    properties
        inputNodes;     % # of inputs
        outputNodes;   % # of outputs
        hiddenLayerNodes = [];    % # of nodes in each hidden layer, arranged in order
        weights;    % this would be a cell containing variable dimensional weight matrices      
        % suppose input layer has 3 nodes and hidden layer 1 has 2 nodes,
        % then the first element in the weight cell would be a 2x3 matrix,
        % i.e from each hidden layer, you have 3 weights connecting to
        % inputs
        activationFn = 'relu';  
    end
    
    methods
        function obj = set.inputNodes(obj, value)    
            obj.inputNodes = value;
        end
        
        function obj = set.outputNodes(obj, value)    
            obj.outputNodes = value;
        end
        
        function obj = set.hiddenLayerNodes(obj, value)    
            obj.hiddenLayerNodes = value;
        end
        
        function result = computeActivation(obj, array)    
            % computes the non linear activation on all elements of the
            % array
            result = array; % i have assumed y = x for x>0 part
            if strcmp(obj.activationFn, 'relu')
                for i = 1: size(array,2)
                    if array(i) <= 0
                        result(i) = 0;
                    end
                end
            end
        end
        
        function finalOutput = computeOutputs(obj, inputs)
            [~, layers] = size(obj.weights); % layers has the no of weight matrices in the cell
            outputs = cell(1, layers);  % preallocating memory for cell, every layer of weights has an output
            outputs{1} = obj.computeActivation(obj.weights{1}*inputs);
            for i = 2: layers
                outputs{i} = obj.computeActivation(obj.weights{i}*outputs{i-1});
            end
            finalOutput = outputs{layers};
        end            
    end
end