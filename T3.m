% T2 apply svm to the data
clc;
clear;
X=[0,0,1,2,2,3;0,1,0,2,3,2];

Y=[-1,-1,-1,1,1,1];
[w,beta]=svm(X,Y);
disp(w);
disp(beta);

% T2 visualization of the results
XX=X';
YY=Y';
ClassA = XX(find(YY==-1),:);
ClassB = XX(find(YY==1),:) ;
hold on
% Plot the data with label -1
plot(ClassA(:,1),ClassA(:,2),'or');
% Plot the data with label -2
plot(ClassB(:,1),ClassB(:,2),'+b') ;

% Plot the hyperplane
hold on
X1=[-1:4];
w1=w(1);
w2=w(2);
b=beta; 
Y1=-(w1*X1+b)/w2;
plot(X1,Y1,'k-');
% Plot the SVM margins
Yup=(1-w1*X1-b)/w2; %Margin
plot(X1,Yup,'m:');
Ylow=(-1-w1*X1-b)/w2; %Margin
plot(X1,Ylow,'m:');

axis equal;








