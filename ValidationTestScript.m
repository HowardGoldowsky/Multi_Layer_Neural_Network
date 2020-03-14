% Validation Test Script
clear all; %#ok<CLALL>

maxTries = 30;

error_test = nan(maxTries,1);
error_val = nan(maxTries,1);
error_train = nan(maxTries,1);
numIterations = nan(maxTries,1);

learnRate = 0.33;

for i = 1:maxTries
    
    numIterations(i) = i*100;
    [error_val(i), error_test(i), error_train(i)] = ANN(learnRate, numIterations(i));
    
end
    
figure(2);
plot(numIterations,error_test,'g*-'); hold on;
plot(numIterations,error_val,'bx-'); hold on;
plot(numIterations,error_train,'ro-'); hold on;

xlabel('Number of Iterations');
ylabel('Percent Correct Classification');

title('Percent Correct Classification as a Function of Number of Iterations');
legend('Test Data','Validation Data','Training Data','Location','southeast')