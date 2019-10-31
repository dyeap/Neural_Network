classdef Layer
    methods (Access = public)
        % Constructor
        function obj = Layer(name,num,num_filters,stride,filter_size,fc_numNodes,method,bool_finalFC)
            obj.name = name;
            obj.num = num;
            if(name == 'c') % convolutional layer
                obj.info = Convolution(stride,num_filters,filter_size);
            elseif(name == 'p') % pool layer
                obj.info = Pool(stride, filter_size);
            elseif(strcmp(name,'flat'))
                obj.info = Flatten();
            elseif(strcmp(name,'fc'))
                obj.info = FullyConnectedNeuralNetwork(fc_numNodes,method,bool_finalFC);
            elseif(name == 'r')
                % dont need to do anything
            else
                disp("Layer is not yet defined")
            end
        end
        function obj = set_input(obj,input)
            obj.layer_io = LayerIO(input);
        end
    end
    properties
        % Needed for all layers
        name, num;
        % Define convolution layer
        info; % will either be a convolution, pool or relu
        io = LayerIO;
    end
end