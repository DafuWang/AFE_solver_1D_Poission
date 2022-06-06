%clear
% clc
tic
format shortE

%% �ռ����������
left=-1;right=2;%�������˵�
i=3
%% ǰ����
dx=1/2^(i-1);%�����
n_x=(right-left)/dx;%��Ԫ��
% �������꼰����Ԫ�ֲ���ź�������ӳ���ϵ
[P,T]=generate_P_T(left,right,n_x);
%��������Ԫ����ӳ��
[Pb_trial_s,Tb_trial_s]=generate_Pb_Tb0(101,left,right,n_x);
[Pb_test_s,Tb_test_s]=generate_Pb_Tb0(101,left,right,n_x);
%% ���ĳ���
%��Ԫ�նȾ�����㼰��װ
A = assemble_matrix_1D('function_c',4,P,T,Pb_trial_s,Tb_trial_s,Pb_test_s,Tb_test_s,2,2,101,1,101,1);                           
%��Ԫ���������㼰��װ
b=assemble_vector_1D('function_f',4,P,T,Pb_test_s,Tb_test_s,2,101,0);
% �߽������ͼ����
boundary_nodes=function_generate_boundary_nodes_1D(Pb_test_s);
% �߽�������ʩ��
b=treat_boundary_Neumann_s('function_Neumann_cp',b,boundary_nodes,Pb_test_s);%�ڶ���߽�����
[A,b]=treat_boundary_Dirichlet('function_g',A,b,boundary_nodes,Pb_test_s);%��һ��߽�����
% �����������
weak_solution_s=A\b;
%% ������������
error_infinite_s=computer_infinite_error_1D_s(weak_solution_s,Tb_test_s,T,P,4,101);%�����
error_L2_s=computer_error_L2_1D_s(T,P,Tb_test_s,4,weak_solution_s,101)%L2����
error_H1_s=computer_error_H1_1D_s(T,P,Tb_test_s,4,weak_solution_s,101);%H1����

