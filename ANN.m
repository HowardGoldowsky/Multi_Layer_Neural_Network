% Problem Set #4, Neural Network to Classify Fisher's Iris Plant Database.
% Pass in the learning rate and number of iterations, function returns the 
% percent error for validation data, test data, and training data.  

function [validation_error, test_error, training_error] = ANN(learnRate, numIterations)

    % STEP 1: PREPROCESS DATA

    % Open data and preprocess. X = features, y = truth, ref = reference class 
    % to be used in prediction

    [X, y, ref] = PreProcessData();

    % STEP 2: VISUALIZE DATA

    VisualizeData(X, y)

    % STEP 3: COMPARTMENTALIZE DATA

    % Break data into training set (60%), validation set (20%), and test 
    % set (20%)

    [train_data, y, train_ref, val_data, val_ref, test_data, test_ref] = CompartmentalizeData(X, y, ref);

    % STEP 4: DESIGN ARCHITECTURE OF ANN AND INITIALIZE

    % Three layers is all we should need.
    % [4 x 6 x 3] architecture. 4 input feature nodes, six hidden nodes
    % (because this is a simple data set that requires minimal discernment), 
    % and three output nodes, one for each classification.

    numNodesInput  = 4;  % [1 x 4] feature vector
    numNodesHidden = 6;  % 6 hidden units (design choice)
    numNodesOutput = 3;  % 3 labels   

    % Initialize Theta1 and Theta2 to small random values. Mitchell suggests
    % [-0.05, 0.05]. This is roughly the initialization suggested in class, 
    % which is +/- 1/#nodes.

    initialTheta1 = rand(numNodesHidden,numNodesInput+1) * 0.1 - 0.05; 
    initialTheta2 = rand(numNodesOutput,numNodesHidden+1) * 0.1 - 0.05; 

    % STEP 5: TRAIN 
    
    [Theta1, Theta2] = TrainANN(train_data, y, initialTheta1, initialTheta2, learnRate, numIterations);

    % STEP 6: TEST RESULTS
    
    pred_test = predict(Theta1, Theta2, test_data);
    test_error = mean(double(pred_test == test_ref))*100;
    fprintf('\nTest Set Accuracy: %f\n', test_error);

    pred_val = predict(Theta1, Theta2, val_data);  
    validation_error = mean(double(pred_val == val_ref)) * 100;
    fprintf('\nValidation Set Accuracy: %f\n', validation_error);

    pred_train = predict(Theta1, Theta2, train_data);    
    training_error = mean(double(pred_train == train_ref)) * 100;
    fprintf('\nTraining Set Accuracy: %f\n', training_error);

end % function ANN
