data = readtable("C:/matlab/project/NSL KDD/KDDTest+.csv");
head(data)
cvp = cvpartition(data.Var2,Holdout=0.2);
dataTrain = data(training(cvp),:);
dataValidation = data(test(cvp),:);
documentsTrain = preprocessText(dataTrain.Var3);
TTrain = categorical(dataTrain.Var2);
classNames = unique(TTrain)
numObservations = numel(TTrain)
documentsValidation = preprocessText(dataValidation.Var3);
TValidation = categorical(dataValidation.Var2);
enc = wordEncoding(documentsTrain);
numWords = enc.NumWords
XTrain = doc2sequence(enc,documentsTrain);
XValidation = doc2sequence(enc,documentsValidation);
embeddingDimension = 100;
ngramLengths = [2 3 4 5];
numFilters = 200;
minLength = min(doclength(documentsTrain));
layers = [ 
    sequenceInputLayer(1,MinLength=minLength)
    wordEmbeddingLayer(embeddingDimension,numWords,Name="emb")];
lgraph = layerGraph(layers);
numBlocks = numel(ngramLengths);
for j = 1:numBlocks
    N = ngramLengths(j);
    
    block = [
        convolution1dLayer(N,numFilters,Name="conv"+N,Padding="same")
        batchNormalizationLayer(Name="bn"+N)
        reluLayer(Name="relu"+N)
        dropoutLayer(0.2,Name="drop"+N)
        globalMaxPooling1dLayer(Name="max"+N)];
    
    lgraph = addLayers(lgraph,block);
    lgraph = connectLayers(lgraph,"emb","conv"+N);
end
numClasses = numel(classNames);

layers = [
    concatenationLayer(1,numBlocks,Name="cat")
    fullyConnectedLayer(numClasses,Name="fc")
    softmaxLayer(Name="soft")
    classificationLayer(Name="classification")];

lgraph = addLayers(lgraph,layers);
for j = 1:numBlocks
    N = ngramLengths(j);
    lgraph = connectLayers(lgraph,"max"+N,"cat/in"+j);
end

figure
plot(lgraph)
title("Network Architecture")
options = trainingOptions("adam", ...
    MiniBatchSize=128, ...
    ValidationData={XValidation,TValidation}, ...
    OutputNetwork="best-validation-loss", ...
    Plots="training-progress", ...
    Verbose=false);
net = trainNetwork(XTrain,TTrain,lgraph,options);
YValidation = classify(net,XValidation);
figure
confusionchart(TValidation,YValidation)
accuracy = mean(TValidation == YValidation)
reportsNew = [ 
    "http"
    "domain_u"
    "ecr_i"];
documentsNew = preprocessText(reportsNew);
XNew = doc2sequence(enc,documentsNew);
YNew = classify(net,XNew)
