clc
clear all

digitDatasetPath='D:\Projekt_magisterka_1\zbiordanych';

digitimages=imageDatastore(digitDatasetPath, 'IncludeSubfolders', true,'LabelSource','foldernames');

numTrainFiles=2500; %liczba danych uczacych

[TrainImages,TestImages]=splitEachLabel(digitimages,numTrainFiles,'randomize');

layers=[
    imageInputLayer([227 227 3], 'Name', 'Input')
    
    
    convolution2dLayer(3, 8,'Padding', 'same','Name','Conv_1')
    batchNormalizationLayer('Name','BN_1')
    reluLayer('Name','Relu_1')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_1')
    
    
    convolution2dLayer(3, 16,'Padding', 'same','Name','Conv_2')
    batchNormalizationLayer('Name','BN_2')
    reluLayer('Name','Relu_2')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_2')
    
    
    convolution2dLayer(3, 32,'Padding', 'same','Name','Conv_3')
    batchNormalizationLayer('Name','BN_3')
    reluLayer('Name','Relu_3')
    maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_3')
    
    
    convolution2dLayer(3, 64,'Padding', 'same','Name','Conv_4')
    batchNormalizationLayer('Name','BN_4')
    reluLayer('Name','Relu_4')
    
    
    fullyConnectedLayer(3,'Name','FC')
    softmaxLayer('Name','Softmax');
    classificationLayer('Name','Output Classifiaction');
    ];
figure;
lgraph = layerGraph(layers);
plot(lgraph); %graf struktury sieci

%Parametry uczenia sieci

options = trainingOptions('sgdm', ...
    'MiniBatchSize',20, ...
    'InitialLearnRate', 0.001, ...
    'MaxEpochs',6, ... 
    'Shuffle', 'every-epoch', ...
    'ValidationData', TestImages, ...
    'ValidationFrequency',20, ...
    'Verbose', true, ...
    'Plots', 'training-progress');

net= trainNetwork(TrainImages, layers, options);

YPred = classify(net,TestImages); %rozpoznawanie skalogramow
YValidation = TestImages.Labels; %pobranie etykiet danych
%wyznaczenie dokładosci przyporzadkowania
accuracy = sum(YPred == YValidation)/numel(YValidation); 
    
%Plotting Confusion Matrix
plotconfusion(YValidation,YPred)   
