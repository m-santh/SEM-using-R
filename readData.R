#	xlsx package for - reading and writing to xlsl.
#install.packages("xlsx")
library(xlsx)

setwd("C:/Thesis/Thesis-Analysis")

source("config.R")

#	Global varibles
variablesData <- NULL

# ReadVariableName
#	This fuction reads the file and gets names of variables
#		- Name of variables
#		- Reverse coded variables
#		- Part of tiny data or not
#	Udates the same in variablesData
# 	File variables
#		- variableName1	 (1st row of QuestionPro datalabels)
#		- variableName2	 (2nd row of QuestionPro datalabels)
#		- codedName		 (target names)
#		- reverseCoding	 (indicates whether reverse coded or not)
#		- tidyDataPart	 (is the variable part of tidy data)
# 
ReadVariableName <- function(){

		# Read the xlsx file.
		variablesData <- read.xlsx2(variableNameFile, 
							  	  sheetName=variableSheetName,
							  	  header=TRUE,
							  	  stringsAsFactors = FALSE
							  	  )

		# correct the colClasses
		variablesData$tidyDataPart <- as.factor(variablesData$tidyDataPart)
		variablesData$reverseCoding <- as.factor(variablesData$reverseCoding)

		# Remove unwanted rows
		variablesData <- variablesData[variablesData$codedName != "",]

		# Return
		variablesData

}

# ReadResponseFile
#	This function takes in the filename as argument and returns an dataframe
#	The data frame contains the following characterstics..
#		- Correct Coloum names
#		- Correct Coloum types
#		- Correct Coloum values (formatted...)
#		- Removes wrong data i.e, data with time take to fill is 0
#	In short returns corrected data...
ReadResponseFile <- function(fileName) {

		# Read the xlsx file.
		rawData <- read.xlsx2(fileName, 
							  sheetName=sheetNameValue,
							  header=TRUE,
							  startRow = 1, # we need the headers..
							  stringsAsFactors = FALSE
							  )
		# Remove the 2nd row as it has more description..
		rawData<- rawData[2:nrow(rawData),]

		# Read variable name file
		if(is.null(variablesData)) {
				variablesData <<- ReadVariableName()
		}

		# Set variable names as required..
		names(rawData)<- variablesData$codedName

		# Remove not relevant records...
		rawData <- rawData[rawData$timeTaken != "0",]

    # Special case. Drop first 5 responses as the requestions were wrong...
    if(grepl("4776992", fileName)) {
      rawData <- rawData[6:nrow(rawData),]
    }
		# Return
		rawData
}

ReadData <- function() {
	# Read the response directory...
	# It is assumed that all the required files are downloaded from 
	# QuestionPro and stored in "datafiles" folder. 
	# (Because no URL is avaiable for download)
	fileList <- list.files(dataDirectory)

	# Read the response data and create a single dataframe...
	## Initialize the dataset to NULL; as we append to this dataset...
	responseDataSet <- NULL
	for(i in fileList) {

		# Read the data from files downloaded from questionpro.
		print(i)
		responseData <- ReadResponseFile(paste0(dataDirectory,"/",i))
					
		# Append the data into the dataset frame...
		responseDataSet <- rbind(responseDataSet, responseData)
	}

	responseDataSet
}

WriteData <- function(data, filename) {
	write.xlsx2(data, filename)
}