% T2 apply svm to the data
clc;
clear;
X=[-1,-0.8,0.5,-2,2,0,1,4,5,4,5.5;2,0.7,-1,0,0,3,4,6,3,4.5,4.0];
Y=[-1,-1,-1,-1,-1,-1,1,1,1,1,1];

% T2 visualization of the results
XX=X;
XX=[XX;XX(1,:).^2+XX(2,:).^2]
YY=Y;



[w,beta]=svm(XX,YY);
disp(w)
disp(beta)
%% 

% Now we generate 250 points and classify them using the results above
x1=-2+(6-(-2))*rand(1,250);
x2=-2+(6-(-2))*rand(1,250);
Xsquare=x1(1,:).^2+x2(1,:).^2;

Xcombined=[x1;x2;Xsquare];
result=w'*Xcombined+beta;
predict=[];
for i=1:250
    if result(1,i)>=0
        predict(i)=1;
    else predict(i)=-1;
    end
end
disp(predict)
%% 

% A two-dimension plot of the 11 points prediction
Yresult=w'*XX+beta;
Ypredict=[]
for i=1:size(Y,2)
    if Yresult(1,i)>=0
        Ypredict(i)=1;
    else Ypredict(i)=-1;
    end
end


XXnew=X'
YYnew=Ypredict'
ClassA = XXnew(find(YYnew==-1),:)
ClassB = XXnew(find(YYnew==1),:) 
hold on
% Plot the data with label -1
plot(ClassA(:,1),ClassA(:,2),'or')
% Plot the data with label -2
plot(ClassB(:,1),ClassB(:,2),'+b') 
% Plot the hyperplane
hold on
Xs=[-2:6]
w1=w(1);
w2=w(2);
w3=w(3);
b=beta; 
Ys=(-w2+sqrt(w2^2-4*w3*(w3*Xs.^2+w1*Xs+b)))/(2*w3);
plot(Xs,Ys,'k-');
axis equal;







