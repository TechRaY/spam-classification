x=load('../q1_data/train-small.x');
y=load('../q1_data/train-small.y');

m=size(y,1);
q=ones(m,m);
gamma=2.5*(10^-4)
for i=1:m
    for j=1:m
        q(i,j)=y(i)*y(j)*exp(-gamma*power(norm(x(i,:)-x(j,:)),2))   ;
    end
end
disp('done')
b=ones(m,1);
C=1;

cvx_begin
    variable a(m)
    maximize (-0.5*a'*q*a+b'*a)
    subject to
        0 <= a <= C
        a'*y == 0
cvx_end

f=fopen('../q1_data/id_gaussian_small.txt','w');

support_vec=zeros(cnt,1);
index=1
for i=1:m
    if a(i)>0.0001 
      fprintf(f,'%d\n',i);  
      support_vec(index)=i;
      index=index+1;
    end
end
fclose(f);

maxb=-Inf(1);
minb=Inf(1);
for i=1:m
    if y(i)==1
        if a(i)>0.0001 && a(i)< C
            tmp=0;
            for j=1:m
                tmp=tmp+a(j)*y(j)*exp(-gamma*power(norm(x(j,:)-x(i,:)),2));
            end
            minb=min(minb,tmp);
        end
    else
        if a(i)>0.0001 && a(i)<C
            tmp=0;
            for j=1:m
                tmp=tmp+a(j)*y(j)*exp(-gamma*power(norm(x(j,:)-x(i,:)),2));
            end
            maxb=max(maxb,tmp);
        end
    end
end
b=-0.5*(maxb+minb)


x1=importdata('../q1_data/test_1.x');
y1=importdata('../q1_data/test_1.y');
n=size(y1,1);


av=0
for i=1:n
    tmp=0;
    for j=1:m
        tmp=tmp+a(j)*y(j)*exp(-gamma*power(norm(x(j,:)-x1(i,:)),2));
    end
    if (tmp+b)>0 && y1(i)==1
        av=av+1;
    elseif (tmp+b)<0 && y1(i)==-1
        av=av+1;
    end
end

av/n
