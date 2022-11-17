%************************对于数据鲁棒性结果，大论文图3.13示例结果，CDEn的结果
%高斯噪声数据长度，1/f噪声数据长度 
%这里先进行1/f噪声验证
clear
symm=5; %符号数
dim=4;     delay=1;
tau=50;
    
len=[200:100:2500];
for j=1:100
for i=1:length(len)
 data = flicker(len(i));
data1=data;
%data1=mapminmax(data,0,1);

% [Out_SampEn_1_7(i,j)] = SampEn(data1,dim,0.15*std(data1),delay);  %样本熵
% 
% [Out_PE_1_7(i,j)]= pe(data1,dim,delay);  %归一化的排序熵
% 
% [Out_FuEn_1_7(i,j)] = FuzEn(data1,dim,0.15*std(data1),2,1);   %传统模糊熵
% 
% [Out_DisEn_1_7(i,j), ~, ~]=DispEn_Norm(data1,dim,symm,'NCDF',1);  %归一化的离散熵
% 
% symm=5;
% [Out_fDisEn_1_1(i,j), ~]=FDispEn(data1,dim,symm,'NCDF',1);  %归一化的基于波动的离散熵
% 
% 
% bbb=BubbEn(data1','m',5)
% [Out_BubEn_1_7(i,j)] = bbb(end);   %Bub熵
% 
% [Out_AttEn_1_7(i,j)] = AttnEn(data1');   %Ateen 熵
% 
%  symm=7;  data11=(data1-mean(data1))./std(data1);
%  [sx,index,ss] = symmb_cdf_akde(data11',symm);%符号化处理
%  [Out_CRSDE_1_1(i,j)]=CRNg_DispEn(sx,dim,1);   %%%%%%%%%%%我们之前提出的方法



[disEn_C_1_7(i,j)]=CDEn(data1,tau);%
%我们的方法
end
end




%在进行高斯噪声的稳定性验证

symm=5; %符号数
dim=4;     delay=1;
tau=50;

len=[200:100:2500];
for j=1:100
for i=1:length(len)
 data = wgn(len(i),1,0)';
data1=data;
%data1=mapminmax(data,0,1);

% [Out_SampEn_1_8(i,j)] = SampEn(data1,dim,0.15*std(data1),delay);  %样本熵
% 
% [Out_PE_1_8(i,j)]= pe(data1,dim,delay);  %归一化的排序熵
% 
% [Out_FuEn_1_8(i,j)] = FuzEn(data1,dim,0.15*std(data1),2,1);   %传统模糊熵
% 
% [Out_DisEn_1_8(i,j), ~, ~]=DispEn_Norm(data1,dim,symm,'NCDF',1);  %归一化的离散熵
% 
% symm=5;
% [Out_fDisEn_1_2(i,j), ~]=FDispEn(data1,dim,symm,'NCDF',1);  %归一化的基于波动的离散熵
% 
% bbb=BubbEn(data1','m',5)
% [Out_BubEn_1_8(i,j)] = bbb(end);   %Bub熵
% 
% [Out_AttEn_1_8(i,j)] = AttnEn(data1');   %Ateen 熵
% 
%  symm=7;  data11=(data1-mean(data1))./std(data1);
%  [sx,index,ss] = symmb_cdf_akde(data11',symm);%符号化处理
%  [Out_CRSDE_1_2(i,j)]=CRNg_DispEn(sx,dim,1);   %%%%%%%%%%%我们之前提出的方法


[disEn_C_1_8(i,j)]=CDEn(data1,tau);%
%我们的方法
end
end





%%%%%%%%%%%%%%%%%%%画图




figure
a=mean(disEn_C_1_7');%mean  
b=std(disEn_C_1_7');
errorbar(a,b,'linewidth',3,'marker','diamond','markersize',6);  
set(gca,'FontSize',20)
set(gca,'xlim',[0.5,24.5],'XTick',[4:5:24],'XTicklabel',[500:500:2500]);
hold on

a=mean(disEn_C_1_8');%mean  
b=std(disEn_C_1_8');
errorbar(a,b,'linewidth',3,'marker','diamond','markersize',6);  
set(gca,'FontSize',20)
set(gca,'xlim',[0.5,24.5],'XTick',[4:5:24],'XTicklabel',[500:500:2500]);
hold on
ylabel('CDEn')
xlabel('Data length')
legend('1/f','WGN')






