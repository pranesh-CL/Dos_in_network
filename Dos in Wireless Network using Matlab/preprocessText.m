function documents = preprocessText(textData)

documents = tokenizedDocument(textData);
documents = lower(documents);

end