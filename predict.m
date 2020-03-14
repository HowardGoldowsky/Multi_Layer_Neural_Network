function p = predict(Theta1, Theta2, X)

% This is a utility function. Basically computes a feedforward network.

m = size(X, 1);
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[~, p] = max(h2, [], 2);

end
