function result=FE_basis_local_fun_1D(x,vertices,basis_type,basis_index,basis_der_x)
%101:1D linear                      
%102:2D quadratic

%% %%%%%%%%%%%%%线性元%%%%%%%%%%%%%%%%%%
h=vertices(1,2)-vertices(1,1);

if basis_type==101%线性元
%% 试探函数   
    if basis_index==1%单元第1个节点对应的试探基函数        
        if  basis_der_x==0%原函数
            result=(vertices(1,2)-x)/h; 
            elseif basis_der_x==1%一阶导数单元第1个节点对应的试探基函数
            result=-1/h;            
        end       
           
        elseif basis_index==2%单元第2个节点对应的试探基函数 
            if  basis_der_x==0%原函数
            result=(x-vertices(1,1))/h; 
            elseif basis_der_x==1%单元第2个节点对应的试探基函数
            result=1/h;
            end
    end
%% %%%%%%%%%%%%%%二次元%%%%%%%%%%%%%%%%%%%
elseif basis_type==102
%% 试探函数  
h=(vertices(2)-vertices(1));%这是单元长度      
         if basis_der_x==0%单元第i个节点对应的基函数原函数         
            if  basis_index==1%单元第1个节点对应的基函数原函数
                result=2*((x-vertices(1,1))/h)^(2)-3*(x-vertices(1,1))/h+1; 
                elseif basis_index==2%单元第2个节点对应的基函数原函数
                result= 2*((x-vertices(1,1))/h)^(2)-(x-vertices(1,1))/h;
                elseif basis_index==3 %单元第3个节点对应的基函数原函数
                result=-4*((x-vertices(1,1))/h)^(2)+4*(x-vertices(1,1))/h;   
                
            end       
            
         elseif basis_der_x==1%单元第i个节点对应的基函数1阶导数       
            if  basis_index==1%单元第1个节点对应的基函数1阶导数
                result=4*(x-vertices(1,1))/h/h-3/h; 
                elseif basis_index==2%单元第2个节点对应的基函数1阶导数
                result=4*(x-vertices(1,1))/h/h-1/h;
                elseif basis_index==3%单元第3个节点对应的基函数1阶导数
                result=-8*(x-vertices(1,1))/h/h+4*1/h;                
            end

         elseif basis_der_x==2%单元第i个节点对应的基函数2阶导数        
            if  basis_index==1%单元第1个节点对应的基函数2阶导数
                result=4/h/h;
                elseif basis_index==2%单元第2个节点对应的基函数2阶导数
                result=4/h/h;
                elseif basis_index==3%单元第3个节点对应的基函数2阶导数
                result=-8/h/h;
            end
            
        end   
end