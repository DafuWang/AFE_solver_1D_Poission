function error=computer_error_L2_1D_s(T,P,Tb_trial,Gauss_nodes_number,weak_solution,basis_type)
error=0;
[Gauss_weights_reference_1D,Gauss_nodes_reference_1D]=generate_Gauss_reference_1D(Gauss_nodes_number);

for n=1:size(T,2)
%% 这两条与维数无关不用修改
    vertices=P(:,T(:,n));%取单元n的两个端点坐标，用于计算基函数
    weak_solution_in_node_of_element=weak_solution(Tb_trial(:,n));%取单元n的所有点弱解值
%%  此处需要将高斯积分从一维换到二维  
    
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices);
   
    error=error+Gauss_quad_1D_exact_weak_solution_s(weak_solution_in_node_of_element,Gauss_weights,Gauss_nodes,vertices,basis_type,0); 
    
end
    error=sqrt(error);
end
