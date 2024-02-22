function[ber]=ber(x1,x2,x3,data_0,Ein) 
N=length(Ein);
I=real(Ein);
Q=imag(Ein);
data_i=zeros(2,N);
data_q=zeros(2,N);
for i=1:N
     if I(i)<x1
         I(i)=-3;
         data_i(:,i)=[0;0];
     else if I(i)<x2
         I(i)=-1;
         data_i(:,i)=[0;1];
         else if I(i)<x3
                 I(i)=1;
                 data_i(:,i)=[1;0];
             else I(i)=3;
                 data_i(:,i)=[1;1];
             end
         end
     end
          if Q(i)<x1
         Q(i)=-3;
         data_q(:,i)=[0;0];
     else if Q(i)<x2
         Q(i)=-1;
         data_q(:,i)=[0;1];
         else if Q(i)<x3
                 Q(i)=1;
                 data_q(:,i)=[1;0];
             else Q(i)=3;
                 data_q(:,i)=[1;1];
             end
         end
          end
 end
data_I=reshape(data_i,1,2*N);
data_Q=reshape(data_q,1,2*N);
data=reshape([data_I;data_Q],4*N,1);
%save('E:\Ì¨Ê½»ú\VPI\shiyan\b','data');
ber=sum(xor(data,data_0))/4/N;
