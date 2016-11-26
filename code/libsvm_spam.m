x=importdata('../../q1_data/train-small.x');
y=importdata('../../q1_data/train-small.y');
modellin=svmtrain(y,x,'-c 1 -t 0');
modelgau=svmtrain(y,x,'-c 1 -t 2 -g 0.00025');

x=importdata('../../q1_data/test_1.x');
y=importdata('../../q1_data/test_1.y');

[out,acc,prob]=svmpredict(y,x,modellin);
acc
[out1,acc1,prob1]=svmpredict(y,x,modelgau);
acc1


