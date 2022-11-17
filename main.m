%************************��������³���Խ����������ͼ3.13ʾ�������CDEn�Ľ��
%��˹�������ݳ��ȣ�1/f�������ݳ��� 
%�����Ƚ���1/f������֤
clear
symm=5; %������
dim=4;     delay=1;
tau=50;
    
len=[200:100:2500];
for j=1:100
for i=1:length(len)
 data = flicker(len(i));
data1=data;
%data1=mapminmax(data,0,1);

% [Out_SampEn_1_7(i,j)] = SampEn(data1,dim,0.15*std(data1),delay);  %������
% 
% [Out_PE_1_7(i,j)]= pe(data1,dim,delay);  %��һ����������
% 
% [Out_FuEn_1_7(i,j)] = FuzEn(data1,dim,0.15*std(data1),2,1);   %��ͳģ����
% 
% [Out_DisEn_1_7(i,j), ~, ~]=DispEn_Norm(data1,dim,symm,'NCDF',1);  %��һ������ɢ��
% 
% symm=5;
% [Out_fDisEn_1_1(i,j), ~]=FDispEn(data1,dim,symm,'NCDF',1);  %��һ���Ļ��ڲ�������ɢ��
% 
% 
% bbb=BubbEn(data1','m',5)
% [Out_BubEn_1_7(i,j)] = bbb(end);   %Bub��
% 
% [Out_AttEn_1_7(i,j)] = AttnEn(data1');   %Ateen ��
% 
%  symm=7;  data11=(data1-mean(data1))./std(data1);
%  [sx,index,ss] = symmb_cdf_akde(data11',symm);%���Ż�����
%  [Out_CRSDE_1_1(i,j)]=CRNg_DispEn(sx,dim,1);   %%%%%%%%%%%����֮ǰ����ķ���



[disEn_C_1_7(i,j)]=CDEn(data1,tau);%
%���ǵķ���
end
end




%�ڽ��и�˹�������ȶ�����֤

symm=5; %������
dim=4;     delay=1;
tau=50;

len=[200:100:2500];
for j=1:100
for i=1:length(len)
 data = wgn(len(i),1,0)';
data1=data;
%data1=mapminmax(data,0,1);

% [Out_SampEn_1_8(i,j)] = SampEn(data1,dim,0.15*std(data1),delay);  %������
% 
% [Out_PE_1_8(i,j)]= pe(data1,dim,delay);  %��һ����������
% 
% [Out_FuEn_1_8(i,j)] = FuzEn(data1,dim,0.15*std(data1),2,1);   %��ͳģ����
% 
% [Out_DisEn_1_8(i,j), ~, ~]=DispEn_Norm(data1,dim,symm,'NCDF',1);  %��һ������ɢ��
% 
% symm=5;
% [Out_fDisEn_1_2(i,j), ~]=FDispEn(data1,dim,symm,'NCDF',1);  %��һ���Ļ��ڲ�������ɢ��
% 
% bbb=BubbEn(data1','m',5)
% [Out_BubEn_1_8(i,j)] = bbb(end);   %Bub��
% 
% [Out_AttEn_1_8(i,j)] = AttnEn(data1');   %Ateen ��
% 
%  symm=7;  data11=(data1-mean(data1))./std(data1);
%  [sx,index,ss] = symmb_cdf_akde(data11',symm);%���Ż�����
%  [Out_CRSDE_1_2(i,j)]=CRNg_DispEn(sx,dim,1);   %%%%%%%%%%%����֮ǰ����ķ���


[disEn_C_1_8(i,j)]=CDEn(data1,tau);%
%���ǵķ���
end
end





%%%%%%%%%%%%%%%%%%%��ͼ




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






