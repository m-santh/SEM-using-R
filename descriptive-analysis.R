
# Set the working directory...
setwd("C:/Thesis/Analysis-R")

#install.packages("xlsx")
#install.packages("reshape2")

source("cleanData.R")

library(RColorBrewer)
library(plsdepot)
library(plspm)

completeBlock <- NULL

MyExplore <- function(rawData) {
	print("Dimension of data used for analysis")
	print(dim(rawData))

	print("Summarized statistics of the required variables")
  colIndex <- GetColIndex(names(rawData), c(SIList, Climate, Learning, Motivation, Innovation))
	print(summary(rawData[, colIndex]))

	# Preliminary Exploration

	# Setting graphical parameters
	#op = par(mfrow = c(30,3)) #, mar=c(2.5, 3.2, 2, 0.8))
	# bar-char for each indicator of support
	completeBlock <<- c(SIList,
			    Climate,
			    Learning,
			    Motivation,
			    Innovation
			    )
  	varNames <- names(rawData)
  	colIndex <- GetColIndex(varNames, completeBlock)
	for(j in colIndex) {
		distribution <- table(rawData[,j])/nrow(rawData)
		barplot(distribution #, 
			#border=NA, 
			#col=brewer.pal(8, "Blues")[2:8], 
			#axes = FALSE, 
			#main = varNames[j], 
			#cex.main=1
			)

		# add vertical axis, and rectangle around figure
		#axis(side=2, las=2)
		#box("figure", col="gray70")
	}

	# reset default graphical parameters
	#par(op)
  rawData <- DataFactor2IntClass(rawData)
	# Correlation between items...
	colIndex <- GetColIndex(varNames, SIList)
	SIList_pca <- nipals(rawData[,colIndex])
	plot(SIList_pca, main = "Social Interaction")

	colIndex <- GetColIndex(varNames, Climate)
	SIClimate_pca <- nipals(rawData[,colIndex])
	plot(SIClimate_pca, main = "Social Climate")

	# Based on this..
	# Remove ClimateTrust5,
	# Remove ClimateRelationInitation3,

	colIndex <- GetColIndex(varNames, Learning)
	SILearning_pca <- nipals(rawData[,colIndex])
	plot(SILearning_pca, main = "Social Learning")

	colIndex <- GetColIndex(varNames, Motivation)
	SIMotivation_pca <- nipals(rawData[,colIndex])
	plot(SIMotivation_pca, main = "Social Motivation")

	colIndex <- GetColIndex(varNames, Innovation)
	SIInnovation_pca <- nipals(rawData[,colIndex])
	plot(SIInnovation_pca, main = "Social Innovation")

}

MyBasicPLSPM <- function(rawData) {

	# Define inner model
	SocialClimate 	     <- c(0, 0, 0, 0, 0)
	IndividualMotivation <- c(0, 0, 0, 0, 0)
	LearningCapability   <- c(0, 0, 0, 0, 0)
	SocialNetwork	     <- c(1, 1, 1, 0, 0)
	InnovationAbility     <- c(1, 1, 1, 1, 0)

	innovation_path <- rbind(SocialClimate,
								IndividualMotivation,
								LearningCapability,
								SocialNetwork,
								InnovationAbility
								)

	colnames(innovation_path) <- rownames(innovation_path)
	innerplot(innovation_path)

	# Define outer model
	colValues <- names(rawData)
	innovation_blocks <- list(GetColIndex(colValues, Climate),
								GetColIndex(colValues, Motivation),
								GetColIndex(colValues, Learning),
								GetColIndex(colValues, SIList),
								GetColIndex(colValues, Innovation)
								)

	# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c("A",
						"A",
						"A",
						"A",
						"A"
						)
	innov_pls <- plspm(rawData, 
					   innovation_path, 
					   innovation_blocks, 
					   innovation_mode
					   )
	plot(innov_pls)
  innov_pls$unidim
	plot(innov_pls, what="loadings")
	plot(innov_pls, what="weights")
}

tTestPrint <- function(x, y, nameVal){
  ttest <- t.test(x, y)  
  print(nameVal, ttest$statistic, ttest$parameter, ttest$p.value, ttest$conf.int, ttest$estimate)
}

NoResponseBias <- function(rawData) {
  print("T-test analysis of non responsive data")
  print(dim(rawData))
  nrow <- dim(rawData)[1]
  nlate <- 27
  data1 <- rawData[1:(nrow-nlate),]
  data2 <- rawData[(nrow - nlate):nrow, ]
  
    
  colValues <- names(rawData)
  
  nameList <- GetColIndex(colValues, Climate)
  print("Social Climate")
  for (i in nameList) {
    tTestPrint(data1[,i], data2[,i], colValues[i])
    
  }
  nameList <-   GetColIndex(colValues, Motivation)
  print("Individual Motivation")
  for (i in nameList) {
    tTestPrint(data1[,i], data2[,i], colValues[i])
    
  }
  nameList <-   GetColIndex(colValues, Learning)
  print("Learning Capability")
  for (i in nameList) {
    tTestPrint(data1[,i], data2[,i], colValues[i])
    
  }
  nameList <-   GetColIndex(colValues, SIList)
  print("Innovation Network")
  for (i in nameList) {
    tTestPrint(data1[,i], data2[,i], colValues[i])
    
  }
  nameList <-   GetColIndex(colValues, Innovation)
  print("Innovativeness")
  for (i in nameList) {
    tTestPrint(data1[,i], data2[,i], colValues[i])
    
  }
  
}

rawData <- ReadData()

correctData <- CleanMyData(rawData)
