% Training Function

function [Theta1, Theta2] = TrainANN(X, y, Theta1, Theta2, learnRate, numIterations)

    for iter = 1:numIterations
        
        [a3, a22, z2, a1, m] = Feedforward(X, Theta1, Theta2);
        
        [Theta1_grad, Theta2_grad] = BackProp(a3, a22, z2, a1, Theta2, y, m);
        
        Theta1 = Theta1 - Theta1_grad*learnRate;
        Theta2 = Theta2 - Theta2_grad*learnRate;

    end % for

end % function