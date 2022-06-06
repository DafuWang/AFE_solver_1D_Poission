function int_value=Gauss_quad_1D_solution_test(weak_solution_element,Gauss_weights,Gauss_nodes,vertices,basis_type,basis_der_x)
int_value=0;
for k=1:length(Gauss_nodes) 
    int_value=int_value+...
              Gauss_weights(k)*...%高斯加权系数
              (exact_solution(basis_der_x,Gauss_nodes(k))-...%强解
              weak_solution(weak_solution_element,Gauss_nodes(k),vertices,basis_type,basis_der_x))^(2);%弱解
end
