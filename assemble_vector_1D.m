function b=assemble_vector_1D (function_source,Gauss_nodes_number,P,T,...
                              Pb_test,Tb_test,...
                              number_of_local_basis_fun_test,...
                              basis_type_test,basis_der_x_test)
n_element=size(T,2);
Nb_nodes_test=size(Pb_test,2);
b=sparse(Nb_nodes_test,1);
for n=1:n_element%遍历T的第N列，T储存的是局部单元编号，P储存的是结点坐标
    vertices=P(:,T(:,n));%取单元结点坐标,之后都不动了，此时T(:,n)会有两个结点，P(:,T(:,n))按结点顺序构成的列，按坐标构成的行
    [Gauss_weights_reference_1D,Gauss_nodes_reference_1D]=generate_Gauss_reference_1D(Gauss_nodes_number);
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices);

       for beta=1:number_of_local_basis_fun_test%局部测试函数个数
        
           int_value=Gauss_quad_1D_source_test(function_source,Gauss_weights,Gauss_nodes,vertices,...
                                              basis_type_test,beta,basis_der_x_test);
            b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+int_value;%组装到总刚矩阵
       end    
end
