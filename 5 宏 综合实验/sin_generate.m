width=8;  %�����
depth=1024;  %�����1024
index = linspace(0,2*pi,depth);                      
 
sin_value = sin(index);                                  
 
sin_value = sin_value * (2^(width-1) -1 )+2^(width-1);            
 
sin_value = fix(sin_value);
 
sin_value =abs(sin_value);
%===============================��ʼдmif�ļ�===============================
addr=0:depth-1;
str_width=strcat('WIDTH=',num2str(width));
str_depth=strcat('DEPTH=',num2str(depth));
 
fid=fopen('data.mif','w');  %�򿪻����½�mif�����λ�ú��ļ�������
                              %���ֻд�ļ��������ڵ�ǰĿ¼�½������ļ�
fprintf(fid,str_width);
fprintf(fid,';\n');
fprintf(fid,str_depth);
fprintf(fid,';\n\n');
fprintf(fid,'ADDRESS_RADIX=HEX;\n');  %��Ϊ���������������ѡ����16���ƣ�
 
fprintf(fid,'DATA_RADIX=HEX;\n\n');
fprintf(fid,'CONTENT BEGIN\n');
fprintf(fid,'\t%X : %X;\n',[addr;sin_value])  %��ʼд������
fprintf(fid,'END;\n');
fclose(fid);