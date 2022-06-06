function boundary_nodes=function_generate_boundary_nodes_1D(Pb)
Nb_nodes=size(Pb,2);
%boundary_nodes(1,k): specifiy the type of the kth boundary node.
%boundary_nodes(1,k)=-1: Dirichlet boundary node;
%boundary_nodes(1,k)=-2: Neumann boundary node;
%boundary_nodes(1,k)=-3: Robin boundary node. 
%boundary_nodes(2,k): global index of the kth boundary node among all nodes of FE. 
%                     That is, the index of FE is used here.
%boundary_nodes(3,k): The normal direction of the kth boundary node.
boundary_nodes(1,1)=-1;%边界条件类型，此时为第一类边界条件
boundary_nodes(2,1)=1;%边界结点整体编号
boundary_nodes(3,1)=-1;%方向

boundary_nodes(1,2)=-2;
boundary_nodes(2,2)=Nb_nodes;
boundary_nodes(3,2)=1;