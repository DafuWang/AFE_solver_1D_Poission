function result=function_exact_order_solution_1D_s(der_x,x)
% if der_x==0
% result=x.*cos(x);
% elseif der_x==1
% result=cos(x)-x.*sin(x);    
% end


if der_x==0
 result=-exp(x);   
elseif der_x==1
 result=-exp(x); 
end

