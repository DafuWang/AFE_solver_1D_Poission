function b=assemble_vector_1D (function_source,Gauss_nodes_number,P,T,...
                              Pb_test,Tb_test,...
                              number_of_local_basis_fun_test,...
                              basis_type_test,basis_der_x_test)
n_element=size(T,2);
Nb_nodes_test=size(Pb_test,2);
b=sparse(Nb_nodes_test,1);
for n=1:n_element%����T�ĵ�N�У�T������Ǿֲ���Ԫ��ţ�P������ǽ������
    vertices=P(:,T(:,n));%ȡ��Ԫ�������,֮�󶼲����ˣ���ʱT(:,n)����������㣬P(:,T(:,n))�����˳�򹹳ɵ��У������깹�ɵ���
    [Gauss_weights_reference_1D,Gauss_nodes_reference_1D]=generate_Gauss_reference_1D(Gauss_nodes_number);
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices);

       for beta=1:number_of_local_basis_fun_test%�ֲ����Ժ�������
        
           int_value=Gauss_quad_1D_source_test(function_source,Gauss_weights,Gauss_nodes,vertices,...
                                              basis_type_test,beta,basis_der_x_test);
            b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+int_value;%��װ���ܸվ���
       end    
end
