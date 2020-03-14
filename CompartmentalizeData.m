% COMPARTMENTALIZE DATA

function [train_data, y, train_ref, val_data, val_ref, test_data, test_ref] = CompartmentalizeData(X, y, ref)

    % Break data into training set (60%), validation set (20%), and test 
    % set (20%)

    train_data = X(1:floor(length(X)*.6),:);                               % training data
    y = y(1:floor(length(y)*.6),:);                                        % truth for training
    train_ref = ref(1:floor(length(ref)*.6));                              % reference for training data X

    val_data = X(floor(length(X)*.6)+1:length(X)*.8,:);                   % validataion data
    val_ref = ref(floor(length(X)*.6)+1:length(X)*.8);                    % reference for training data X

    test_data = X(floor(length(X)*.8)+1:length(X),:);                      % test data
    test_ref = ref(floor(length(X)*.8+1):length(X));                       % reference for test data X

end % function