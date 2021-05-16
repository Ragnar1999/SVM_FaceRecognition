%T1 svm function
function [w,beta] = svm(trainingpoints, traininglabels)
%trainingpoints: d*m
%traininglabels: m-dimensional row-vector labels
    numOfAttributes=size(trainingpoints,1);
    numOfExamples=size(trainingpoints,2);
    X=trainingpoints';
    Y=traininglabels';
    H=eye(numOfAttributes+1);
    H(numOfAttributes+1,numOfAttributes+1)=0;
    f=zeros(numOfAttributes+1,1);

    Z = [X ones(numOfExamples,1)];
    A=-diag(Y)*Z;    
    c=-1*ones(numOfExamples,1);
    
    W=quadprog(H,f,A,c);
    disp(W);
    w=W(1:numOfAttributes);
    beta=W(numOfAttributes+1);
   
end






