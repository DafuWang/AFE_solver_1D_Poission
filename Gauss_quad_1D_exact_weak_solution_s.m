function int_value=Gauss_quad_1D_exact_weak_solution_s(weak_solution_in_node_element,Gauss_weights,Gauss_nodes,vertices,basis_type,basis_der_x)
int_value=0;
for k=1:length(Gauss_weights) 
    int_value=int_value+...
              Gauss_weights(k)*...%高斯加权系数
              (function_exact_order_solution_1D_s(basis_der_x,Gauss_nodes(k))-...%强解
              weak_solution_in_local_1D(weak_solution_in_node_element,Gauss_nodes(k),vertices,basis_type,basis_der_x))^(2);%弱解
end
