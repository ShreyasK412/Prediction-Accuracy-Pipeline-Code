library(lme4)
library(lmerTest)
library(emmeans)

data_files = c("lena_with_predictability_unbalanced.csv","lena_with_predictability_balanced_speech_register.csv","lena_with_predictability_balanced_gender.csv")

sink(file="PredictabilityReplicationAttemptOutput.txt")

for (data_file in data_files){
  
  full_data = read.csv(data_file)
  
  full_data = subset(full_data, label != "JUNK")
  full_data = subset(full_data, adu_gender != "")
  
  # Plot the distribution of predictability scores
  hist(full_data$predictability)
  
  full_model = lmer(scale(predictability) ~ (1|ID) + label + adu_gender + chi_gender + scale(AgeMonths), data = full_data)
  #full_model = lmer(predictability ~ (1|ID) + register + adu_gender + chi_gender, data = full_data)
  print(summary(full_model))
  
  # # Match up data with master.txt labels
  # prag_meta_data = read.table("master.txt",header = TRUE)
  # colnames(prag_meta_data)[1] = "seg_id"
  # prag_data = merge(full_data,prag_meta_data,by="seg_id")
  # 
  # # Subset data to look just at IDS
  # ids_prag_data = prag_data[which(prag_data$register == "IDS"),]
  # #ids_prag_model = lmer(predictability ~ convo + sing + inform + read + imperative +question + comfort + (1|ID.x) + (1|coder), data = ids_prag_data) # results in a "boundary (singular) fit" error
  # ids_prag_model = lmer(scale(predictability) ~ adu_gender.x*convo + adu_gender.x*sing + adu_gender.x*inform + adu_gender.x*read + adu_gender.x*imperative + adu_gender.x*question + adu_gender.x*comfort + (1|ID.x), data = ids_prag_data)
  # summary(ids_prag_model)
  # confint(ids_prag_model)
  # # It might be nice to add an analysis of the pairwise comparisons of contexts
  # 
  # # Subset data to look just at ADS
  # ads_prag_data = prag_data[which(prag_data$register == "ADS"),]
  # ads_prag_model = lmer(scale(predictability) ~ adu_gender.x*convo + adu_gender.x*sing + adu_gender.x*inform + adu_gender.x*read + adu_gender.x*imperative + adu_gender.x*question + adu_gender.x*comfort + (1|ID.x), data = ads_prag_data)
  # summary(ads_prag_model)
  # confint(ads_prag_model)
  # 
  # # Subset the data to look just at convo and assess predictability as a function of register and adult gender for convo utterances
  # convo_prag_data = prag_data[which(prag_data$convo == 1),]
  # convo_prag_model = lmer(scale(predictability) ~ adu_gender.x*register + (1|ID.x), data = convo_prag_data)
  # summary(convo_prag_model)
  # confint(convo_prag_model)
  # 
  # # Subset the data to look just at inform and assess predictability as a function of register and adult gender for inform utterances
  # inform_prag_data = prag_data[which(prag_data$inform == 1),]
  # inform_prag_model = lmer(scale(predictability) ~ adu_gender.x*register + (1|ID.x), data = inform_prag_data)
  # summary(inform_prag_model)
  # confint(inform_prag_model)
  # 
  # # Subset the data to look just at imperative and assess predictability as a function of register and adult gender for imperative utterances
  # imperative_prag_data = prag_data[which(prag_data$imperative == 1),]
  # imperative_prag_model = lmer(scale(predictability) ~ adu_gender.x*register + (1|ID.x), data = imperative_prag_data)
  # summary(imperative_prag_model)
  # confint(imperative_prag_model)
  # 
  # # Subset the data to look just at question and assess predictability as a function of register and adult gender for question utterances
  # question_prag_data = prag_data[which(prag_data$question == 1),]
  # question_prag_model = lmer(scale(predictability) ~ adu_gender.x*register + (1|ID.x), data = question_prag_data)
  # summary(question_prag_model)
  # confint(question_prag_model)
  # 
  # # Subset the data to look just at inform IDS contexts and look for adu_gender*chi_gender interaction, since that context had a significant interaction for pitch variability in Emily Neer's study (there are not enough singing contexts to do this for singing)
  # inform_ids_prag_data = prag_data[which((prag_data$inform == 1) & (prag_data$register == "IDS")),]
  # inform_chigender_model = lmer(scale(predictability) ~ adu_gender.x*chi_gender.x + (1|ID.x), data = inform_ids_prag_data)
  # summary(inform_chigender_model)
  # confint(inform_chigender_model)
}

sink()
