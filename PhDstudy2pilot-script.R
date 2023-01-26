### STUDY 2 PILOT DATA COMPILATION SCRIPT ###

## LOADING DATA FILES FOR ALL 4 PILOT PARTICIPANTS ##

library(readr)
CZ61G_WSC <- read_csv("CZ61G_1661605707937_compr_escr.csv")
CZ61G_LD <- read_csv("CZ61G_1661606553982_lex_escr.csv")
CZ61G_V <- read_csv("CZ61G_1661608161679_vocabulario.csv")
CZ61G_SSC <- read_csv("CZ61G_1661607775650_compr_fala.csv")

D4QY2_SSC <- read_csv("D4QY2_1660445701304_compr_fala.csv")
D4QY2_WSC <- read_csv("D4QY2_1660444144566_compr_escr.csv")
D4QY2_LD <- read_csv("D4QY2_1660447381822_lex_escr.csv")
D4QY2_V <- read_csv("D4QY2_1660447788447_vocabulario.csv")

NPF5B_WSC <- read_csv("NPF5B_1660012111888_compr_escr.csv")
NPF5B_SSC <- read_csv("NPF5B_1660013959595_compr_fala.csv")
NPF5B_LD <- read_csv("NPF5B_1660011162139_lex_escr.csv")
NPF5B_V <- read_csv("NPF5B_1660012736440_vocabulario.csv")

SVZ3Q_WSC <- read_csv("SVZ3Q_1661705636346_compr_escr.csv")
SVZ3Q_SSC <- read_csv("SVZ3Q_1665923297168_compr_fala.csv")
SVZ3Q_V <- read_csv("SVZ3Q_1665923893515_vocabulario.csv")
SVZ3Q_LD <- read_csv("SVZ3Q_1660682856663_lex_escr.csv")

#quest <- read_csv("Children-questionnaire-data.csv")

## CREATING VECTOR OF VARIABLES OF INTEREST IN EACH DATA FILE ##

varLD <- c("rt", "stimulus", "response", "class", "status", "answer", "correct", "trial", "letters")
varWSC <- c("rt", "trial_type", "response", "trial", "word", "question", "answer")
varSSC <- c("rt", "trial_type", "response", "trial", "word", "question", "answer")
varV <- c("rt", "response", "portuguese", "kreyol")
#varquest <- c("study", "participant", "age", "arrivalBR", "sexo")

## CREATING SUBSETS WITH VARIABLES OF INTEREST ##

CZ61G_LD<-CZ61G_LD[varLD]
CZ61G_WSC<-CZ61G_WSC[varWSC]
CZ61G_SSC<-CZ61G_SSC[varSSC]
CZ61G_V<-CZ61G_V[varV]

SVZ3Q_LD<-SVZ3Q_LD[varLD]
SVZ3Q_WSC<-SVZ3Q_WSC[varWSC]
SVZ3Q_SSC<-SVZ3Q_SSC[varSSC]
SVZ3Q_V<-SVZ3Q_V[varV]

NPF5B_LD<-NPF5B_LD[varLD]
NPF5B_WSC<-NPF5B_WSC[varWSC]
NPF5B_SSC<-NPF5B_SSC[varSSC]
NPF5B_V<-NPF5B_V[varV]

D4QY2_LD<-D4QY2_LD[varLD]
D4QY2_WSC<-D4QY2_WSC[varWSC]
D4QY2_SSC<-D4QY2_SSC[varSSC]
D4QY2_V<-D4QY2_V[varV]

#quest <- quest[varquest]

## IDENTIFYING SPOKEN SENTENCE COMPREHENSION AND WRITTEN SENTENCE COMPREHENSION SUBSETS AND RBINDING THEM ##

CZ61G_WSC <- cbind(task = "WSC", CZ61G_WSC)
CZ61G_SSC <- cbind(task = "SSC", CZ61G_SSC)
CZ61G_SC <- rbind(CZ61G_WSC, CZ61G_SSC)

SVZ3Q_WSC <- cbind(task = "WSC", SVZ3Q_WSC)
SVZ3Q_SSC <- cbind(task = "SSC", SVZ3Q_SSC)
SVZ3Q_SC <- rbind(SVZ3Q_WSC, SVZ3Q_SSC)

NPF5B_WSC <- cbind(task = "WSC", NPF5B_WSC)
NPF5B_SSC <- cbind(task = "SSC", NPF5B_SSC)
NPF5B_SC <- rbind(NPF5B_WSC, NPF5B_SSC)

D4QY2_WSC <- cbind(task = "WSC", D4QY2_WSC)
D4QY2_SSC <- cbind(task = "SSC", D4QY2_SSC)
D4QY2_SC <- rbind(D4QY2_WSC, D4QY2_SSC)

## REMOVING ROWS WITH PRACTICE TRIALS AND FIXATION CROSS TRIALS IF NEEDED ##

sub_CZ61G_LD <- subset(CZ61G_LD, stimulus != "+" & trial != "prac")
sub_CZ61G_V <- subset(CZ61G_V, rt != "null")
sub_CZ61G_SC <- subset(CZ61G_SC, rt != "null" & trial_type != "instructions" & trial != "prac-sent" & trial != "prac-comp")
sub_CZ61G_SC <- subset(CZ61G_SC, select = -c(trial_type))

sub_SVZ3Q_LD <- subset(SVZ3Q_LD, stimulus != "+" & trial != "prac")
sub_SVZ3Q_V <- subset(SVZ3Q_V, rt != "null")
sub_SVZ3Q_SC <- subset(SVZ3Q_SC, rt != "null" & trial_type != "instructions" & trial != "prac-sent" & trial != "prac-comp")
sub_SVZ3Q_SC <- subset(SVZ3Q_SC, select = -c(trial_type))

sub_NPF5B_LD <- subset(NPF5B_LD, stimulus != "+" & trial != "prac")
sub_NPF5B_V <- subset(NPF5B_V, rt != "null")
sub_NPF5B_SC <- subset(NPF5B_SC, rt != "null" & trial_type != "instructions" & trial != "prac-sent" & trial != "prac-comp")
sub_NPF5B_SC <- subset(NPF5B_SC, select = -c(trial_type))

sub_D4QY2_LD <- subset(D4QY2_LD, stimulus != "+" & trial != "prac")
sub_D4QY2_V <- subset(D4QY2_V, rt != "null")
sub_D4QY2_SC <- subset(D4QY2_SC, rt != "null" & trial_type != "instructions" & trial != "prac-sent" & trial != "prac-comp")
sub_D4QY2_SC <- subset(D4QY2_SC, select = -c(trial_type))

## ADDING PILOT PARTICIPANT NUMBER FOR ANONYMITY AND REPLACING NULLS WITH NAs IF NEEDED ## 

sub_CZ61G_SC <- cbind(pilot = 'CZ61G', sub_CZ61G_SC)
sub_CZ61G_LD <- cbind(pilot = 'CZ61G', sub_CZ61G_LD)
sub_CZ61G_LD[sub_CZ61G_LD == "null"] <- NA

sub_SVZ3Q_SC <- cbind(pilot = 'SVZ3Q', sub_SVZ3Q_SC)
sub_SVZ3Q_LD <- cbind(pilot = 'SVZ3Q', sub_SVZ3Q_LD)
sub_SVZ3Q_LD[sub_SVZ3Q_LD == "null"] <- NA

sub_NPF5B_SC <- cbind(pilot = 'NPF5B', sub_NPF5B_SC)
sub_NPF5B_LD <- cbind(pilot = 'NPF5B', sub_NPF5B_LD)
sub_NPF5B_LD[sub_NPF5B_LD == "null"] <- NA

sub_D4QY2_SC <- cbind(pilot = 'D4QY2', sub_D4QY2_SC)
sub_D4QY2_LD <- cbind(pilot = 'D4QY2', sub_D4QY2_LD)
sub_D4QY2_LD[sub_D4QY2_LD == "null"] <- NA

## REMOVING ROWS WITH RTS FROM TASK INSTRUCTIONS ##

#ok_IEDJQ_LI <- sub_IEDJQ_LI[-c(1, 2, 29),]
#ok_IEDJQ_PA <- sub_IEDJQ_PA[-1,]
#ok_IEDJQ_PA <- sub_IEDJQ_PA
ok_CZ61G_V <- sub_CZ61G_V[-1,]

#ok_KEAD7_LI <- sub_KEAD7_LI[-c(1, 2, 29),]
#ok_KEAD7_PA <- sub_KEAD7_PA[-1,]
#ok_KEAD7_PA <- sub_KEAD7_PA
ok_SVZ3Q_V <- sub_SVZ3Q_V[-1,]

#ok_TDIN4_LI <- sub_TDIN4_LI[-c(1, 2, 29),]
#ok_TDIN4_PA <- sub_TDIN4_PA[-1,]
#ok_TDIN4_PA <- sub_TDIN4_PA
ok_NPF5B_V <- sub_NPF5B_V[-1,]

#ok_X3FAW_LI <- sub_X3FAW_LI[-c(1, 2, 29),]
#ok_X3FAW_PA <- sub_X3FAW_PA[-1,]
#ok_X3FAW_PA <- sub_X3FAW_PA
ok_D4QY2_V <- sub_D4QY2_V[-1,]

## CHANGING PARTICIPANT RESPONSE VARIABLE FROM LOWERCASE TO UPPERCASE ##

sub_CZ61G_LD$response <- toupper(sub_CZ61G_LD$response)
sub_CZ61G_SC$response <- toupper(sub_CZ61G_SC$response)
sub_SVZ3Q_LD$response <- toupper(sub_SVZ3Q_LD$response)
sub_SVZ3Q_SC$response <- toupper(sub_SVZ3Q_SC$response)
sub_NPF5B_LD$response <- toupper(sub_NPF5B_LD$response)
sub_NPF5B_SC$response <- toupper(sub_NPF5B_SC$response)
sub_D4QY2_LD$response <- toupper(sub_D4QY2_LD$response)
sub_D4QY2_SC$response <- toupper(sub_D4QY2_SC$response)

sub_CZ61G_SC$answer[sub_CZ61G_SC$answer == "sim"] <- "S"
sub_CZ61G_SC$answer[sub_CZ61G_SC$answer == "não"] <- "N"
sub_SVZ3Q_SC$answer[sub_SVZ3Q_SC$answer == "sim"] <- "S"
sub_SVZ3Q_SC$answer[sub_SVZ3Q_SC$answer == "não"] <- "N"
sub_NPF5B_SC$answer[sub_NPF5B_SC$answer == "sim"] <- "S"
sub_NPF5B_SC$answer[sub_NPF5B_SC$answer == "não"] <- "N"
sub_D4QY2_SC$answer[sub_D4QY2_SC$answer == "sim"] <- "S"
sub_D4QY2_SC$answer[sub_D4QY2_SC$answer == "não"] <- "N"

## RENAMING DATAFRAMES ##

ok_CZ61G_LD <- sub_CZ61G_LD
ok_SVZ3Q_LD <- sub_SVZ3Q_LD
ok_NPF5B_LD <- sub_NPF5B_LD
ok_D4QY2_LD <- sub_D4QY2_LD

ok_CZ61G_SC <- sub_CZ61G_SC
ok_SVZ3Q_SC <- sub_SVZ3Q_SC
ok_NPF5B_SC <- sub_NPF5B_SC
ok_D4QY2_SC <- sub_D4QY2_SC

## REMOVING UNUSED OBJECTS ##

rm(sub_CZ61G_V)
rm(sub_CZ61G_WSC)
rm(sub_CZ61G_SSC)
rm(sub_CZ61G_SC)
rm(sub_CZ61G_LD)

rm(sub_SVZ3Q_V)
rm(sub_SVZ3Q_WSC)
rm(sub_SVZ3Q_SSC)
rm(sub_SVZ3Q_SC)
rm(sub_SVZ3Q_LD)

rm(sub_NPF5B_V)
rm(sub_NPF5B_WSC)
rm(sub_NPF5B_SSC)
rm(sub_NPF5B_SC)
rm(sub_NPF5B_LD)

rm(sub_D4QY2_V)
rm(sub_D4QY2_WSC)
rm(sub_D4QY2_SSC)
rm(sub_D4QY2_SC)
rm(sub_D4QY2_LD)

## ADDING ACCURACY VARIABLE ##

ok_CZ61G_LD$acc = ifelse(as.character(ok_CZ61G_LD$correct) == as.character(ok_CZ61G_LD$response), 1, 0)
ok_CZ61G_SC$acc = ifelse(as.character(ok_CZ61G_SC$answer) == as.character(ok_CZ61G_SC$response), 1, 0)
ok_SVZ3Q_LD$acc = ifelse(as.character(ok_SVZ3Q_LD$correct) == as.character(ok_SVZ3Q_LD$response), 1, 0)
ok_SVZ3Q_SC$acc = ifelse(as.character(ok_SVZ3Q_SC$answer) == as.character(ok_SVZ3Q_SC$response), 1, 0)
ok_NPF5B_LD$acc = ifelse(as.character(ok_NPF5B_LD$correct) == as.character(ok_NPF5B_LD$response), 1, 0)
ok_NPF5B_SC$acc = ifelse(as.character(ok_NPF5B_SC$answer) == as.character(ok_NPF5B_SC$response), 1, 0)
ok_D4QY2_LD$acc = ifelse(as.character(ok_D4QY2_LD$correct) == as.character(ok_D4QY2_LD$response), 1, 0)
ok_D4QY2_SC$acc = ifelse(as.character(ok_D4QY2_SC$answer) == as.character(ok_D4QY2_SC$response), 1, 0)

## CALCULATING VOCABULARY ACCURACY ##

sum(ok_CZ61G_V$response == "s")
(sum(ok_CZ61G_V$response == "s")*100)/130

sum(ok_SVZ3Q_V$response == "s")
(sum(ok_SVZ3Q_V$response == "s")*100)/130

sum(ok_NPF5B_V$response == "s")
(sum(ok_NPF5B_V$response == "s")*100)/130

sum(ok_D4QY2_V$response == "s")
(sum(ok_D4QY2_V$response == "s")*100)/130

## ADDING COLUMNS FOR VOCABULARY, AGE AND YEAR OF ARRIVAL IN BRAZIL ##

ok_CZ61G_SC <- cbind(ok_CZ61G_SC, Vscore = 127, Vpcent = 97.69231,  age = 46, year = 2017)
ok_SVZ3Q_SC <- cbind(ok_SVZ3Q_SC, Vscore = 126, Vpcent = 96.92308, age = 37, year = 2013)
ok_NPF5B_SC <- cbind(ok_NPF5B_SC, Vscore = 130, Vpcent = 100, age = 32, year = 2014)
ok_D4QY2_SC <- cbind(ok_D4QY2_SC, Vscore = 125, Vpcent = 96.15385, age = 28, year = 2017)

ok_CZ61G_LD <- cbind(ok_CZ61G_LD, Vscore = 127, Vpcent = 97.69231,  age = 46, year = 2017)
ok_SVZ3Q_LD <- cbind(ok_SVZ3Q_LD, Vscore = 126, Vpcent = 96.92308, age = 37, year = 2013)
ok_NPF5B_LD <- cbind(ok_NPF5B_LD, Vscore = 130, Vpcent = 100, age = 32, year = 2014)
ok_D4QY2_LD <- cbind(ok_D4QY2_LD, Vscore = 125, Vpcent = 96.15385, age = 28, year = 2017)

## RBINDING DATAFRAMES TOGETHER FOR ALL 4 PARTICIPANTS ##

study2pilotSC <- rbind(ok_CZ61G_SC, ok_SVZ3Q_SC, ok_NPF5B_SC, ok_D4QY2_SC)
study2pilotLD <- rbind(ok_CZ61G_LD, ok_SVZ3Q_LD, ok_NPF5B_LD, ok_D4QY2_LD)

## CALCULATING RT MEANS AND STANDARD DEVIATIONS ##

study2pilotSC$rt <- as.numeric(study2pilotSC$rt)
study2pilotLD$rt <- as.numeric(study2pilotLD$rt)

study2pilotSC$meanrt = ave(study2pilotSC$rt, study2pilotSC$pilot, FUN=function(x) mean(x, na.rm=TRUE))
study2pilotSC$sdrt = ave(study2pilotSC$rt, study2pilotSC$pilot, FUN=function(x) sd(x, na.rm=TRUE))

study2pilotLD$meanrt = ave(study2pilotLD$rt, study2pilotLD$pilot, FUN=function(x) mean(x, na.rm=TRUE))
study2pilotLD$sdrt = ave(study2pilotLD$rt, study2pilotLD$pilot, FUN=function(x) sd(x, na.rm=TRUE))

study2pilotSC$meanrt <- as.numeric(study2pilotSC$meanrt)
study2pilotSC$sdrt <- as.numeric(study2pilotSC$sdrt)

study2pilotLD$meanrt <- as.numeric(study2pilotLD$meanrt)
study2pilotLD$sdrt <- as.numeric(study2pilotLD$sdrt)

## TRIMMING RT VALUES +2,5SD OR -2,5SD FROM PARTICIPANT MEAN ##

study2pilotSC$rt_clean <- ifelse(study2pilotSC$rt > (study2pilotSC$meanrt + 2.5*study2pilotSC$sdrt) | study2pilotSC$rt < (study2pilotSC$meanrt - 2.5*study2pilotSC$sdrt), NA, study2pilotSC$rt) 
study2pilotLD$rt_clean <- ifelse(study2pilotLD$rt > (study2pilotLD$meanrt + 2.5*study2pilotLD$sdrt) | study2pilotLD$rt < (study2pilotLD$meanrt - 2.5*study2pilotLD$sdrt), NA, study2pilotLD$rt) 


