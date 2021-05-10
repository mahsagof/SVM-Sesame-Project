%% 	Programmer=Mahsa.Ghasemi.ir
%% m1=row1 means error of rmse and row2 means error of mae
%% m2= prorety of selected features
%% mm= row1 is for one feature and (coulmns are means mae,rmse,r2) row2 is for AllFeatures


clear all;
close all;
clc;

p=1;    
e=1;
s=1;
for Q=1:7
    minim=1000 
    tic
    for i=1:10
% clc;
% clear all;
% close all;
% load('minim.mat')
% load('DataNormal.mat')
% k = randperm(135, 95);
% 
% r = true(1,135);
% r(k) = false;
% DataTest = DataNormal(r, :);
% % m = rand(135,8);
% % mnew = datasample(m,108);
% save('DataTrain.mat','DataTrain')
% save('DataTest.mat','DataTest')
    
    load('DataNormal.mat')
k = randperm(60, 42);
DataTrain = DataTrain1(k, :);
r = true(1,60);
r(k) = false;
DataTest = DataTrain1(r, :);
% m = rand(135,8);
% mnew = datasample(m,108);
save('DataTrain.mat','DataTrain')
save('DataTest.mat','DataTest')

    
    
    
    
    
    
    [Models,features]=TrainPro(Q);
    [result]=TestPro(Q,Models,features);

    if result(1,1)<minim
        minim=result(1,1);
         mo(s:s+3,:)=Models;
         fe(e,:)=features;
         re(p,:)=result(1,:);
          re(p+1,:)=result(2,:);
    end

    end
    toc
      e=e+1;
      p=p+2;
      s=s+4;
X = ['Qualitative Feature number ',num2str(Q),' Completed'];
disp(X)
pause(1.5)

end
% save('m1.xlsx','m1')
% save('m2.xlsx','m2')
% save('mm.xlsx','mm')
% uiwait(msgbox('Operation Completed and Files Saved','Success','modal'));

% for i=1:7
% figure(i)
% row=1:11;
% plot(row,m1(j,:))
% xlabel("Number of Germination Features")
% ylabel("Prediction error")
% j=j+2;
% end
% final=mean(mm);
% if final(1,1)<minim
%     save('minim.mat','minim')
%     minim=final(1,1);
%     best=final;
%     resu=mm;
%     mode=m1;
%     feat=m2;
% end
best=mean(re)