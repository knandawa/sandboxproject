function [t, x, y, results] = projectile_sim(angle, v0, mass, g, drag)

% Convert angle to radians
theta = deg2rad(angle);

% Initial velocity components
vx = v0 * cos(theta);
vy = v0 * sin(theta);

% Time step
dt = 0.01;

% Initialize arrays
x = 0;
y = 0;
t = 0;

% Current velocities
vx_curr = vx;
vy_curr = vy;

i = 1;

% Run simulation until projectile hits ground
while y(i) >= 0
    
    % Linear drag forces
    Fx = -drag * vx_curr;
    Fy = -mass * g - drag * vy_curr;
    
    % Acceleration
    ax = Fx / mass;
    ay = Fy / mass;
    
    % Update velocity
    vx_curr = vx_curr + ax * dt;
    vy_curr = vy_curr + ay * dt;
    
    % Update position
    x(i+1) = x(i) + vx_curr * dt;
    y(i+1) = y(i) + vy_curr * dt;
    
    % Update time
    t(i+1) = t(i) + dt;
    
    i = i + 1;
end

% Store results
results.time_of_flight = t(end);
results.range = x(end);
results.max_height = max(y);

end