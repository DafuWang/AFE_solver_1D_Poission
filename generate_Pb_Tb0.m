function [Pb,Tb]=generate_Pb_Tb0(basis_type,left,right,n_x)
basis_type_s=basis_type;
n_element=n_x;
%% λ��
if basis_type==101
    dx=(right-left)/n_x;
    n_nodes=n_x+1;
    Nlb=2;
    for i=1:n_nodes
        Pb(1,i)=left+(i-1)*dx;
    end
    %% �����������
    for i=1:n_element%����Ԫ
        Tb(1,i)=i;
        Tb(2,i)=i+1;
    end
    
elseif basis_type==102
    dx=(right-left)/n_x/2;
    n_nodes=2*n_x+1;  
    Nlb=3;
     for i=1:n_nodes%����ڵ�
         Pb(1,i)=left+(i-1)*dx;
    end
    %% �����������
    for i=1:n_element%����Ԫ
         Tb(1,i)=2*i-1;%��Ԫ����ڵ�
         Tb(2,i)=2*i+1;%��Ԫ���ҽڵ�
         Tb(3,i)=2*i;%��Ԫ���нڵ�
    end   
    
end
