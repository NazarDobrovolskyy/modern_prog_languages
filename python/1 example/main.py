import numpy as np

# Objective function
def f_0(x):
    x1, x2 = x
    return 2 * x1**2 + 3 * x2**2

# Gradient of the objective function
def gradient_f_0(x):
    x1, x2 = x
    grad_x1 = 4 * x1
    grad_x2 = 6 * x2
    return np.array([grad_x1, grad_x2])

# Constraints
def constraint1(x):
    return 3 * x[0] + x[1] - 12

def constraint2(x):
    return -x[0] - 2 * x[1] + 10

# Stochastic Gradient Descent
def stochastic_gradient_descent(initial_point, learning_rate, num_iterations):
    x = np.array(initial_point)
    
    for i in range(num_iterations):
        grad = gradient_f_0(x)
        x1_update = x[0] - learning_rate * grad[0]
        x2_update = x[1] - learning_rate * grad[1]
        x = [max(0, x1_update), max(0, x2_update)]  # Project onto the feasible region
        
        # Project onto the constraint regions
        if constraint1(x) > 0:
            x[1] = 12 - 3 * x[0]
        if constraint2(x) > 0:
            x[1] = (10 + x[0]) / 2
    
    return x

# Set initial point, learning rate, and number of iterations
initial_point = [0, 0]
learning_rate = 0.01
num_iterations = 1000

# Run SGD
optimal_solution = stochastic_gradient_descent(initial_point, learning_rate, num_iterations)

# Print the optimal solution
print("Optimal solution:")
print("x1 =", optimal_solution[0])
print("x2 =", optimal_solution[1])
print("Minimum value of f_0(x) =", f_0(optimal_solution))
