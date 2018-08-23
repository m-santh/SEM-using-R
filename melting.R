# Find the rows with 

SIRelation1 # has list of coloums...

rawData <- DataIntClass(workingData)

rowIndex  <- NULL

for(i in 1: nrow(rawData)) {
  if(sum(rawData[i,SIRelation1], na.rm=T) > 1) {
    rowIndex <- c(rowIndex, i)
  }
}


