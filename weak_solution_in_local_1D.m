function sum=weak_solution_in_local_1D(weak_solution_in_node_of_element,Gauss_nodes_x,vertices,basis_type,basis_der_x)
%% ���������ڵ�Ԫn�ĸ�˹���ֵ��ϵ���ֵ��
%ĳ�������ڵ�Ԫ��x,y������ֵΪ�������ڽ�㴦��ֵ��������ڣ�x,y����ֵ���������
sum=0;
for i=1:length(weak_solution_in_node_of_element)   
    sum=sum+weak_solution_in_node_of_element(i)*FE_basis_local_fun_1D(Gauss_nodes_x,vertices,basis_type,i,basis_der_x);   
end

