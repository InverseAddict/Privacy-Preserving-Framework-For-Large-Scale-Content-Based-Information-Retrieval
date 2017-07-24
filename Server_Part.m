 eliminatedSetOfHash=cell(32,1);  %For Containing all possible combinations for our hash
    queryHashFinal
    
    incrementer=1;
    %Generating all possible hashvalues 
    for i=1:2
        queryHashFinal(2)=num2str(i-1);
            for j=1:2
                queryHashFinal(14)=num2str(j-1);
                    for k=1:2
                        queryHashFinal(23)=num2str(k-1);
                            for l=1:2
                                queryHashFinal(54)=num2str(l-1);
                                    for m=1:2
                                        queryHashFinal(76)=num2str(m-1);
                                        eliminatedSetOfHash{incrementer,1}=queryHashFinal;
                                        incrementer=incrementer+1;
                                    end
                            end
                    end
            end
    end
    
    temporaryCandidates=cell(10000,1);
    intemp=1;
    
    for index=1:32
        queryOnHoldFinal=eliminatedSetOfHash{index,1};
        for i=1:999
            candidateOnHold=imageHashStore{i,1};
            sumRed=0;
            sumGreen=0;
            sumBlue=0;
        
            for j=1:32
                if candidateOnHold(j)==queryOnHoldFinal(j)
                    sumRed=sumRed+1;
                end
            end
        
            for j=33:64
                if candidateOnHold(j)==queryOnHoldFinal(j)
                    sumGreen=sumGreen+1;
                end
            end
        
            for j=65:96
                if candidateOnHold(j)==queryOnHoldFinal(j)
                    sumBlue=sumBlue+1;
                end
            end
        
            if sumRed>=26&&sumGreen>=26&&sumBlue>=26
                %sprintf('%d',sumRed)
                temporaryCandidates{intemp,1}=i;
                intemp=intemp+1;
                %imshow(imread(sprintf('%d.jpg',i)));
            end
        end
    end
    
    finalCandidates=unique(cell2mat(temporaryCandidates),'rows');
    [rows,columns]=size(finalCandidates);
    
    for fi=1:rows
       subplot(7,8,fi),imshow(imread(sprintf('%d.jpg',finalCandidates(fi))));
    end