function int_value=Gauss_quad_1D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,...
                                            basis_type_trial,alpha,basis_der_x_trial,...
                                            basis_type_test,beta,basis_der_x_test)
                                                                                                                      
int_value=0;
for k=1:length(Gauss_nodes)

    int_value=int_value+...%ʵ���ۼ�.
              Gauss_weights(k)*...%��Ԫ�ϵĸ�˹��Ȩϵ��
              feval(coe_fun,Gauss_nodes(k))*...%����ϵ��.
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_trial,alpha,basis_der_x_trial)*...%��̽������
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,beta,basis_der_x_test);%���Ի�����            
end

