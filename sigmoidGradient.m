function g = sigmoidGradient(z)

    % This line computes the gradient of the Sigmoid function.
    g = sigmoid(z) .* (1 - sigmoid(z));

end
