%test*
%%%%%%%%%%%%%%diversity entropy���㷽��

function [disEn_C]=CDEn(data1,tau)

%%%%%%%%%%%%%%%%%%%disEn_C��Ϊ���������CDEn results
%%%%%%%%%%%%%%diversity entropy���㷽��

%tau:������ʷֲ�ʱ�Ļ�������
 
 [y,fi]=myeig(data1);
% y(:,1)=awgn(y(:,1),50,'measured');
% y(:,2)=awgn(y(:,2),50,'measured');
% r=0.15*std(data1);


for i=1:length(y)-1

E_D(i)=pdist([y(i,:);y(i+1,:)],'cosine');%�������Ҿ���

end

%���ƶ�,�������ƶ�
%Simar=1-E_D;
Simar=roundn(1-E_D,-2); %�����ýض�С����ķ���
%���ƶ������䡾0,1��֮��ȷ�Ϊm�ݣ�״̬����
%x=linspace(0,1,tau);%�������С����ֳ�20���ȷֵ�(19�ȷ�),Ȼ��ֱ�����������ĸ���
yy=histcounts(Simar,-1:1/tau:1);%�����������ĸ���
pdf_y=yy/length(Simar);%�����������ĸ���

pdf_y1=pdf_y(pdf_y~=0);%ȥ��0Ԫ��

%�����أ���һ��
% disEn = (-sum(pdf_y1.*log(pdf_y1)))/(log(2*tau));



%�����ۼƷֲ�
cdf_y(1)=pdf_y(1);
for i=2:length(pdf_y)
    cdf_y(i)=sum(pdf_y(1:i));
end
%�����һ������ۼƸ���
cdf_y_c=cdf_y./sum(cdf_y);


%ȥ����Ԫ��
p=cdf_y_c(cdf_y_c~=0);
%�����أ���һ��
disEn_C = (-sum(p.*log(p)))/(log(2*tau));
end







function [y,fi,x]=myeig(data1)
%����Ϊԭʼ���У�Ȼ�󴴽�ά��Ϊ2���ӳ�Ϊ1���ع��������������µ��ع�����

%C=xT*x;   Ȼ���C�����ֽ⣬�õ�fi=[],ÿһ�ж�����������

for i=1:length(data1)-1
    x(i,1)=data1(i);
    x(i,2)=data1(i+1);
end

C=x'*x;

[fi,d]=eig(C);
y=x*fi;

end


