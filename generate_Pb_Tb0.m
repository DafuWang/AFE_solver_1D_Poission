function [Pb,Tb]=generate_Pb_Tb0(basis_type,left,right,n_x)
basis_type_s=basis_type;
n_element=n_x;
%% 位置
if basis_type==101
    dx=(right-left)/n_x;
    n_nodes=n_x+1;
    Nlb=2;
    for i=1:n_nodes
        Pb(1,i)=left+(i-1)*dx;
    end
    %% 关联放射矩阵
    for i=1:n_element%网格单元
        Tb(1,i)=i;
        Tb(2,i)=i+1;
    end
    
elseif basis_type==102
    dx=(right-left)/n_x/2;
    n_nodes=2*n_x+1;  
    Nlb=3;
     for i=1:n_nodes%网格节点
         Pb(1,i)=left+(i-1)*dx;
    end
    %% 关联放射矩阵
    for i=1:n_element%网格单元
         Tb(1,i)=2*i-1;%单元第左节点
         Tb(2,i)=2*i+1;%单元第右节点
         Tb(3,i)=2*i;%单元第中节点
    end   
    
end
