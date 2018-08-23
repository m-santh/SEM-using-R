# Item Scale...
test <- DataFactor2IntClass(correctData)

modelT <- ' fact_1 =~ SITopicPolitics1 + SITopicLocalEvents1 + SITopicFriends1 + SITopicLeisure1 + SITopicFamily1 '

fit <- cfa(modelT, test[,SITopic1])

summary(fit)

correctData$Topic <- predict(fit)

correctData$Topic <- test$SITopicPolitics1 + 1.591 * test$SITopicLocalEvents1 + 1.648 *test$SITopicFriends1 + 1.887 * test$SITopicLeisure1 + 2.115 * test$SITopicFamily1
correctData$Topic <- test$SITopicPolitics1 + 1 * test$SITopicLocalEvents1 + 1 *test$SITopicFriends1 + 1 * test$SITopicLeisure1 + 1 * test$SITopicFamily1

modelSI <- 'fact1 =~ SICloseness1 + SIFrequency1 + SIExchangeDepth1 + SIUniqueness1 + SICommunityOverlap1 + Topic'

#modelSI <- 'fact1 =~ SICloseness1 + SIFrequency1 + SIExchangeDepth1 + SIUniqueness1 + SICommunityOverlap1 + SIDurationMonth1 +  Topic + Relation'
#modelSI <- 'fact1 =~ SICloseness1 + SIFrequency1 + SIExchangeDepth1 + SIUniqueness1 + SICommunityOverlap1 + SIDurationMonth1 + SITimeMinutes1+ Topic + Relation'

ff <- cfa(modelSI, test[, testList])

summary(ff, fit.measures=TRUE)


model <- ' fact_1 =~ SIRelationManager1 + SIRelationColleague1 + SIRelationSubordinate1 + SIRelationFamily1 + SIRelationMentor1 + SIRelationNeighbor1'
fit <- cfa(model, test[,SIRelation1])
summary(fit)
correctData$Relation <-  test$SIRelationManager1 + 0.519 * test$SIRelationSubordinate1 + 1.353 *test$SIRelationFamily1 + 0.501 * test$SIRelationMentor1
correctData$Relation <-  test$SIRelationManager1 + 1 * test$SIRelationSubordinate1 + 1 *test$SIRelationFamily1 + 1 * test$SIRelationMentor1

testList <- c(
  "SICloseness1",
  "SIFrequency1",
  "SIExchangeDepth1",
  "SIUniqueness1",
  "SICommunityOverlap1",
  "SIDurationMonth1",
  "SITimeMinutes1",
  #"SICount",
  "Topic", 
  "Relation"
  )

ItemSelection(correctData, testList)

modelPosition <- ' fact1 =~ SIUniqueness1 + SIExchangeDepth1'
fit <- cfa(modelPosition, test[,c("SIUniqueness1", "SIExchangeDepth1")])
summary(fit)
correctData$SIPosition <- test$SIUniqueness1 + 0.586* test$SIExchangeDepth1


modelMultiplexity <- ' fact1 =~ SICommunityOverlap1 + SIDurationMonth1 + Topic + Relation'
fit <- cfa(modelMultiplexity, test[,c("SIDurationMonth1", "SICommunityOverlap1", "Topic", "Relation")])
summary(fit)
correctData$SIMultiplexity <-  test$SICommunityOverlap1 +56.285 * test$SIDurationMonth1 + 2.294 * correctData$Topic + 0.336 * correctData$Relation

modelDensity <- ' fact1 =~ SIFrequency1 + SICloseness1 '
fit <- cfa(modelDensity, test[,c("SIFrequency1", "SICloseness1")])
summary(fit)
correctData$SIDensity <- test$SIFrequency1 + 0.379 * test$SICloseness1

modelEmbedded <- ' fact1 =~   SICount+ SITimeMinutes1'
fit <- cfa(modelEmbedded, test[,c("SITimeMinutes1", "SICount")])
summary(fit)

correctData$Embeddedness <- testData$SICount - 3.037 *testData$SITimeMinutes1

correctData$Embeddedness <- testData$SITimeMinutes1


testList1 <- c(
  "Embeddedness",
  "SIPosition",
  "SIDensity",
  #"SIFrequency1", "SICloseness1",
  "SIMultiplexity"
  #"SIDurationMonth1", "SICommunityOverlap1", "Topic", "Relation"
)

ItemSelection(correctData, testList1)

modelM <- '
  fact1 =~ MotivationIntrinsic2 + MotivationIntrinsic4 + MotivationIntrinsic3 + MotivationIntrinsic1 + MotivationIntrinsic6 + MotivationIntrinsic5 +
          MotivationIntegrated1 + MotivationIntrinsic7 + MotivationIdentified1 + MotivationIdentified3 + MotivationIntegrated3 + MotivationIdentified4 + MotivationIntegrated2
  fact2 =~ MotivationIntrojected2 + MotivationIntrojected4 + MotivationIntrojected1 + MotivationIdentified2 + MotivationExternal1'
fit <- cfa(modelM, test[,Motivation])



ModelIntrinsic <- 'fact1 =~ 
  MotivationIntrinsic1 +
  MotivationIntrinsic2 +
  MotivationIntrinsic3 +
  MotivationIntrinsic4 +
  MotivationIntrinsic5 +
  MotivationIntrinsic6 +
  MotivationIntrinsic7 '

fit <- cfa(ModelIntrinsic, test[,MotivationIntrinsic])


correctData$MotivationIntrinsic <- test$MotivationIntrinsic1 + 1.105 * test$MotivationIntrinsic2 + 1.059 * test$MotivationIntrinsic3 + 1.011 * test$MotivationIntrinsic4 + 0.945 * test$MotivationIntrinsic5 + 1.008 * test$MotivationIntrinsic6 + 1.057 * test$MotivationIntrinsic7


ModelIntegrated <- ' fact1 =~ 
  MotivationIntegrated1 +
  MotivationIntegrated2 +
  MotivationIntegrated3 '
fit <- cfa(ModelIntegrated, test[,MotivationIntegrated])

correctData$MotivationIntegrated <- test$MotivationIntegrated1 + 1.006 * test$MotivationIntegrated2 + 1.006 * test$MotivationIntegrated3

ModelIdentified <- ' fact1 =~
  MotivationIdentified1 +
  MotivationIdentified2 +
  MotivationIdentified3 +
  MotivationIdentified4 '

fit <- cfa(ModelIdentified, test[, MotivationIdentified])
summary(fit)
correctData$MotivationIdentified <- test$MotivationIdentified1 + 0.541 * test$MotivationIdentified2 + 0.853 *test$MotivationIdentified3 + 0.976 *test$MotivationIdentified4 


ModelIntrojected <- '
  MotivationIntrojected1 +
  MotivationIntrojected2 +
  MotivationIntrojected3 +
  MotivationIntrojected4'

fit <- cfa(ModelIntrojected, test[,MotivationIntrojected])
summary(fit)
correctData$MotivationIntrojected <- test$MotivationIntrojected1 + 0.541 * test$MotivationIntrojected2 + 0.853 * test$MotivationIntrojected3 + 0.976 *test$MotivationIntrojected4

MotivationList <- c("MotivationIntrinsic",
                "MotivationIntegrated",
                "MotivationIdentified",
                "MotivationIntrojected",
                "MotivationExternal1"
)

ItemSelection(correctData, MotivationList)


ModelTrust <- 'fact1 =~
  ClimateTrust1 +
  ClimateTrust2 +
  ClimateTrust3 +
  ClimateTrust4 ' #+
  #ClimateTrust5'

fit <- cfa(ModelTrust, test[,ClimateTrust])
summary(fit)
correctData$ClimateTrust <- test$ClimateTrust1 + 1.635 * test$ClimateTrust2 + 1.324 * test$ClimateTrust3 + 1.206 *test$ClimateTrust4


ModelReciprocity <- ' fact1 =~
  ClimateReciprocity1 +
  ClimateReciprocity2'

fit <- cfa(ModelReciprocity, test[,ClimateReciprocity])
summary(fit)
correctData$ClimateReciprocity <- test$ClimateReciprocity1 + 0.986 * test$ClimateReciprocity2

ModelIdentification <- 'fact1 =~
  ClimateIdentification1 +
  ClimateIdentification2 +
  #ClimateIdentification3 +
  ClimateIdentification4'

fit <- cfa(ModelIdentification, test[,ClimateIdentification])
summary(fit)
correctData$ClimateIdentification <- test$ClimateIdentification1 + 0.982 * test$ClimateIdentification2 + 0.899 * test$ClimateIdentification4


ModelSharedLang <- ' fact1 =~
  ClimateSharedLang1 +
  ClimateSharedLang2 +
  ClimateSharedLang3'

fit <- cfa(ModelSharedLang, test[,ClimateSharedLang])
summary(fit)
correctData$ClimateSharedLang <- test$ClimateSharedLang1 + 1.238 * test$ClimateSharedLang2 + 1.133 * test$ClimateSharedLang3

ModelSharedVision <- 'fact1 =~
  ClimateSharedVision1 +
  #ClimateSharedVision2 +
  ClimateSharedVision3'

fit <- cfa(ModelSharedVision, test[,ClimateSharedVision])
summary(fit)
correctData$ClimateSharedVision <- test$ClimateSharedVision1 + 1.092 * test$ClimateSharedVision3

ModelRelationInitation <- 'fact1 =~
  ClimateRelationInitation1 +
  ClimateRelationInitation2 +
  #ClimateRelationInitation3 +
  ClimateRelationInitation4'

fit <- cfa(ModelRelationInitation, test[,ClimateRelationInitation])
summary(fit)
correctData$ClimateRelationInitation <- test$ClimateRelationInitation1 + 0.867 * test$ClimateRelationInitation2 + 0.630 * test$ClimateRelationInitation4

ClimateList <- c("ClimateTrust", 
             "ClimateReciprocity", 
             "ClimateIdentification", 
             "ClimateSharedLang" #, 
             #"ClimateSharedVision", 
             #"ClimateRelationInitation"
)


ItemSelection(correctData, ClimateList)

ModelEmbed <- 'fact1 =~
  LearningEmbed1 +
  LearningEmbed2 +
  LearningEmbed3 +
  LearningEmbed4 +
  #LearningEmbed5 +
  LearningEmbed6'

fit <- cfa(ModelEmbed, test[,LearningEmbed])
summary(fit)
correctData$LearningEmbed <- test$LearningEmbed1 + 0.904 * test$LearningEmbed2 + 0.986 * test$LearningEmbed3 + 1.030 * test$LearningEmbed4 + 0.834 * test$LearningEmbed6


ModelEmpower <- ' fact1 =~
  LearningEmpower1 +
  LearningEmpower2 +
  LearningEmpower3 +
  LearningEmpower4 +
  LearningEmpower5 +
  LearningEmpower6'

fit <- cfa(ModelEmpower, test[,LearningEmpower])
summary(fit)
correctData$LearningEmpower <- test$LearningEmpower1 + 0.377 * test$LearningEmpower2 + 0.937 * test$LearningEmpower3 + 0.932 * test$LearningEmpower4 + 1.070 * test$LearningEmbed5 + 0.873 *test$LearningEmpower6

ModelConnection <- 'fact1 =~
  LearningConnection1 +
  LearningConnection2 +
  LearningConnection3 +
  #LearningConnection4 +
  LearningConnection5 +
  LearningConnection6'

fit <- cfa(ModelConnection, test[,LearningConnection])
summary(fit)
correctData$LearningConnection <- test$LearningConnection1 + 1.091 * test$LearningConnection2 + 0.929 * test$LearningConnection3 + 0.931 * test$LearningConnection5 + 1.063 * test$LearningConnection6

ModelLeader <- 'fact1 =~
  LearningLeader1 +
  LearningLeader2 +
  LearningLeader3'

fit <- cfa(ModelLeader, test[,LearningLeader])
summary(fit)
correctData$LearningLeader <- test$LearningLeader1 + 1.188 * test$LearningLeader2 + 1.040 * test$LearningLeader3


LearningList <- c("LearningEmbed",
              "LearningEmpower",
              "LearningConnection",
              "LearningLeader"
)


ItemSelection(correctData, LearningList)

ModelProduct <- ' fact1 =~
  InnovProduct1 +
  InnovProduct2 +
  InnovProduct3 +
  InnovProduct4 '#+
  #InnovProduct5'

fit <- cfa(ModelProduct, test[,InnovationProduct])
summary(fit)
correctData$InnovationProduct <- test$InnovProduct1 + 0.967 * test$InnovProduct2 + 1.329 * test$InnovProduct3 + 1.122 * test$InnovProduct4 

ModelProcess <- ' fact1 =~
  InnovProcess1 +
  InnovProcess2 +
  InnovProcess3 +
  InnovProcess4'

fit <- cfa(ModelProcess, test[,InnovationProcess])
summary(fit)
correctData$InnovationProcess <- test$InnovProcess1 + 1.322 * test$InnovProcess2 + 1.306 * test$InnovProcess3 + 1.096 * test$InnovProcess4

ModelOperation <- 'fact1 =~
  InnovOperation1 +
  InnovOperation2 +
  InnovOperation3 +
  InnovOperation4'

fit <- cfa(ModelOperation, test[,InnovationOperation])
summary(fit)
correctData$InnovationOperation <- test$InnovOperation1 + 1.181 * test$InnovOperation2 + 0.932 * test$InnovOperation3 + 0.999 * test$InnovOperation4

ModelCompetitor <- ' fact1 =~
  InnovCompetitor1 +
  InnovCompetitor2'

fit <- cfa(ModelCompetitor, test[,InnovationCompetitor])
summary(fit)
correctData$InnovationCompetitor <- test$InnovCompetitor1 + 1.11 * test$InnovCompetitor2

ModelType <- ' fact1 =~
  InnovRadical1 +
  InnovRadical2'

fit <- cfa(ModelType, test[,InnovationType])
summary(fit)
correctData$InnovationType <- test$InnovRadical1 + 1.005 * test$InnovRadical2

InnovationList <- c("InnovationProduct",
                "InnovationProcess",
                "InnovationOperation",
                "InnovationCompetitor",
                "InnovationType"
)

ItemSelection(correctData, InnovationList)


# Item selection
Innovation[c(1,4, 6:8,12, 13, 17)]
Learning[c(1,3:4,9:12)]
Learning[c(9:10,12)]
Learning[c(1,3:4)]
Climate[c(1, 8, 12,18)]
Motivation[c(1,4:7,12,19)]
testList <- c("SICloseness1", "SIFrequency1", "SIExchangeDepth1", "SIUniqueness1", "SICommunityOverlap1", "Topic")


MotModel <- ' intr =~ MotivationIntrinsic1 +MotivationIntrinsic4 + MotivationIntrinsic5 + MotivationIntrinsic6 + MotivationIntrinsic7
              ext =~  MotivationIdentified2 +MotivationExternal1
'

MotModelOne <- ' fact1 =~ MotivationIntrinsic1 +MotivationIntrinsic4 + MotivationIntrinsic5 + MotivationIntrinsic6 + MotivationIntrinsic7
              + MotivationExternal1
'

LearnModel <- 'emb =~ LearningEmbed1 + LearningEmbed3 + LearningEmbed4
                emp =~ LearningEmpower3 + LearningEmpower4 + LearningEmpower5 + LearningEmpower6'

LearnModelOne <- 'fact1 =~ LearningEmbed1 + LearningEmbed3 + LearningEmbed4
                + LearningEmpower3 + LearningEmpower4 + LearningEmpower5 + LearningEmpower6'

InnovModel <- 'prod =~ InnovProduct1 + InnovProduct4
              procc =~ InnovProcess1 + InnovProcess2 + InnovProcess3 + InnovOperation3 + InnovOperation4
              rad =~ InnovRadical2
              '

InnovModelOne <- 'prod =~ InnovProduct1 + InnovProduct4
              + InnovProcess1 + InnovProcess2 + InnovProcess3 + InnovOperation3 + InnovOperation4
              + InnovRadical2
              '

CliModel <- 'fact1 =~ ClimateTrust1
              fact2 =~ ClimateIdentification1
              fact3 =~ ClimateSharedLang1
              fact4 =~ ClimateRelationInitation1'

CliModelOne <- 'fact1 =~ ClimateTrust1
              + ClimateIdentification1
              + ClimateSharedLang1
              + ClimateRelationInitation1'

SIModel <- 'Density =~ SICommunityOverlap1 + Topic
            Embeddedness =~ SICloseness1 + SIFrequency1 
            Multiplexity =~ SIExchangeDepth1 + SIUniqueness1'

SIModelOne <- 'fact1 =~ SICommunityOverlap1 + Topic
            + SICloseness1 + SIFrequency1
            + SIExchangeDepth1 + SIUniqueness1'

AllModel <- '
      SI =~ SICommunityOverlap1 + Topic + SICloseness1 + SIFrequency1 + SIExchangeDepth1 + SIUniqueness1
      #mot =~ intr + ext
              intr =~ MotivationIntrinsic1 +MotivationIntrinsic4 + MotivationIntrinsic5 + MotivationIntrinsic6 + MotivationIntrinsic7
              ext =~  MotivationIdentified2 +MotivationExternal1
      climate =~ ClimateTrust1 + ClimateIdentification1 + ClimateSharedLang1 + ClimateRelationInitation1
      #Learn =~ emb + emp
                emb =~ LearningEmbed1 + LearningEmbed3 + LearningEmbed4
                emp =~ LearningEmpower3 + LearningEmpower4 + LearningEmpower5 + LearningEmpower6
      #Innov =~ prod + procc + rad
              prod =~ InnovProduct1 + InnovProduct4
              procc =~ InnovProcess1 + InnovProcess2 + InnovProcess3 + InnovOperation3 + InnovOperation4
              rad =~ InnovRadical2
        '

allList <- c(
  Innovation[c(1,4, 6:8,12, 13, 17)],
  Learning[c(1,3:4,9:12)],
  Climate[c(1, 8, 12,18)],
  Motivation[c(1,4:7,12,19)],
  testList
)

firmSizeList <- c("Revenue", "RevenueComp", "NumEmployee")

allListF <- c(allList, firmSizeList)

# Normalize the social relation values
temp <- scale(test[,allList])


AllModel <- '
      
      SI =~ SICommunityOverlap1 + Topic + SICloseness1 + SIFrequency1 + SIExchangeDepth1 + SIUniqueness1
      mot =~ intr + ext
              intr =~ MotivationIntrinsic1 +MotivationIntrinsic4 + MotivationIntrinsic5 + MotivationIntrinsic6 + MotivationIntrinsic7
              ext =~  MotivationIdentified2 +MotivationExternal1
      climate =~ ClimateTrust1 + ClimateIdentification1 + ClimateSharedLang1 + ClimateRelationInitation1
      Learn =~ emb + emp
                emb =~ LearningEmbed1 + LearningEmbed3 + LearningEmbed4
                emp =~ LearningEmpower3 + LearningEmpower4 + LearningEmpower5 + LearningEmpower6
      Innov =~ prod + procc + rad
      #Innov =~ InnovProduct1 + procc + InnovRadical2
              prod =~ InnovProduct1 + InnovProduct4
              procc =~ InnovProcess1 + InnovProcess2 + InnovProcess3 + InnovOperation3 + InnovOperation4
              rad =~ InnovRadical2
        '

fit <- cfa(SIModel, data=test, std.lv=TRUE)
fitOne <- cfa(SIModelOne, data=test, std.lv=TRUE)

anova(fit, fitOne)

# Normality test

for(i in allList) {
  
  result <- shapiro.test(testData[,i])
  print(paste(result$p.value, result$p.value > 0.05))
}

# path diagram via the semPlot package
library(semPlot)
semPaths(object=fit,what="std",edge.label.cex=1, curvePivot = TRUE,
         fixedStyle=c("black",1), freeStyle=c("black",1), edge.color="black")

library(MVN)
# pull out just the variables we're using (x1-x9)
x_vars <- testData[,allList]
mvn(data = x_vars, mvnTest = "royston", univariatePlot = "histogram")
#uniPlot(x_vars, type = "histogram")

summary(fit, fit.measures=TRUE, standardized=TRUE)
parameterEstimates(fit, standardized=TRUE)

residuals(fit, type = "cor")$cor




# generate the descriptives table using dplyr and tidyr functions, and kable
test[,allList] %>% 
  select(InnovProduct1:Topic) %>% 
  gather("Variable", "value") %>% 
  group_by(Variable) %>% 
  summarise(Mean=mean(value, na.rm=TRUE), 
            SD=sd(value, na.rm=TRUE), 
            min=min(value, na.rm=TRUE), 
            max=max(value, na.rm=TRUE), 
            '% Missing'=100*length(which(is.na(value)))/n()) %>% 
  kable(digits=2, format="pandoc", caption="Table 1: Descriptive Statistics for Observed Variables")

