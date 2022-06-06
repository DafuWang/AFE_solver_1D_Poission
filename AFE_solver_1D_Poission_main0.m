%clear
% clc
tic
format shortE

%% 空间参数的输入
left=-1;right=2;%区域终了点
i=3
%% 前处理
dx=1/2^(i-1);%结点间距
n_x=(right-left)/dx;%单元数
% 网格坐标及网格单元局部编号和整体编号映射关系
[P,T]=generate_P_T(left,right,n_x);
%网格及有限元结点和映射
[Pb_trial_s,Tb_trial_s]=generate_Pb_Tb0(101,left,right,n_x);
[Pb_test_s,Tb_test_s]=generate_Pb_Tb0(101,left,right,n_x);
%% 核心程序
%单元刚度矩阵计算及组装
A = assemble_matrix_1D('function_c',4,P,T,Pb_trial_s,Tb_trial_s,Pb_test_s,Tb_test_s,2,2,101,1,101,1);                           
%单元力向量计算及组装
b=assemble_vector_1D('function_f',4,P,T,Pb_test_s,Tb_test_s,2,101,0);
% 边界结点类型及编号
boundary_nodes=function_generate_boundary_nodes_1D(Pb_test_s);
% 边界条件的施加
b=treat_boundary_Neumann_s('function_Neumann_cp',b,boundary_nodes,Pb_test_s);%第二类边界条件
[A,b]=treat_boundary_Dirichlet('function_g',A,b,boundary_nodes,Pb_test_s);%第一类边界条件
% 方程弱解求解
weak_solution_s=A\b;
%% 后处理（误差分析）
error_infinite_s=computer_infinite_error_1D_s(weak_solution_s,Tb_test_s,T,P,4,101);%无穷范数
error_L2_s=computer_error_L2_1D_s(T,P,Tb_test_s,4,weak_solution_s,101)%L2范数
error_H1_s=computer_error_H1_1D_s(T,P,Tb_test_s,4,weak_solution_s,101);%H1范数

