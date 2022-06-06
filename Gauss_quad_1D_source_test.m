function int_value=Gauss_quad_1D_source_test(function_source,Gauss_weights,Gauss_nodes,vertices,...
                                            basis_type_test,basis_index,basis_der_x_test)

int_value=0;
for k=1:length(Gauss_nodes)
%     k
    
    int_value=int_value+...%实现累加.
              Gauss_weights(k)*...%高斯加权系数
              feval(function_source,Gauss_nodes(k))*...%源函数
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index,basis_der_x_test);%测试基函数
%            aa1=[Gauss_nodes(k),int_value]
%            AA=[Gauss_weights(k),feval(function_source,Gauss_nodes(k)), FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index,basis_der_x_test)]
%            CC=feval(function_source,Gauss_nodes(k))
%            vv=basis_der_x_test
          

end

