function [Gauss_coefficient_local_1D,Gauss_point_local_1D]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices)

Gauss_coefficient_local_1D=(vertices(1,2)-vertices(1,1))/2.*Gauss_weights_reference_1D;
Gauss_point_local_1D=(vertices(1,2)-vertices(1,1))/2.*Gauss_nodes_reference_1D+(vertices(1,2)+vertices(1,1))/2;
