function error=computer_infinite_error_1D_s(weak_solution,Tb_test,T,P,Gauss_nodes_number_1D,basis_type)
error=0;
[Gauss_weights_reference_1D,Gauss_nodes_reference_1D]=generate_Gauss_reference_1D(Gauss_nodes_number_1D);
for n=1:size(T,2)
    vertices=P(:,T(:,n));%搞错过
    weak_solution_in_node_of_element=weak_solution(Tb_test(:,n));%取单元n的所有点弱解值
    
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices);

        r=max(abs(function_exact_order_solution_1D_s(0,Gauss_nodes(:,1))-...
              weak_solution_in_local_1D(weak_solution_in_node_of_element,Gauss_nodes(:,1),vertices,basis_type,0)));
        if r>error
           error=r; 
        end
   
end
