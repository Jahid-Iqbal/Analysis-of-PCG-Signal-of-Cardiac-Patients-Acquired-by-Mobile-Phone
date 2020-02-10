    url = 'https://audiorecorder-aa513.firebaseio.com/.json';

    data_f = webread(url);
    
    %Stored needed 
    collected_data = cell(30,1);
    filtered_data = cell(30,1);
    j=1;

for i=110:127
    
    

    last_entry_id = i; %data_f.Channel1.last_entry_id
    %index of cell increases one
    index = last_entry_id+1;

    field_value = data_f.feeds{index,1}.field;
    
    %Getting Field values 0f 30 Strings
    f1 = field_value(1);
    f2 = field_value(2);
    f3 = field_value(3);
    f4 = field_value(4);
    f5 = field_value(5);
    f6 = field_value(6);
    f7 = field_value(7);
    f8 = field_value(8);
    f9 = field_value(9);
    f10 = field_value(10);
    f11 = field_value(11);
    f12 = field_value(12);
    f13 = field_value(13);
    f14 = field_value(14);
    f15 = field_value(15);
    f16 = field_value(16);
    f17 = field_value(17);
    f18 = field_value(18);
    f19 = field_value(19);
    f20 = field_value(20);
    f21 = field_value(21);
    f22 = field_value(22);
    f23 = field_value(23);
    f24 = field_value(24);
    f25 = field_value(25);
    f26 = field_value(26);
    f27 = field_value(27);
    f28 = field_value(28);
    f29 = field_value(29);
    f30 = field_value(30);
    
    %String to Matrix
    Mat1 = cell2mat(cellfun(@str2num,f1,'uniform',0));
    Mat2 = cell2mat(cellfun(@str2num,f2,'uniform',0));
    Mat3 = cell2mat(cellfun(@str2num,f3,'uniform',0));
    Mat4 = cell2mat(cellfun(@str2num,f4,'uniform',0));
    Mat5 = cell2mat(cellfun(@str2num,f5,'uniform',0));
    Mat6 = cell2mat(cellfun(@str2num,f6,'uniform',0));
    Mat7 = cell2mat(cellfun(@str2num,f7,'uniform',0));
    Mat8 = cell2mat(cellfun(@str2num,f8,'uniform',0));
    Mat9 = cell2mat(cellfun(@str2num,f9,'uniform',0));
    Mat10 = cell2mat(cellfun(@str2num,f10,'uniform',0));
    Mat11 = cell2mat(cellfun(@str2num,f11,'uniform',0));
    Mat12 = cell2mat(cellfun(@str2num,f12,'uniform',0));
    Mat13 = cell2mat(cellfun(@str2num,f13,'uniform',0));
    Mat14 = cell2mat(cellfun(@str2num,f14,'uniform',0));
    Mat15 = cell2mat(cellfun(@str2num,f15,'uniform',0));
    Mat16 = cell2mat(cellfun(@str2num,f16,'uniform',0));
    Mat17 = cell2mat(cellfun(@str2num,f17,'uniform',0));
    Mat18 = cell2mat(cellfun(@str2num,f18,'uniform',0));
    Mat19 = cell2mat(cellfun(@str2num,f19,'uniform',0));
    Mat20 = cell2mat(cellfun(@str2num,f20,'uniform',0));
    Mat21 = cell2mat(cellfun(@str2num,f21,'uniform',0));
    Mat22 = cell2mat(cellfun(@str2num,f22,'uniform',0));
    Mat23 = cell2mat(cellfun(@str2num,f23,'uniform',0));
    Mat24 = cell2mat(cellfun(@str2num,f24,'uniform',0));
    Mat25 = cell2mat(cellfun(@str2num,f25,'uniform',0));
    Mat26 = cell2mat(cellfun(@str2num,f26,'uniform',0));
    Mat27 = cell2mat(cellfun(@str2num,f27,'uniform',0));
    Mat28 = cell2mat(cellfun(@str2num,f28,'uniform',0));
    Mat29 = cell2mat(cellfun(@str2num,f29,'uniform',0));
    Mat30 = cell2mat(cellfun(@str2num,f30,'uniform',0));


     % Concataning All Matrices Total 408 index each having 51 indices
    full_Mat = [Mat1 Mat2 Mat3 Mat4 Mat5 Mat6 Mat7 Mat8 Mat9 Mat10 Mat11 Mat12 Mat13 Mat14 Mat15 Mat16 Mat17 Mat18 Mat19 Mat20 Mat21 Mat22 Mat23 Mat24 Mat25 Mat26 Mat27 Mat28 Mat29 Mat30];
    full_Mat= full_Mat(1:1500);
    
    id = num2str(last_entry_id);
    figure(i);
    subplot(2,1,1);
    plot(full_Mat);
    title('Signal ID:' +id);
    %MATLAB Program for filtering ECG Signals
        ecg = full_Mat; %load('ecg_hfn.dat');
        fs=256;
        fc = 15;
        wn= 2*fc/fs;
        slen = length(ecg);
        t=[1:slen]/fs;
        bhi = fir1(10,wn,'low',chebwin(11,30));
        filtered_ecg = filter(bhi,1,ecg);
         subplot(2,1,2);
        plot(filtered_ecg(10:end));
        title(' Filtered Signal');
        collected_data{j,1} = full_Mat;
        filtered_data{j,1} = filtered_ecg;
        j = j+1;
end