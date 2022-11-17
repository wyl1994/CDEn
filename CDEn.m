%test*
%%%%%%%%%%%%%%diversity entropy计算方法

function [disEn_C]=CDEn(data1,tau)

%%%%%%%%%%%%%%%%%%%disEn_C即为我们提出的CDEn results
%%%%%%%%%%%%%%diversity entropy计算方法

%tau:计算概率分布时的划分区间
 
 [y,fi]=myeig(data1);
% y(:,1)=awgn(y(:,1),50,'measured');
% y(:,2)=awgn(y(:,2),50,'measured');
% r=0.15*std(data1);


for i=1:length(y)-1

E_D(i)=pdist([y(i,:);y(i+1,:)],'cosine');%计算余弦距离

end

%相似度,余弦相似度
%Simar=1-E_D;
Simar=roundn(1-E_D,-2); %这里用截断小数点的方案
%相似度在区间【0,1】之间等分为m份，状态概率
%x=linspace(0,1,tau);%将最大最小区间分成20个等分点(19等分),然后分别计算各个区间的个数
yy=histcounts(Simar,-1:1/tau:1);%计算各个区间的个数
pdf_y=yy/length(Simar);%计算各个区间的概率

pdf_y1=pdf_y(pdf_y~=0);%去掉0元素

%计算熵，归一化
% disEn = (-sum(pdf_y1.*log(pdf_y1)))/(log(2*tau));



%计算累计分布
cdf_y(1)=pdf_y(1);
for i=2:length(pdf_y)
    cdf_y(i)=sum(pdf_y(1:i));
end
%计算归一化后的累计概率
cdf_y_c=cdf_y./sum(cdf_y);


%去掉零元素
p=cdf_y_c(cdf_y_c~=0);
%计算熵，归一化
disEn_C = (-sum(p.*log(p)))/(log(2*tau));
end







function [y,fi,x]=myeig(data1)
%输入为原始序列，然后创建维度为2，延迟为1的重构向量，最后输出新的重构矩阵

%C=xT*x;   然后对C特征分解，得到fi=[],每一列都是特征向量

for i=1:length(data1)-1
    x(i,1)=data1(i);
    x(i,2)=data1(i+1);
end

C=x'*x;

[fi,d]=eig(C);
y=x*fi;

end


