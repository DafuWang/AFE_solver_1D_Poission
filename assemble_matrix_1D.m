function [A] = assemble_matrix_1D(coe_fun,Gauss_nodes_number,P,T,...
                                  Pb_trial,Tb_trial,Pb_test,Tb_test,...
                                  number_of_local_basis_fun_trial,number_of_local_basis_fun_test,...
                                  basis_type_trial,basis_der_x_trial,...
                                  basis_type_test,basis_der_x_test)
n_element=size(T,2);
Nb_nodes_trial=size(Pb_trial,2);
Nb_nodes_test=size(Pb_test,2);
A=sparse(Nb_nodes_trial,Nb_nodes_test);%sparse(N_nodes,N_node) %����Ԫ�ڵ���
for n=1:n_element%����T�ĵ�N�У�T������Ǿֲ���Ԫ��ţ�P������ǽ������
    vertices=P(:,T(:,n));%ȡ��Ԫ�������,֮�󶼲����ˣ���ʱT(:,n)����������㣬P(:,T(:,n))�����˳�򹹳ɵ��У������깹�ɵ���
    [Gauss_weights_reference_1D,Gauss_nodes_reference_1D]=generate_Gauss_reference_1D(Gauss_nodes_number);
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(Gauss_weights_reference_1D,Gauss_nodes_reference_1D,vertices);

   for alpha=1:number_of_local_basis_fun_trial%�ֲ���̽��������
       for beta=1:number_of_local_basis_fun_test%�ֲ����Ժ�������
           int_value=Gauss_quad_1D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,...
                                              basis_type_trial,alpha,basis_der_x_trial,...
                                              basis_type_test,beta,basis_der_x_test);%��Ԫ�նȾ���ļ���
             A(Tb_test(beta,n),Tb_trial(alpha,n))=A(Tb_test(beta,n),Tb_trial(alpha,n))+int_value;%��װ���ܸվ���
           
       end
   end
    
    
end