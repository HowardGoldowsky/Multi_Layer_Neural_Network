function [Theta1_grad, Theta2_grad] = BackProp(a3, a22, z2, a1, Theta2, y_matrix, m)

    d3 = a3' - y_matrix; 
    Delta2 = d3' * a22;

    g_prime = sigmoidGradient(z2)';
    d2_temp = d3 * Theta2(:,2:end);
    d2 = d2_temp .* g_prime;
    Delta1 = d2' * a1;

    Theta1_grad = Delta1/m;
    Theta2_grad = Delta2/m;

end