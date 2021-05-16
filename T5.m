clear;
clc;
%set train path
train_path='.\trainset\';
train_list = dir(strcat(train_path,'*.pgm'));
train_num = length(train_list);
train_mat=[];
%loop through trainset and obtain train_mat
for j=1:train_num
    train_name=train_list(j).name;
    train_img=imread(strcat(train_path,train_name));
    train_col=reshape(im2double(train_img),[],1);
    train_mat=[train_mat train_col];
end
train_label=[]
for k=1:30
    train_label=[train_label,-1];
end
for k=1:30
    train_label=[train_label,1];
end
disp(train_label);

%set test path
test_path='.\testset\';
test_list = dir(strcat(test_path,'*.pgm'));
test_num = length(test_list);
test_mat=[];
%loop through trainset and obtain train_mat
for j=1:test_num
    test_name=test_list(j).name;
    test_img=imread(strcat(test_path,test_name));
    test_col=reshape(im2double(test_img),[],1);
    test_mat=[test_mat test_col];
end
%apply the svm function
[w,beta]=svm(train_mat,train_label);
disp(size(w));disp(beta);
%predict the labels of ten pics in testset
result=w'*test_mat+beta;
predict=[];
for i=1:test_num
    if result(1,i)>=0
        predict(i)=1;
    else predict(i)=-1;
        fprintf('The %f th picture is misclassified',round(i));
    end
end
disp(predict);



    
