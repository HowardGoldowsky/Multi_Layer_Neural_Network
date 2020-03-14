% PREPROCESSING FUNCTION

function [X, y, ref] = PreProcessData()

% Read in data. Format data. 50 examples each for 3 classes of plants. We 
% will represent the plant class by [1x3] binary truth vectors [1 0 0], 
% [0 1 0], and [0 0 1], which will represent the desired output of the NN.

fid = fopen('IrisData.txt');
textData = textscan(fid,'%s',150);
fclose(fid);

% Init data and truth arrays

X = nan(150,4);         % feature vectors for data
y = nan(150,3);         % reference vector in a format used by backprop
ref = nan(150,1);       % reference vector in a format used by test data

for line = 1:150
    
    tempLine = cell2mat(textData{1}(line));
    tempLine = strrep(tempLine,',',' ');
    S = regexp(tempLine,'\w+-\w+','match'); % grab label
    
    X(line,:) = sscanf(tempLine,'%f',4);    % grab features
    
    switch(S{1})                            % switch on label
        case 'Iris-setosa'
            y(line,:) = [1,0,0];
            ref(line) = 1;
            
        case 'Iris-versicolor'
            y(line,:) = [0,1,0];
            ref(line) = 2;
            
        case 'Iris-virginica'
            y(line,:) = [0,0,1];
            ref(line) = 3;
            
    end % case
  
end % for line

% normalize the data to be within [0,1]
X = bsxfun(@rdivide, X, max(abs(X)));

% randomly shuffle the data
order = randperm(length(X));
X = X(order,:);
y = y(order,:);
ref = ref(order);

end % function
