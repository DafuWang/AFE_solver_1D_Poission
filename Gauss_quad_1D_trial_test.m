function int_value=Gauss_quad_1D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,...
                                            basis_type_trial,alpha,basis_der_x_trial,...
                                            basis_type_test,beta,basis_der_x_test)
                                                                                                                      
int_value=0;
for k=1:length(Gauss_nodes)

    int_value=int_value+...%实现累加.
              Gauss_weights(k)*...%单元上的高斯加权系数
              feval(coe_fun,Gauss_nodes(k))*...%函数系数.
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_trial,alpha,basis_der_x_trial)*...%试探基函数
              FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,beta,basis_der_x_test);%测试基函数            
end

