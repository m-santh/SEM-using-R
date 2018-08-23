
# Set the working directory...
setwd("E:/Digital-Dis/innovation-outsource/network/ranjay gulati/community of practice/synopsis/Analysis-R")

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
		barplot(distribution, 
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

	# Correlation between items...
	SIList_pca <- nipals(rawData[,SIList])
	plot(SIList_pca, main = "Social Interaction")

	SIClimate_pca <- nipals(rawData[,Climate])
	plot(SIClimate_pca, main = "Social Climate")

	# Based on this..
	# Remove ClimateTrust5,
	# Remove ClimateRelationInitation3,

	SILearning_pca <- nipals(rawData[,Learning])
	plot(SILearning_pca, main = "Social Learning")

	SIMotivation_pca <- nipals(rawData[,Motivation])
	plot(SIMotivation_pca, main = "Social Motivation")

	SIInnovation_pca <- nipals(rawData[,Innovation])
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

rawData <- ReadData()

correctData <- CleanMyData(rawData)
