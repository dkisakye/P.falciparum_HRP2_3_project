
# Objective
# 1. Analyse  ddPCR data for varATS positive samples

## Clear environment

rm(list =ls (all = TRUE))

setwd("~/Documents/K23_LLINEUP2_12month_qPCR/hrp2_3_investigation/P.falciparum_HRP2_3_project-main/")

## Load libraries
library(readr)
#library(dplyr)
library(tidyverse)
library(readxl)


## Import ddpcr data

ddpcr <- read_csv("data_in/All_ddPCR_raw_data.csv")

#drops 3 rows
ddpcr <- ddpcr %>% 
  transmute(Well, `Sample Name` = Sample , Target = Target,  Concentration = as.double(`Conc [copies/µL]`), Valid_Partitions = as.double(`Partitions (valid)`), Positive_partitions = as.double(`Partitions (positive)`), Negative_partitions = as.double(`Partitions (negative)`)) %>% 
  filter(Valid_Partitions >= 1500)

#sample dropped is a 3D7 10k control
 #ddpcr_check <- ddpcr %>% 
  # transmute(Well, `Sample Name` = Sample , Target = Target,  Concentration = as.double(`Conc [copies/µL]`), Valid_Partitions = as.double(`Partitions (valid)`), Positive_partitions = as.double(`Partitions (positive)`), Negative_partitions = as.double(`Partitions (negative)`)) %>% 
   #filter(Valid_Partitions < 1500)

glimpse(ddpcr)

## Remove negative controls
ddpcr_filtered <- ddpcr[!grepl("NTC", ddpcr$`Sample Name`), ]


length(unique(ddpcr_filtered$`Sample Name`)) # 102 samples

## Import the qpcr data for the field samples

qpcr_data <- read_csv("data_in/all_LN2_qpcr.csv")

glimpse(qpcr_data)

qpcr_data <- qpcr_data %>% 
  transmute(`Sample Name` = as.character(`Sample Name`),  `Study Subject`, qpcr)


## Merge qpcr data with ddPCR data
ddpcr_with_parasite_density <- ddpcr_filtered %>% 
  left_join(qpcr_data, join_by(`Sample Name`)) 

## Import Sampledb to identify the names for the controls

sample_db_controls <- read_csv("data_in/data-2024-02-20_controls.csv")

sample_db_controls_sub <- sample_db_controls %>% 
  transmute(`Sample Name`= as.character(Barcode), `Study Subject`)

## Merge Sampledb with ddpcr data frame to get the names of the controls
ddpcr_with_parasite_density_and_controls <- ddpcr_with_parasite_density %>% 
  left_join(sample_db_controls_sub, join_by(`Sample Name`))

ddpcr_with_parasite_density_and_controls <- ddpcr_with_parasite_density_and_controls %>% 
 mutate( `Study Subject` = ifelse(!is.na(`Study Subject.x`), `Study Subject.x`, `Study Subject.y`))

ddpcr_with_parasite_density_and_controls <-ddpcr_with_parasite_density_and_controls %>% 
  select(-`Study Subject.x`, -`Study Subject.y`)

any(is.na(ddpcr_with_parasite_density_and_controls$`Study Subject`)) # Missing study subject id's for controls

# Import qpcr data for controls used for ddPCR.

qpcr_data_controls <- read_csv("data_in/qpcr_database_for_ddPCR_controls.csv") %>% 
  transmute(`Sample Name` = as.character(`Sample Name`), Quantity )


## Merge qpcr data for all the controls into the ddPCR dataframe with field samples

ddpcr_with_parasite_density_and_controls_merged <- ddpcr_with_parasite_density_and_controls %>% 
  left_join(qpcr_data_controls, join_by(`Sample Name`))

# Merge in control parasite densities

ddpcr_with_parasite_density_and_controls_merged <-ddpcr_with_parasite_density_and_controls_merged %>% 
  mutate(qpcr = ifelse(!is.na(qpcr), qpcr, Quantity))

# Now remove the Quantity column
ddpcr_with_parasite_density_and_controls_merged <-  ddpcr_with_parasite_density_and_controls_merged %>% 
  select(-Quantity)
ddpcr_with_parasite_density_and_controls_merged$qpcr <-round(ddpcr_with_parasite_density_and_controls_merged$qpcr, 3)

## Some of these samples were from IMMRSE. let me import the qpcr data for IMMRSE_U and identify them

Immrse_qpcr_data <-read_csv("data_in/ImmrseMergedqpcr.csv")

Immrse_qpcr_data_sub <- Immrse_qpcr_data %>% 
  transmute(`Sample Name` = as.character(SampleName), `Study Subject` = Study_Subject, Quantity = round(Quantity, 3))

# Merge ddpcr data frame with immrse qpcr data and subjecty id

ddpcr_with_parasite_density_and_controls_merged <-ddpcr_with_parasite_density_and_controls_merged %>% 
  left_join(Immrse_qpcr_data_sub, join_by(`Sample Name`))

# Collapse study subject and parasite density
ddpcr_with_parasite_density_and_controls_merged <- ddpcr_with_parasite_density_and_controls_merged %>% 
  mutate(qpcr = ifelse(!is.na(qpcr), qpcr, Quantity),
         `Study Subject` = ifelse(!is.na(`Study Subject.x`), `Study Subject.x`, `Study Subject.y`)) 

glimpse(ddpcr_with_parasite_density_and_controls_merged)

ddpcr_with_parasite_density_and_controls_merged <- ddpcr_with_parasite_density_and_controls_merged %>% 
  select(1:8, `Study Subject`)


any(is.na(ddpcr_with_parasite_density_and_controls_merged$`Study Subject`)) # FALSE, no missing id's.

table(ddpcr_with_parasite_density_and_controls_merged$qpcr, useNA = "always")

ctrls <- ddpcr_with_parasite_density_and_controls_merged %>% 
  filter(grepl("3D7", `Study Subject`) | grepl("Dd2", `Study Subject`) | grepl("3d7", `Study Subject`))

# Save this database -- All controls present

#write_csv(ddpcr_with_parasite_density_and_controls_merged, "../../data_out/LLNEUP2_and_IMMRSE_ddpcr_samples_with_qpcr_data.csv")


summary(ddpcr_with_parasite_density_and_controls_merged$qpcr)


#### Make some plots ##########

ggplot(ddpcr_with_parasite_density_and_controls_merged, aes(Positive_partitions, qpcr)) +
  geom_point() # need to remove controls; skewing the data 

ddpcr_with_parasite_density_and_no_controls <- ddpcr_with_parasite_density_and_controls_merged[!grepl(ddpcr_with_parasite_density_and_controls_merged$`Study Subject`, pattern = "3D7|Dd2", ignore.case = TRUE), ]

ggplot(ddpcr_with_parasite_density_and_no_controls,
       aes(Positive_partitions, qpcr )) +
       geom_point(alpha= 0.5) 


# Group
ddpcr_grouped <- ddpcr_with_parasite_density_and_controls_merged %>% 
  group_by(`Sample Name`, Target) %>% 
  mutate(Replicate = row_number(`Sample Name`))  %>% 
  select(-Well, -Valid_Partitions)

## Take look at control data
ddpcr_controls <- ddpcr_grouped[grepl(ddpcr_grouped$`Study Subject`, pattern= "Dd2|3D7", ignore.case = TRUE),  ]

ddpcr_controls_wide <- ddpcr_controls %>% 
  mutate(Target_rep = paste0(Target,"_rep", Replicate)) %>% 
  pivot_wider(id_cols = c(`Sample Name`, `Study Subject`, qpcr), names_from= Target_rep, values_from = c(Concentration, Positive_partitions)) %>% 
  mutate(tRNA_pass = case_when(
    Positive_partitions_tRNA_rep1 >= 5 & Positive_partitions_tRNA_rep2 >= 5 ~ 1, 
    Positive_partitions_tRNA_rep1 >= 5 & Positive_partitions_tRNA_rep2 >= 2 ~ 1,
    Positive_partitions_tRNA_rep1 >= 2 & Positive_partitions_tRNA_rep2 >= 5 ~ 1,
    # Positive_partitions_tRNA_rep1 >= 5 & is.na(Positive_partitions_tRNA_rep2) &  qpcr >= 1000 ~ 1,
    Positive_partitions_tRNA_rep1 >= 5 & is.na(Positive_partitions_tRNA_rep2) ~ 1, # samples with parasite density > 1000 have only one replicate
    TRUE ~ 0 ),
    Hrp2_pass = case_when(
      Positive_partitions_hrp2_exon2_rep1 >= 2  & Positive_partitions_hrp2_exon2_rep2 >= 2 ~ 1,
      Positive_partitions_hrp2_exon2_rep1 >= 2 & is.na(Positive_partitions_hrp2_exon2_rep2) ~ 1, 
      TRUE ~ 0),
    Hrp3_pass = case_when(
      Positive_partitions_hrp3_rep1 >= 2 & Positive_partitions_hrp3_rep2 >= 2 ~ 1,
      Positive_partitions_hrp3_rep1 >= 2 & is.na(Positive_partitions_hrp3_rep2)  ~ 1,
      TRUE ~ 0),
    Qc_pass = case_when(
      tRNA_pass == 1 & Hrp2_pass == 1  & Hrp3_pass == 1 ~ "pass",
      tRNA_pass == 0 & Hrp2_pass == 1  & Hrp3_pass == 1 ~ "fail_trna",
      tRNA_pass == 0 & Hrp2_pass == 0  & Hrp3_pass == 1 ~ "fail_trna_and_hrp2",
      tRNA_pass == 0 & Hrp2_pass == 1  & Hrp3_pass == 0 ~ "fail_trna_and_hrp3",
      tRNA_pass == 0 & Hrp2_pass == 0  & Hrp3_pass == 0 ~ "fail_trna_and_hrp2_and_hrp3",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass == 1 ~ "hrp2 deletion",
      tRNA_pass == 1 & Hrp2_pass == 1  & Hrp3_pass ==  0 ~ "hrp3 deletion",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass ==  0 ~ "hrp2 and hrp3 deleted"
    ))

# All controls pass QC 
# write_csv(ddpcr_controls_wide, "../../data_out/ddPCR_run_2_controls_26022024.csv")


## Filter out IMMRSE samples and sample that was not part of the LLNEUP 12 samples but ran accidentally


ddpcr_grouped_sub <-ddpcr_grouped[!grepl(ddpcr_grouped$`Study Subject`, pattern = "^IM|^W780"), ] 


# Pivot wide and filter out the controls
ddpcr_wide<- ddpcr_grouped_sub %>% 
  mutate(Target_rep = paste0(Target,"_rep", Replicate)) %>% 
  pivot_wider(id_cols = c(`Sample Name`, `Study Subject`, qpcr), names_from = Target_rep, values_from = c("Concentration", "Positive_partitions") ) 

ddpcr_wide_2 <-ddpcr_wide[!grepl(ddpcr_wide$`Study Subject`, pattern= "Dd2|3D7", ignore.case = TRUE),  ] # filter out controls


# Criteria to call a gene present:
# For samples with parasite density < 1000. They were run in duplicate. 
#1. If replicate 1 and replicate 2 for each of the markers pass the threshold to call a gene/marker present(>=5 positive partitions for trna and >=2 positive partitions for hrp2 and/or hrp3) then gene is present
#2. If no. of positive partitions for trna in replicate 1 >=5, and no. of positive partitions trna in replicate 2 is >=2,  and no. of positive partitions for hrp2 and hrp3 >=2 in replicates 1 and 2, the gene is present 

#JB comment -- what do we do with a sample like BW015? 
# parasite density is below 10; I don't think we should pass it because most of those with densities < 10 have failed qc thresholds


ddpcr_wide_2<- ddpcr_wide_2%>% 
  mutate(tRNA_pass = case_when(
    Positive_partitions_tRNA_rep1 >= 5 & Positive_partitions_tRNA_rep2 >= 5 ~ 1, 
    Positive_partitions_tRNA_rep1 >= 5 & Positive_partitions_tRNA_rep2 >= 2 & qpcr >= 10 ~ 1,
    Positive_partitions_tRNA_rep1 >= 2 & Positive_partitions_tRNA_rep2 >= 5 & qpcr >= 10 ~ 1,
    Positive_partitions_tRNA_rep1 >= 5 & is.na(Positive_partitions_tRNA_rep2) ~ 1, # samples with parasite density >= 1000 have only one replicate
    TRUE ~ 0 ),
    Hrp2_pass = case_when(
      Positive_partitions_hrp2_exon2_rep1 >= 2  & Positive_partitions_hrp2_exon2_rep2 >= 2 ~ 1,
      Positive_partitions_hrp2_exon2_rep1 >= 2 & is.na(Positive_partitions_hrp2_exon2_rep2) ~ 1 , # samples with parasite density >= 1000 have only one replicate
      TRUE ~ 0),
    Hrp3_pass = case_when(
      Positive_partitions_hrp3_rep1 >= 2 & Positive_partitions_hrp3_rep2 >= 2 ~ 1,
      Positive_partitions_hrp3_rep1 >= 2 & is.na(Positive_partitions_hrp3_rep2)   ~ 1, # samples with parasite density >= 1000 have only one replicate
      TRUE ~ 0),
    Qc_pass = case_when(
      tRNA_pass == 1 & Hrp2_pass == 1  & Hrp3_pass == 1 ~ "pass",
      tRNA_pass == 0 & Hrp2_pass == 1  & Hrp3_pass == 1 ~ "fail_trna",
      tRNA_pass == 0 & Hrp2_pass == 0  & Hrp3_pass == 1 ~ "fail_trna_and_hrp2",
      tRNA_pass == 0 & Hrp2_pass == 1  & Hrp3_pass == 0 ~ "fail_trna_and_hrp3",
      tRNA_pass == 0 & Hrp2_pass == 0  & Hrp3_pass == 0 ~ "fail_trna_and_hrp2_and_hrp3",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass == 1  & qpcr >= 10 ~ "hrp2 deletion",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass == 1  & qpcr < 10 ~ "fail_hrp2",
      tRNA_pass == 1 & Hrp2_pass == 1  & Hrp3_pass == 0 & qpcr >= 10 ~ "hrp3 deletion",
      tRNA_pass == 1 & Hrp2_pass == 1  & Hrp3_pass == 0  & qpcr < 10 ~ "fail_hrp3",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass == 0 & qpcr >= 10 ~ "hrp2 and hrp3 deleted",
      tRNA_pass == 1 & Hrp2_pass == 0  & Hrp3_pass == 0 & qpcr < 10 ~ "fail_hrp2_and_hrp3"
    ))


fail <- ddpcr_wide_2[grepl(ddpcr_wide_2$Qc_pass, pattern="^fail"), ]

summary(fail$qpcr) # 


ddpcr_wide_2 <- ddpcr_wide_2 %>% 
  mutate(qpcr_cat = floor(log10(qpcr)))

#number of samples passing QC by qPCR category  
table(ddpcr_wide_2$qpcr_cat, ddpcr_wide_2$tRNA_pass)

#mean qPCR by tRNA pass 
summarize <- ddpcr_wide_2 %>% group_by(tRNA_pass) %>% summarize(mean = mean(qpcr), median = median(qpcr))


# Save
#write_csv(ddpcr_wide_2, "../../data_out/ddPCR_all_results.csv")


