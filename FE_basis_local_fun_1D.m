function result=FE_basis_local_fun_1D(x,vertices,basis_type,basis_index,basis_der_x)
%101:1D linear                      
%102:2D quadratic

%% %%%%%%%%%%%%%����Ԫ%%%%%%%%%%%%%%%%%%
h=vertices(1,2)-vertices(1,1);

if basis_type==101%����Ԫ
%% ��̽����   
    if basis_index==1%��Ԫ��1���ڵ��Ӧ����̽������        
        if  basis_der_x==0%ԭ����
            result=(vertices(1,2)-x)/h; 
            elseif basis_der_x==1%һ�׵�����Ԫ��1���ڵ��Ӧ����̽������
            result=-1/h;            
        end       
           
        elseif basis_index==2%��Ԫ��2���ڵ��Ӧ����̽������ 
            if  basis_der_x==0%ԭ����
            result=(x-vertices(1,1))/h; 
            elseif basis_der_x==1%��Ԫ��2���ڵ��Ӧ����̽������
            result=1/h;
            end
    end
%% %%%%%%%%%%%%%%����Ԫ%%%%%%%%%%%%%%%%%%%
elseif basis_type==102
%% ��̽����  
h=(vertices(2)-vertices(1));%���ǵ�Ԫ����      
         if basis_der_x==0%��Ԫ��i���ڵ��Ӧ�Ļ�����ԭ����         
            if  basis_index==1%��Ԫ��1���ڵ��Ӧ�Ļ�����ԭ����
                result=2*((x-vertices(1,1))/h)^(2)-3*(x-vertices(1,1))/h+1; 
                elseif basis_index==2%��Ԫ��2���ڵ��Ӧ�Ļ�����ԭ����
                result= 2*((x-vertices(1,1))/h)^(2)-(x-vertices(1,1))/h;
                elseif basis_index==3 %��Ԫ��3���ڵ��Ӧ�Ļ�����ԭ����
                result=-4*((x-vertices(1,1))/h)^(2)+4*(x-vertices(1,1))/h;   
                
            end       
            
         elseif basis_der_x==1%��Ԫ��i���ڵ��Ӧ�Ļ�����1�׵���       
            if  basis_index==1%��Ԫ��1���ڵ��Ӧ�Ļ�����1�׵���
                result=4*(x-vertices(1,1))/h/h-3/h; 
                elseif basis_index==2%��Ԫ��2���ڵ��Ӧ�Ļ�����1�׵���
                result=4*(x-vertices(1,1))/h/h-1/h;
                elseif basis_index==3%��Ԫ��3���ڵ��Ӧ�Ļ�����1�׵���
                result=-8*(x-vertices(1,1))/h/h+4*1/h;                
            end

         elseif basis_der_x==2%��Ԫ��i���ڵ��Ӧ�Ļ�����2�׵���        
            if  basis_index==1%��Ԫ��1���ڵ��Ӧ�Ļ�����2�׵���
                result=4/h/h;
                elseif basis_index==2%��Ԫ��2���ڵ��Ӧ�Ļ�����2�׵���
                result=4/h/h;
                elseif basis_index==3%��Ԫ��3���ڵ��Ӧ�Ļ�����2�׵���
                result=-8/h/h;
            end
            
        end   
end