#Single dimension model

DefineInnerModel <- function() {
	SocialClimate 	     <- c(0, 0, 0, 0)
	IndividualMotivation <- c(1, 0, 0, 0)
	LearningCapability   <- c(1, 1, 0, 0)
	InnovationAbility    <- c(1, 1, 1, 0)

	innovation_path <- rbind(SocialClimate,
				 IndividualMotivation,
				 LearningCapability,
				 InnovationAbility
				 )

	colnames(innovation_path) <- rownames(innovation_path)

	innerplot(innovation_path)
}

GetIndex <- function(colValues, strValues) {
	colIndex <- NULL
	for(i in strValues) {
		colIndex <- c(colIndex, which(colValues == i))
	}
	colIndex
}

DefineOuterMode <- function(correctData) {

	colValues <- names(correctData)
	Innovation[c(1,4, 6:8,12, 13, 17)]
	Learning[c(1,3:4,9:12)]
	Learning[c(9:10,12)]
	Learning[c(1,3:4)]
	Climate[c(1, 8, 12,18)]
	Motivation[c(1,4:7,12,19)]
	
	# Before commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(1, 8, 12,18)]), 
				  GetIndex(colValues, Motivation[c(1,4:7, 12, 19)]), 
				  GetIndex(colValues, Learning[c(1,3:4,9:12)]), 
				  GetIndex(colValues, Innovation[c(1,4, 6:8,12, 13, 17)])
				  )

	# After commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(8, 18)]), 
	                          GetIndex(colValues, Motivation[c(1,4:7)]), 
	                          GetIndex(colValues, Learning[c(1,9:12)]), 
	                          GetIndex(colValues, Innovation[c(1,4, 7:8,12, 13)])
	)
	
	# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c("A",
			     "A",
			     "A",
			     "A"
			     )
}

mypls <- function() {
	innov_pls <- plspm(test, innovation_path, innovation_blocks, modes=innovation_mode, boot.val = TRUE, br = 200)
	plot(innov_pls)
	plot(innov_pls, what="loadings")
	summary(innov_pls)
}
