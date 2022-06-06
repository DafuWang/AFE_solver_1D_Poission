function sum=weak_solution_in_local_1D(weak_solution_in_node_of_element,Gauss_nodes_x,vertices,basis_type,basis_der_x)
%% 计算弱解在单元n的高斯积分点上的数值，
%某个变量在单元（x,y）处的值为，变量在结点处的值与基函数在（x,y）处值的线性组合
sum=0;
for i=1:length(weak_solution_in_node_of_element)   
    sum=sum+weak_solution_in_node_of_element(i)*FE_basis_local_fun_1D(Gauss_nodes_x,vertices,basis_type,i,basis_der_x);   
end

