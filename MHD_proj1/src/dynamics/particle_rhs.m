function dydt = particle_rhs(t, y, P)
%PARTICLE_RHS Right-hand side of Lorentz-force ODE system.
%
% State vector:
%   y = [x; y; z; vx; vy; vz]
%
% Equations:
%   dr/dt = v
%   dv/dt = (q/m) * ( E + v x B )

    % Extract position and velocity
    r = y(1:3);
    v = y(4:6);

    % Evaluate fields using the phase-selected field function
    [E, B] = P.fieldFcn(r, t, P);

    % Lorentz acceleration
    a = (P.q / P.m) * (E + cross(v, B));

    % Build derivative
    dydt = zeros(6,1);
    dydt(1:3) = v;
    dydt(4:6) = a;
end