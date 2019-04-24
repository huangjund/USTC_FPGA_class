width=8;  %宽度是
depth=1024;  %深度是1024
index = linspace(0,2*pi,depth);                      
 
sin_value = sin(index);                                  
 
sin_value = sin_value * (2^(width-1) -1 )+2^(width-1);            
 
sin_value = fix(sin_value);
 
sin_value =abs(sin_value);
%===============================开始写mif文件===============================
addr=0:depth-1;
str_width=strcat('WIDTH=',num2str(width));
str_depth=strcat('DEPTH=',num2str(depth));
 
fid=fopen('data.mif','w');  %打开或者新建mif，存放位置和文件名任意
                              %如果只写文件名，则在当前目录下建立此文件
fprintf(fid,str_width);
fprintf(fid,';\n');
fprintf(fid,str_depth);
fprintf(fid,';\n\n');
fprintf(fid,'ADDRESS_RADIX=HEX;\n');  %因为下面的数据输入我选的是16进制，
 
fprintf(fid,'DATA_RADIX=HEX;\n\n');
fprintf(fid,'CONTENT BEGIN\n');
fprintf(fid,'\t%X : %X;\n',[addr;sin_value])  %开始写数据了
fprintf(fid,'END;\n');
fclose(fid);