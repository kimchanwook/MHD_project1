function [E, B] = fields_uniformB(~, ~, P)
%FIELDS_UNIFORMB Uniform electric and magnetic fields for Phase 1.
%
% Inputs:
%   x : particle position (unused here)
%   t : time (unused here)
%   P : parameter struct
%
% Outputs:
%   E : electric field column vector [Ex; Ey; Ez]
%   B : magnetic field column vector [Bx; By; Bz]

    E = P.E0;
    B = [0; 0; P.B0];
end