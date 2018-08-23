DefineInnerModel <- function() {
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
}

GetIndex <- function(colValues, strValues) {
	colIndex <- NULL
	for(i in strValues) {
		colIndex <- c(colIndex, grep(i, colValues))
	}
	colIndex
}

DefineOuterMode <- function(rawData) {

	colValues <- names(rawData)
	innovation_blocks <- list(GetIndex(colValues, Climate), 
				  GetIndex(colValues, Motivation), 
				  GetIndex(colValues,Learning), 
				  GetIndex(colValues,SIList), 
				  GetIndex(colValues,Innovation)
				  )

	# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c("B",
			     "B",
			     "B",
			     "B",
			     "A"
			     )
}

mypls <- function() {
	innov_pls <- plspm(temp, innovation_path, innovation_blocks, modes=innovation_mode)
	plot(innov_pls)
	plot(innov_pls, what="loadings")
}
