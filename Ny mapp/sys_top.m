function F = sys_top(T_top, T_A, D_in, dmA)
    
    A_top = pi * (D_in/2)^2; eps = 0.94; boltz =  5.67e-8; T_O = 293.15;
    
    % Heat Flows
    q_radiation = - eps * boltz * A_top * (T_top^4 - T_O^4);
    q_convection_out = - h_top_outside(T_top, D_in) * A_top * (T_top - T_O);
    q_vap = - dHvap_water(T_top) * dmA;
    q_convection_in = - h_top_inside(T_top, T_A, D_in) * A_top * (T_A - T_top);
    
    F = q_convection_out + q_radiation + q_vap - q_convection_in;
    
end