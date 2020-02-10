%READING AND WRITING ECG DATA TO ThingsSpeak

%writing value to thingspeak
%thingSpeakWrite(573092,'Fields',[1,2,3,4,5,6,7,8],'Values',{'12,12','123','23','453','345','345,4534,345','345','99,11'},'WriteKey','FA5RYK1ANQZVZZSY')

while 1
    % Getting Data from Thingspeak
    data = thingSpeakRead(573092,'ReadKey','CQY9GH1GZ7VWNRH7','OutputFormat','table')

    [data2,chInfo] = thingSpeakRead(573092,'Fields',[1 4],'NumPoints',10,'OutputFormat','timetable');

    LastEntry = chInfo.LastEntryID

    %Getting Cell matrices
    field1 = data.i1
    field2 = data.i2
    field3 = data.i3
    field4 = data.i4
    field5 = data.i5
    field6 = data.i6
    field7 = data.i7
    field8 = data.i8


    %f1=field1{1}


    % Converting cell strings to Array
    Mat1 = cell2mat(cellfun(@str2num,field1,'uniform',0));
    Mat2 = cell2mat(cellfun(@str2num,field2,'uniform',0));
    Mat3 = cell2mat(cellfun(@str2num,field3,'uniform',0));
    Mat4 = cell2mat(cellfun(@str2num,field4,'uniform',0));
    Mat5 = cell2mat(cellfun(@str2num,field5,'uniform',0));
    Mat6 = cell2mat(cellfun(@str2num,field6,'uniform',0));
    Mat7 = cell2mat(cellfun(@str2num,field7,'uniform',0));
    Mat8 = cell2mat(cellfun(@str2num,field8,'uniform',0));

    % Concataning All Matrices Total 408 index each having 51 indices
    fMat = [Mat1 Mat2 Mat3 Mat4 Mat5 Mat6 Mat7 Mat8]

    figure
    lId= num2str(LastEntry)


    plot(fMat)
    title("Entry Id: " + lId )
    n = 5;
    pause(n)

   

end


