function [a3, a22, z2, a1, m] = Feedforward(X, Theta1, Theta2)

% FEEDFORWARD
m = size(X, 1);
a1 = [ones(m, 1) X];
z2 = Theta1 * a1'; 
a2 = sigmoid(z2);
nrowa2p = size(a2',1);
a22 = [ones(nrowa2p, 1) a2'];
z3 = Theta2 * a22';
a3 = sigmoid(z3);

end