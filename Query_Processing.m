imageNumber=input('Enter the image number: ');
queryI=imread(sprintf('%d.jpg',imageNumber));
%imshow(queryI);
    queryRed=queryI(:,:,1);
    queryGreen=queryI(:,:,2);
    queryBlue=queryI(:,:,3);
    
    [queryRedColor,x]=imhist(queryRed);
    [queryGreenColor,y]=imhist(queryGreen);
    [queryBlueColor,z]=imhist(queryBlue);
    
    queryStrR='';
    queryStrG='';
    queryStrB='';
    
    r=1;
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if queryRedColor(k)>=0&&queryRedColor(k)<500
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
        queryStrR=strcat(queryStrR,num2str(r));
    end
    
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if queryGreenColor(k)>=0&&queryGreenColor(k)<500
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
        queryStrG=strcat(queryStrG,num2str(r));
    end
    
    for j=1:8:249
        sum=0;
        sum1=0;
        for k=j:j+7
            if queryBlueColor(k)>=0&&queryBlueColor(k)<500
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
        queryStrB=strcat(queryStrB,num2str(r));
    end
    
   %Till now hash value for queries has been generated
   queryHashFinal=strcat(queryStrR,strcat(queryStrG,queryStrB));
   
   queryHashFinal
   
   %Omitting Bits in the hash value
   
   queryHashFinal(2)='*';
   queryHashFinal(14)='*';
   queryHashFinal(23)='*';
   queryHashFinal(54)='*';
   queryHashFinal(76)='*';
   
   save queryHashFinal;