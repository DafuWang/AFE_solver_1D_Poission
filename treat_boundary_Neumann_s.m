function b=treat_boundary_Neumann_s(function_cp,b,boundary_nodes,Pb_test)
NBE=size(boundary_nodes,2);%d第二类边界的条数

for k=1:NBE
    if(boundary_nodes(1,k)==-2)        
        n=boundary_nodes(2,k);
        boundary_nodes_coodinate=Pb_test(1,n);
        normal_section=boundary_nodes(3,k);
        v=normal_section*feval(function_cp,boundary_nodes_coodinate);
        b(n,1)=b(n,1)+v;
        
    end
        
end



