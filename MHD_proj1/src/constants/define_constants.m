function C = define_constants()
%DEFINE_CONSTANTS Define physical constants used in the project.

    C.qe = -1.602176634e-19;      % Electron charge (C)
    C.qp =  1.602176634e-19;      % Proton charge (C)

    C.me =  9.1093837015e-31;     % Electron mass (kg)
    C.mp =  1.67262192369e-27;    % Proton mass (kg)

    C.eV =  1.602176634e-19;      % 1 eV in Joules
    C.c  =  299792458;            % Speed of light (m/s)

    C.Re = 6.371e6;               % Earth radius (m)
    C.mu0 = 4*pi*1e-7;            % Vacuum permeability (H/m)
    C.eps0 = 8.8541878128e-12;    % Vacuum permittivity (F/m)
end