function [P,T]=generate_P_T(left,right,n_element)

%% 位置
dx=(right-left)/n_element;
n_nodes=n_element+1;
for i=1:n_nodes
    P(1,i)=left+(i-1)*dx;
end
%% 关联放射矩阵
for i=1:n_element%网格单元
    T(1,i)=i;
    T(2,i)=i+1;
end   
