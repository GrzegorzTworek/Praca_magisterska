function ekgctfskg(daneekg,transfalk,typekg)
sygnaly=100;
probki=500;
colormap=jet(128);
if typekg=='ARR'
    folderpath=strcat('D:\Projekt_magisterka_1\zbiordanych\ar\');
    findx=0;
    for i=1:30
        indx=0;
        for k=1:sygnaly
            ecgsignal=daneekg(i,indx+1:indx+probki);
            cfs = abs(transfalk.wt(ecgsignal));
            im = ind2rgb(im2uint8(rescale(cfs)),colormap);
            filenameindex=findx+k;
            filename=strcat(folderpath,sprintf('%d.jpg',filenameindex));
            imwrite(imresize(im,[227 227]),filename);
            indx=indx+probki;
        end
        findx=findx+sygnaly
    end
elseif typekg== 'CHF'
    folderpath=strcat('D:\Projekt_magisterka_1\zbiordanych\zns\');
    findx=0;
    for i=1:30
        indx=0;
        for k=1:sygnaly
            ecgsignal=daneekg(i,indx+1:indx+probki);
            cfs = abs(transfalk.wt(ecgsignal));
            im = ind2rgb(im2uint8(rescale(cfs)),colormap);
            filenameindex=findx+k;
            filename=strcat(folderpath,sprintf('%d.jpg',filenameindex));
            imwrite(imresize(im,[227 227]),filename);
            indx=indx+probki;
        end
        findx=findx+sygnaly
    end
elseif typekg== 'NSR'
    folderpath=strcat('D:\Projekt_magisterka_1\zbiordanych\nrz\');
    findx=0;
    for i=1:30
        indx=0;
        for k=1:sygnaly
            ecgsignal=daneekg(i,indx+1:indx+probki);
            cfs = abs(transfalk.wt(ecgsignal));
            im = ind2rgb(im2uint8(rescale(cfs)),colormap);
            filenameindex=findx+k;
            filename=strcat(folderpath,sprintf('%d.jpg',filenameindex));
            imwrite(imresize(im,[227 227]),filename);
            indx=indx+probki;
        end
        findx=findx+sygnaly
    end
end