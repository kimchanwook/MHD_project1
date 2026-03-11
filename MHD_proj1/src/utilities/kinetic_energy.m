function KE = kinetic_energy(m, speed)
%KINETIC_ENERGY Compute kinetic energy from mass and speed magnitude.
%
% KE = 0.5 * m * v^2

    KE = 0.5 .* m .* speed.^2;
end