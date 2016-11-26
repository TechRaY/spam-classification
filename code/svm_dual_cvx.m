x=load('../spam_data/train-small.x');
% x --->  Each row of x is an example which denotes the frequency of words
y=load('../spam_data/train-small.y');
% y --->  -1 for spam and 1 for ham
m=size(y,1);
m

disp('q start')
q=(y*y').*(x*x');

disp('q init')
b=ones(m,1);
C=1;

cvx_begin
    variable a(m)
    maximize (-0.5*a'*q*a+b'*a)
    subject to
        0 <= a <= C
        a'*y == 0
cvx_end

f = fopen('../spam_data/id_linear-small.txt','w');
cnt=0;
w=zeros(1,size(x,2));
for i=1:m
    w=w+a(i)*y(i)*x(i,:);
    if a(i)>0.0001
      fprintf(f,'%d\n',i); 
      cnt=cnt+1;
    end
end
fclose(f);
maxb=-Inf(1);
minb=Inf(1);
for i=1:m
    if y(i)==1
        if a(i)>0.0001 && a(i)< C
            minb=min(minb,w*x(i,:)');
        end
    else
        if a(i)>0.0001 && a(i)<C
            maxb=max(maxb,w*x(i,:)');
        end
    end
end
maxb;
minb;
b=-0.5*(maxb+minb)


x=importdata('../spam_data/test_1.x');
y=importdata('../spam_data/test_1.y');

y1=(x*w'+b>0);
m=size(y,1);
av=0;

for i=1:m
    if y1(i)==1 && y(i)==1
        av=av+1;
    elseif y(i)==-1 && y1(i)==0
        av=av+1;
    end        
end

av/m
exit
