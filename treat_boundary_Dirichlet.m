function [A,b]=treat_boundary_Dirichlet(Dirichlet_boundary_function_name,A,b,boundary_nodes,Pb_test)
nbn=size(boundary_nodes,2);
for k=1:nbn
%% 处理第一类边界条件
    if boundary_nodes(1,k)==-1 %
        i=boundary_nodes(2,k);
        A(i,:)=0;
        A(i,i)=1;
        b(i,1)=feval(Dirichlet_boundary_function_name,Pb_test(1,i));
    end    
end