function int_value=Gauss_quad_1D_source_test(function_source,Gauss_weights,Gauss_nodes,vertices,...
                                            basis_type_test,basis_index,basis_der_x_test)

int_value=0;
for k=1:length(Gauss_nodes)
%     k
    
    int_value=int_value+...%ʵ���ۼ�.
              Gauss_weights(k)*...%��˹��Ȩϵ��
              feval(function_source,Gauss_nodes(k))*...%Դ����
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index,basis_der_x_test);%���Ի�����
%            aa1=[Gauss_nodes(k),int_value]
%            AA=[Gauss_weights(k),feval(function_source,Gauss_nodes(k)), FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index,basis_der_x_test)]
%            CC=feval(function_source,Gauss_nodes(k))
%            vv=basis_der_x_test
          

end

