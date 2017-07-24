imageHashStore=cell(1000,1); % cell is a structure that can store multiple data types

for i=1:999
    
    I=imread(sprintf('%d.jpg',i));
    red=I(:,:,1);
    green=I(:,:,2);
    blue=I(:,:,3);
    
    [redColor,x]=imhist(red);
    [greenColor,y]=imhist(green);
    [blueColor,z]=imhist(blue);
    %imhist(red),figure;
    
    strR='';
    strG='';
    strB='';
    
    r=1;
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if redColor(k)>=0&&redColor(k)<500
                sum=sum+1;
            else
                sum1=sum1+1;
            end
        end
        
        if sum>sum1
            r=0;
        else
            r=1;
        end
        strR=strcat(strR,num2str(r));
    end
    
    g=1;
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if greenColor(k)>=0&&greenColor(k)<500
                sum=sum+1;
            else
                sum1=sum1+1;
            end
        end
        
        if sum>sum1
            g=0;
        else
            g=1;
        end
        strG=strcat(strG,num2str(g));
    end
    
    b=1;
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if blueColor(k)>=0&&blueColor(k)<500
                sum=sum+1;
            else
                sum1=sum1+1;
            end
        end
        
        if sum>sum1
            b=0;
        else
            b=1;
        end
        strB=strcat(strB,num2str(b));
    end

    strFinal=strcat(strR,strcat(strG,strB));

    imageHashStore{i,1}=strFinal;
end

save imageHashStore;