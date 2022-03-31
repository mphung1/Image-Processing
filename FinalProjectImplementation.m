%% Example of image 16x16 airplane pixelated to use in presentation 
for s=1 
 g=[]; 
for k=5 %pick frame inside cover 
 if k<10 
 T={'airplane0'}; 
 else 
 T={'airplane'}; 
 end 
 a=imread([T{s},int2str(k),'.tif']); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:); 
 rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 g=[g;modeRow]; 
 end 
end 
end 
 zz=reshape(g,16,16,3); 
 figure 
 f1=image(zz); 
 axis('square'); 
 set(gcf,'Position',[134 337 560 420]); 
 subplot(121) 
 imshow(a) 
 subplot(122) 
 imshow(double(zz)./255) 
end 
%% River training to get averages of rgb for 16x16 common color image 
%Go to directory and get all river images 
direction='./river/'; 
riverdir=dir([direction '*.tif']); 
% m variable specifies which images to choose from and runs them  through 
% the loop 
for m=1:30 
 g=[]; 
 t=strcat(direction,riverdir(m).name); 
 a=imread(t); 
 img=a; 
% loop to get 16x16 image and choose most common color 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 g=[g;modeRow]; 
 end 
end 
 %fprintf("%d\n", sum(g(:))) 
end  
fprintf("average rgb river images: %d\n", averageriver); average rgb river images: 92397 
%% Airplane training to get averages of rgb for 16x16 common color image 

direction='./airplane/'; 
airplanedir=dir([direction '*.tif']); 
for m=78:99 
 b=[]; 
 t=strcat(direction,airplanedir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 b=[b;modeRow]; 
 end 
end 
%fprintf("%d\n", sum(b(:))) 
end 
fprintf("average rgb airplane images: %d\n", averageairplane); average rgb airplane images: 105844 
%% Baseball Diamond training to get averages of rgb for 16x16 common color image 
direction='./baseballdiamond/'; 
bballdir=dir([direction '*.tif']); 
for m=1:15 
 c=[]; 
 t=strcat(direction,bballdir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 c=[c;modeRow]; 
 end 
end 
%fprintf("%d\n", sum(c(:))) 
end 
averagebaseball=72889; 
fprintf("average rgb baseball diamond images: %d\n", averagebaseball); average rgb baseball diamond images: 72889 
%% Beach training to get averages of rgb for 16x16 common color image 
direction='./beach/'; 
beachdir=dir([direction '*.tif']); 
for m=59:99 
 d=[]; 
 t=strcat(direction,beachdir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 d=[d;modeRow]; 
 end 
end 
%fprintf("%d\n", sum(d(:))) 
end 
 averagebeach=130932; 
 fprintf("average rgb beach images: %d\n", averagebeach); 
average rgb beach images: 130932 
%% Harbor training to get averages of rgb for 16x16 common color image 
direction='./harbor/'; 
harbordir=dir([direction '*.tif']); 
for m=1:43 
 e=[]; 
 t=strcat(direction,harbordir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 e=[e;modeRow]; 
 end 
end 
% fprintf("%d\n", sum(e(:))) 
end 
fprintf("average rgb harbor images: %d\n", averageharbor); average rgb harbor images: 77408 
%% Run beach images 1-51 and test to see what they identify as when compared to the aver ages found previously 
% Set the counts to zero to get average later 
rivercount=0; 
airplanecount=0; 
bballcount=0; 
beachcount=0; 
harborcount=0; 
% Go to beach directory and get all the images 
direction='./beach/'; 
beachdir=dir([direction '*.tif']); 
% For loop to go through images 
for m=1:51 
 f=[]; 
 t=strcat(direction,beachdir(m).name); 
 a=imread(t); 
 img=a; 
% For loop to get 16x16 and most common color 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 f=[f;modeRow]; 
 end 
end 
%Differences calculated 
%fprintf("rgb sum unknown = %d\n", sum(f(:))); 
riverfinalcount=abs(averageriver-sum(f(:))); 
airplanefinalcount=abs(averageairplane-sum(f(:))); 
baseballfinalcount=abs(averagebaseball-sum(f(:))); 
beachfinalcount=abs(averagebeach-sum(f(:))); 
harborfinalcount=abs(averageharbor-sum(f(:))); 
% Whichever difference is the smallest between the average and unknown % image a count will be added to index 
[xmin,ind]=min([riverfinalcount, 
 airplanefinalcount,baseballfinalcount,beachfinalcount,harborfinalcount]); if ind==1 
 fprintf('Unknown image is a river\n') 
 rivercount=rivercount+1; 
elseif ind==2 
 fprintf('Unknown image is an airplane\n') 
 airplanecount=airplanecount+1; 
elseif ind==3 
 fprintf('Unknown image is a baseball diamond\n') 
 bballcount=bballcount+1; 
elseif ind==4 
 fprintf('Unknown image is a beach\n') 
 beachcount=beachcount+1; 
elseif ind==5 
 fprintf('Unknown image is a harbor\n') 
 harborcount=harborcount+1; 
end 
end 
% Percentage to see how accurate the beach images predicted were beachpercentage=(beachcount)/(beachcount+rivercount+airplanecount +bballcount+harborcount); 
fprintf("Average of correctness for a beach image being correctly  identified %f\n",beachpercentage); 
%% Run river images 33-83(50samples) and see what they identify as when compared to the av erages found previously 
rivercount=0; 
airplanecount=0; 
bballcount=0; 
beachcount=0; 
harborcount=0; 
direction='./river/'; 
riverdir=dir([direction '*.tif']); 
for m=33:83 
 f=[]; 
 t=strcat(direction,riverdir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 f=[f;modeRow]; 
 end 
end 
%fprintf("rgb sum unknown = %d\n", sum(f(:))); 
riverfinalcount=abs(averageriver-sum(f(:))); 
airplanefinalcount=abs(averageairplane-sum(f(:))); 
baseballfinalcount=abs(averagebaseball-sum(f(:))); 
beachfinalcount=abs(averagebeach-sum(f(:))); 
harborfinalcount=abs(averageharbor-sum(f(:))); 
% Whichever difference is the smallest between the average and unknown % image a count will be added to index 
[xmin,ind]=min([riverfinalcount, 
 airplanefinalcount,baseballfinalcount,beachfinalcount,harborfinalcount]); if ind==1 
 fprintf('Unknown image is a river\n') 
 rivercount=rivercount+1; 
elseif ind==2 
 fprintf('Unknown image is an airplane\n') 
 airplanecount=airplanecount+1; 
elseif ind==3 
 fprintf('Unknown image is a baseball diamond\n') 
 bballcount=bballcount+1; 
elseif ind==4 
 fprintf('Unknown image is a beach\n') 
 beachcount=beachcount+1; 
elseif ind==5 
 fprintf('Unknown image is a harbor\n') 
 harborcount=harborcount+1; 
end 

end 
riverpercentage=(rivercount)/(rivercount+beachcount+airplanecount +bballcount+harborcount); 
fprintf("Average of correctness for a river image being correctly  identified %f\n",riverpercentage); 
%% Run airplane images 1-51 and see what they identify as when compared to the averages found previously 
rivercount=0; 
airplanecount=0; 
bballcount=0; 
beachcount=0; 
harborcount=0; 
direction='./airplane/'; 
airplanedir=dir([direction '*.tif']); 
for m=1:51 
 f=[]; 
 t=strcat(direction,airplanedir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 f=[f;modeRow]; 
 end 
end 
fprintf("rgb sum unknown = %d\n", sum(f(:))); 
riverfinalcount=abs(averageriver-sum(f(:))); 
airplanefinalcount=abs(averageairplane-sum(f(:))); 
baseballfinalcount=abs(averagebaseball-sum(f(:))); 
beachfinalcount=abs(averagebeach-sum(f(:))); 
harborfinalcount=abs(averageharbor-sum(f(:))); 
% Whichever difference is the smallest between the average and unknown % image a count will be added to index 
[xmin,ind]=min([riverfinalcount, 
 airplanefinalcount,baseballfinalcount,beachfinalcount,harborfinalcount]); if ind==1 
 fprintf('Unknown image is a river\n') 
 rivercount=rivercount+1; 
elseif ind==2 
 fprintf('Unknown image is an airplane\n') 
 airplanecount=airplanecount+1; 
elseif ind==3 
 fprintf('Unknown image is a baseball diamond\n') 
 bballcount=bballcount+1; 
elseif ind==4 
 fprintf('Unknown image is a beach\n') 
 beachcount=beachcount+1; 
elseif ind==5 
 fprintf('Unknown image is a harbor\n') 
 harborcount=harborcount+1; 
end 
end 
airplanepercentage=(airplanecount)/(airplanecount+beachcount +rivercount+bballcount+harborcount); 
fprintf("Average of correctness for a airplane image being correctly  identified %f\n",airplanepercentage); 
%% Run baseball images 47-93 and see what they identify as when compared to the averages found previously 
rivercount=0; 
airplanecount=0; 
bballcount=0; 
beachcount=0; 
harborcount=0; 
direction='./baseballdiamond/'; 
harbordir=dir([direction '*.tif']); 
for m=47:93 
 f=[]; 
 t=strcat(direction,harbordir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 f=[f;modeRow]; 
 end 
end 
fprintf("rgb sum unknown = %d\n", sum(f(:))); 
riverfinalcount=abs(averageriver-sum(f(:))); 
airplanefinalcount=abs(averageairplane-sum(f(:))); 
baseballfinalcount=abs(averagebaseball-sum(f(:))); 
beachfinalcount=abs(averagebeach-sum(f(:))); 
harborfinalcount=abs(averageharbor-sum(f(:))); 
% Whichever difference is the smallest between the average and unknown % image a count will be added to index 
[xmin,ind]=min([riverfinalcount, 
 airplanefinalcount,baseballfinalcount,beachfinalcount,harborfinalcount]); if ind==1 
 fprintf('Unknown image is a river\n') 
 rivercount=rivercount+1; 
elseif ind==2 
 fprintf('Unknown image is an airplane\n') 
 airplanecount=airplanecount+1; 
elseif ind==3 
 fprintf('Unknown image is a baseball diamond\n') 
 bballcount=bballcount+1; 
elseif ind==4 
 fprintf('Unknown image is a beach\n') 
 beachcount=beachcount+1; 
elseif ind==5 
 fprintf('Unknown image is a harbor\n') 
 harborcount=harborcount+1; 
end 
end 
bballpercentage=(bballcount)/(beachcount+rivercount+bballcount +harborcount+airplanecount); 
fprintf("Average of correctness for a baseball diamond image being  correctly identified %f percent\n",bballpercentage); 

%% Run river images 51-99 and see what they identify as when compared to the averages found previously 
rivercount=0; 
airplanecount=0; 
bballcount=0; 
beachcount=0; 
harborcount=0; 
direction='./harbor/'; 
harbordir=dir([direction '*.tif']); 
for m=51:99 
 f=[]; 
 t=strcat(direction,harbordir(m).name); 
 a=imread(t); 
 img=a; 
for j=1:16 
 for i=1:16 
 A=img((i-1)*16+1:(i-1)*16+16,(j-1)*16+1:(j-1)*16+16,:);  rimg=reshape(A,[],3); 
 [uA,~,uIdx]=unique(rimg,'rows','stable'); 
 modeIdx=mode(uIdx); 
 modeRow=uA(modeIdx,:); 
 whereIdx=find(uIdx==modeIdx); 
 f=[f;modeRow]; 
 end 
end 
fprintf("rgb sum unknown = %d\n", sum(f(:))); 
riverfinalcount=abs(averageriver-sum(f(:))); 
airplanefinalcount=abs(averageairplane-sum(f(:))); 
baseballfinalcount=abs(averagebaseball-sum(f(:))); 
beachfinalcount=abs(averagebeach-sum(f(:))); 
harborfinalcount=abs(averageharbor-sum(f(:))); 
% Whichever difference is the smallest between the average and unknown % image a count will be added to index 
[xmin,ind]=min([riverfinalcount, 
 airplanefinalcount,baseballfinalcount,beachfinalcount,harborfinalcount]); if ind==1 
 fprintf('Unknown image is a river\n') 
 rivercount=rivercount+1; 
elseif ind==2 
 fprintf('Unknown image is an airplane\n') 
 airplanecount=airplanecount+1; 
elseif ind==3 
 fprintf('Unknown image is a baseball diamond\n') 
 bballcount=bballcount+1; 
elseif ind==4 
 fprintf('Unknown image is a beach\n') 
 beachcount=beachcount+1; 
elseif ind==5 
 fprintf('Unknown image is a harbor\n') 
 harborcount=harborcount+1; 
end 
end 
harborpercentage=(harborcount)/(beachcount+rivercount+bballcount +harborcount+airplanecount); 
fprintf("Percentage of a harbor image being correctly identified %f  \n",harborpercentage); 


