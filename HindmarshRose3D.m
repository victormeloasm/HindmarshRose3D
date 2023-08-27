function HindmarshRose3D()

    % Parameters
    num_neurons = 25;
    simulation_time = 1000; % in milliseconds

    % Model parameters
    a = 1;
    b = 3;
    c = 1;
    d = 5;
    r = 0.006;
    s = 4;
    V_rest = -1.6;

    % External input current
    I_ext = randn(num_neurons, 1);

    % Initial conditions
    V0 = randn(num_neurons, 1);
    w0 = randn(num_neurons, 1);
    z0 = randn(num_neurons, 1);

    % Time vector
    dt = 0.01;
    time_steps = simulation_time / dt;
    time = linspace(0, simulation_time, time_steps);

    % Initialize arrays to store neuron dynamics
    V = zeros(num_neurons, time_steps);
    w = zeros(num_neurons, time_steps);
    z = zeros(num_neurons, time_steps);

    V(:,1) = V0;
    w(:,1) = w0;
    z(:,1) = z0;

    % Simulate neuron dynamics
    for t = 2:time_steps
        V_dot = w(:,t-1) - a * V(:,t-1).^3 + b * V(:,t-1).^2 - z(:,t-1) + I_ext;
        w_dot = c - d * V(:,t-1).^2 - w(:,t-1);
        z_dot = r * (s * (V(:,t-1) - V_rest) - z(:,t-1));

        V(:,t) = V(:,t-1) + dt * V_dot;
        w(:,t) = w(:,t-1) + dt * w_dot;
        z(:,t) = z(:,t-1) + dt * z_dot;
    end

    % Plot neuron dynamics
    figure;
    scatter3(V(:), w(:), z(:), '.', 'MarkerEdgeColor', 'b');
    xlabel('V');
    ylabel('w');
    zlabel('z');
    title('Hindmarsh-Rose Neuron Dynamics in 3D (Sparse)');

end
