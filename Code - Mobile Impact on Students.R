install.packages('dplyr')
install.packages('ggplot2')
install.packages('tidyverse')
install.packages('plotly')
install.packages('treemap')

#CALL THE LIBRARIES NEEDED
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)
library(treemap)
#IMPORT CSV FILE 
setwd("C:/Users/Stephanie/Desktop/Portfolio/R Projects/Student Health")
Mobile_impact<-read.csv("Impact of Mobile Phone on Students Health.csv")
Mobile_impact

#EXPLORING THE DATA
glimpse(Mobile_impact)
View(Mobile_impact)
summary(Mobile_impact)
names(Mobile_impact)
head(Mobile_impact)
unique(Mobile_impact$Mobile.Phone)
unique(Mobile_impact$Mobile.Operating.System)
unique(Mobile_impact$Mobile.phone.use.for.education)
unique(Mobile_impact$Mobile.phone.activities)
unique(Mobile_impact$Helpful.for.studying)
unique(Mobile_impact$Educational.Apps)
unique(Mobile_impact$Daily.usages)
unique(Mobile_impact$Performance.impact)
unique(Mobile_impact$Usage.distraction)
unique(Mobile_impact$Attention.span)
unique(Mobile_impact$Useful.features)
unique(Mobile_impact$Health.Risks)
unique(Mobile_impact$Beneficial.subject)
unique(Mobile_impact$Usage.symptoms)
unique(Mobile_impact$Symptom.frequency)
unique(Mobile_impact$Health.precautions)
unique(Mobile_impact$Health.rating)

#SELECTING MY VARIBLES FOR THE STUDY
Mobile_impact<-Mobile_impact %>% 
  select(-Names)
View(Mobile_impact)

#DATA CLEANING 
#1. Missing Values
is.na(Mobile_impact)
sum(is.na(Mobile_impact))# this table is informing us that there are no missing values

#However there are some blanks in the table held by the string " "
Mobile_impact[Mobile_impact == ""] <- NA # Replace empty strings with NA
is.na(Mobile_impact)
sum(is.na(Mobile_impact))#This brings back a total of 23 missing values

#Now we need to view the columns with the missing values
na_counts <- colSums(is.na(Mobile_impact))
View(na_counts)
#since the missing values cannot be replaced since they are responses, they were removed
Mobile_impact<-na.omit(Mobile_impact)
sum(is.na(Mobile_impact)) 
glimpse(Mobile_impact)

#2. Duplicated Values
duplicated(Mobile_impact) # no duplicates

#####DESCRIPTIVE ANALYSIS######

# RESPONDANT PROFILE (Who are the students?)
#Age
Mobile_impact %>% 
  count(Age) %>% 
  ggplot(aes(x = Age, y = n)) +
  geom_col(fill = "steelblue", color = "black") + # Use geom_col for pre-counted data
  labs(x = "Age Group", y = "Count", title = "Count of Individuals by Age") +
  theme_minimal()


#MOBILE PHONE USAGE OVERVIEW
#Mobile Phone Activities
view(Mobile_impact)
glimpse(Mobile_impact)

phone_activites<-Mobile_impact %>% 
  count(Mobile.phone.activities, name = "total_phone_activites") %>%
  mutate(average_freq = mean(total_phone_activites)) %>% 
  view()

#Mobile Phone Use for Education
phoneuse_education<-Mobile_impact %>% 
  count(Mobile.phone.use.for.education) %>% 
  mutate(percentage = n/sum(n)*100)
  
ggplot(phoneuse_education, aes(x = "", y = Mobile.phone.use.for.education, fill = Mobile.phone.use.for.education)) +
geom_bar(width = 1, stat = "identity", color = "white") + 
coord_polar("y", start = 0) + 
theme_void() + 
geom_text(aes(label = ""), position = position_stack(vjust = 0.5), color = "white") + # Adds percentage labels
labs(title = "Phone Use for Education Distribution") +
theme(plot.title = element_text(hjust = 0.5))

# Daily Usage
usage_treemap<-Mobile_impact %>% 
  count(Daily.usages, name = 'count_daily_usage') %>% 
  mutate(averge_freq_usage = mean(count_daily_usage))

treemap(
dtf = usage_treemap,                    # The data frame
index = c("Daily.usages"),              # Column for the categories/labels
vSize = "count_daily_usage",            # Column for the size of the rectangles
vColor = "averge_freq_usage",           # Optional: Column for the color of the rectangles (can use the average frequency for a uniform color based on the mean)
type = "value",                         # Type of treemap (e.g., "value", "index", "categorical")
title = "Treemap of Mobile Impact Daily Usages"
  )

#EDUCATIONAL USE SUMMARY
#Helpful for studying 
Mobile_impact %>% 
  count(Helpful.for.studying) %>% 
  mutate(percentage = n/sum(n)*100) 

Mobile_impact %>% 
  count(Helpful.for.studying) %>% 
  ggplot(aes(x = Helpful.for.studying, y = n)) +
  geom_col(fill = "gold", color = "black") + # Use geom_col for pre-counted data
  labs(x = "Helpful study", y = "Count", title = "Count of Helpful for study") +
  theme_minimal()

#Educational App
Mobile_impact %>% 
  count(Educational.Apps) %>% 
  mutate(percentage = n/sum(n)*100) %>% 
  mutate(average_apps = mean(n))

#Useful features
features<-Mobile_impact %>% 
  count(Useful.features)

ggplot(features, aes(x = "", y = Useful.features, fill = Useful.features)) +
geom_bar(width = 1, stat = "identity", color = "white") + 
coord_polar("y", start = 0) + 
theme_void() + 
geom_text(aes(label = ""), position = position_stack(vjust = 0.5), color = "white") + # Adds percentage labels
labs(title = "Feature Distribution") +
theme(plot.title = element_text(hjust = 0.5))

#Beneficial subject
Mobile_impact %>% 
  count(Beneficial.subject)

#HEALTH STATUS SUMMARY
#Health Risks
healthrisks<-Mobile_impact %>% 
  count(Health.Risks, name ="count_healthrisks") %>% 
  mutate(averge_freq_risks = mean(count_healthrisks))

treemap(
  dtf = healthrisks,                    
  index = c("Health.Risks"),              
  vSize = "count_healthrisks",            
  vColor = "averge_freq_risks",           
  type = "value",                         
  title = "Treemap of Student Health Status")

#Symptom frequency
Mobile_impact %>% 
  count(Symptom.frequency)

#Helth precautions
Mobile_impact %>% 
  count( Health.precautions) %>% 
  mutate(percentage = n/sum(n)*100) %>% 
  ggplot(aes(x = Health.precautions, y = n)) +
  geom_col(fill = "red", color = "black") +
  labs(x = "Health precautions", y = "Count", title = "Count of Health precautions") +
  theme_minimal()

#Health rating
Mobile_impact %>% 
  count(Health.rating) %>% 
  mutate(average_rate = mean(n))

#ACADEMIC & ATTENTION SUMMARY
#Performance Impact
Mobile_impact %>% 
   count(Performance.impact) %>% 
   mutate(percentage = n/sum(n)*100)

#Usage distraction
distraction<-Mobile_impact %>% 
  group_by(Usage.distraction) %>% 
  summarise(count=n()) %>% 
  mutate(percentage= count/sum(count)*100)

ggplot(distraction, aes(x = "", y = Usage.distraction, fill = Usage.distraction)) +
  geom_bar(width = 1, stat = "identity", color = "white") + 
  coord_polar("y", start = 0) + 
  theme_void() + 
  geom_text(aes(label = ""), position = position_stack(vjust = 0.5), color = "white") + # Adds percentage labels
  labs(title = "Distraction Distribution") +
  theme(plot.title = element_text(hjust = 0.5))

#Attention span
Mobile_impact %>% 
   count(Attention.span) %>% 
   mutate(percentage= n/sum(n)*100)

############### EXPLORATORY DATA ANALYSIS ############
#USUAGE INTENSITY VRS OUTCOME

#Daily usages × Health rating
glimpse(Mobile_impact)
ggplot(Mobile_impact, aes(x = Daily.usages, y = Health.rating, color = Health.rating)) +
  geom_point() +
  labs(x = "Daily usages", y = "Health rating", title = "Scatter Plot of Daily Usage by Health rating") +
  theme_minimal()

#Daily usages × Symptom frequency
usage.frequency<-Mobile_impact %>%
  count(Daily.usages,Symptom.frequency) %>% 
  ggplot(aes(x=Daily.usages, y = n,  fill = Symptom.frequency))+
  geom_bar(position='dodge', stat = 'identity')+
  labs(
    title = 'Daily Usage by Symptom frequency ',
    x='Daily Usage',
    y='Count',
    fill = 'Symptom.frequency' 
  )+
  theme_minimal()

# Convert the ggplot object to an interactive plotly object
p.usage.frequency<- ggplotly(usage.frequency)

# Display the interactive plot
p.usage.frequency

#Daily usages × Usage distraction
glimpse(Mobile_impact)
usage.distraction<-ggplot(Mobile_impact, aes(x = Daily.usages, y = Usage.distraction, color = Usage.distraction)) +
  geom_point() +
  labs(x = "Daily usages", y = "Usage distraction", title = "Scatter Plot of Daily Usage by Usage distraction") +
  theme_minimal()

#Convert the ggplot object to an interactive plotly object
interactive.plot_distraction<- ggplotly(usage.distraction)

# Display the interactive plot
interactive.plot_distraction

#Daily usages × Attention span
glimpse(Mobile_impact)

usuage.attention.span<-Mobile_impact %>%
  count(Daily.usages,Attention.span) %>% 
  ggplot(aes(x=Daily.usages, y = n,  fill =Attention.span ))+
  geom_bar(position='dodge', stat = 'identity')+
  labs(
    title = 'Daily Usage by Attention span',
    x='Daily Usage',
    y='Count',
    fill = 'Attention span'
  )+
  theme_minimal()

#Convert the ggplot object to an interactive plotly object
interactive.plot_attentionspan<- ggplotly(usuage.attention.span)

# Display the interactive plot
interactive.plot_attentionspan

#EDUCATIONAL USE VS ACADEMIC PERFORMANCE
#Mobile phone use for education × Performance impact
education.performanceimpact<-ggplot(Mobile_impact, aes(x = Mobile.phone.use.for.education, y = Performance.impact, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "green", size = 3) +  
  labs(x = "Mobile phone for education",
       y = "Performance impact",
       title = "Mobile use for education by performance impact") +
  theme_minimal()

#Convert the ggplot object to an interactive plotly object
interactive.plot_performanceimpact<- ggplotly(education.performanceimpact)

# Display the interactive plot
interactive.plot_performanceimpact


#Helpful for studying × Performance impact #proportional stacked bar
study_performanceimpact<-ggplot(Mobile_impact, aes(x = Helpful.for.studying, fill = Performance.impact)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) + # Format y-axis as percentages
  labs(
    title = "Proportional Impact on Performance by Helpfulness for Studying",
    x = "#Helpful for Studying",
    y = "Proportion",
    fill = "Performance Impact"
  ) +
  theme_minimal()
#Convert the ggplot object to an interactive plotly object
interactive.plot_helpfulforstudy<- ggplotly(study_performanceimpact)

# Display the interactive plot
interactive.plot_helpfulforstudy

#Educational Apps × Attention span
glimpse(Mobile_impact)
span.educationalapp<-Mobile_impact %>%
  count(Educational.Apps,Attention.span) %>% 
  ggplot(aes(x=Educational.Apps, y = n,  fill =Attention.span ))+
  geom_bar(position='dodge', stat = 'identity')+
  labs(
    title = 'Educational Apps by Attention span',
    x='Educational Apps',
    y='Count',
    fill = 'Attention span'
  )+
  theme_minimal()

#Convert the ggplot object to an interactive plotly object
interactive.plot_span.educationalapp<- ggplotly(span.educationalapp)

# Display the interactive plot
interactive.plot_span.educationalapp

#DISTRACTION &ATTENTION DYNAMICS
#Usage distraction × Performance impact #Mosic plot
#Create a contingency table 
contingency_table<-table(Mobile_impact$Usage.distraction,
                         Mobile_impact$Performance.impact)

#Generate the mosaic plot
dev.off()
mosaicplot(contingency_table,
           main = "Mosaic Plot of Usage Distraction vs. Performance Impact",
           xlab = "Usage Distraction",
           ylab = "Performance Impact",
           color = TRUE, # Use colors to distinguish categories
           shade = TRUE) # Shade based on standardized residuals (deviation from independence)

#Usage distraction × Attention span
distraction_attentionspan<-ggplot(Mobile_impact, aes(x = Usage.distraction, fill = Attention.span)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) + # Format y-axis as percentages
  labs(
    title = "Proportional Impact on Usage distraction by Attention Span",
    x = "Usage distraction",
    y = "Proportion",
    fill = "Attention span"
  ) +
  theme_minimal()
#Convert the ggplot object to an interactive plotly object
interactive.plot.distraction_attentionspan<- ggplotly(distraction_attentionspan)

# Display the interactive plot
interactive.plot.distraction_attentionspan

#HEALTH RISKS & PREVENTIVE BEHAVIOUR
#•	Daily usages × Health risks
glimpse(Mobile_impact)
usage_healthrisks<-
  ggplot(Mobile_impact, aes(x = Daily.usages, y = Daily.usages, color = Health.Risks)) +
  geom_point() +
  labs(x = "Daily usages", y = "Health Risks", title = "Scatter Plot of Daily Usage by Health Risks") +
  theme_minimal()
interactive_healthrisks<-ggplotly(usage_healthrisks)
interactive_healthrisks

#•	Health precautions × Symptom frequency
precautions.frequency<-Mobile_impact %>%
  count(Health.precautions,Symptom.frequency) %>% 
  ggplot(aes(x=Health.precautions, y = n,  fill = Symptom.frequency))+
  geom_bar(position='dodge', stat = 'identity')+
  labs(
    title = 'Health precautions by Symptom frequency ',
    x='Health precautions',
    y='Count',
    fill = 'Symptom.frequency' 
  )+
  theme_minimal()
interactive_precautionsfreq<-ggplotly(precautions.frequency)
interactive_precautionsfreq

#•	Health precautions × Health rating
#Ensure both variables are treated as factors
unique(Mobile_impact$Health.rating)
Mobile_impact$Health.precautions<- factor(Mobile_impact$Health.precautions)
Mobile_impact$Health.rating <- factor(Mobile_impact$Health.rating, 
                                      levels = c("Excellent", "Excellent;Good", "Excellent;Good;Fair;Poor",
                                                 "Good", "Good;Fair","Fair","Poor" )) # Optional: Order the rating levels

# --- Create the Stacked Bar Chart ---
precaution_ratings<-ggplot(Mobile_impact, aes(x = Health.precautions, fill = Health.rating)) +
  geom_bar(position = "stack") + # 'position = "stack"' is the default, but explicitly stated for clarity
  labs(
    title = "Stacked Bar Chart of Health Rating by Health Precautions",
    x = "Health Precautions Level",
    y = "Count",
    fill = "Health Rating"
  ) +
  theme_minimal() # Apply a clean theme
interactive_precautionsrate<-ggplotly(precaution_ratings)
interactive_precautionsrate

#DEMOGRAPHIC DIFFEENCE
unique(Mobile_impact$Gender)
class(Mobile_impact$Gender)
glimpse(Mobile_impact)

#Gender and Mobile Operating System
Mobile_impact %>% 
  count(Gender,Mobile.Operating.System) %>% 
  mutate(percentage = (n/sum(n))*100) 

Mobile_impact %>% 
  count(Age,Mobile.Operating.System)%>% 
  ggplot(aes(x = factor(Age), y = n, fill = Mobile.Operating.System)) +
  geom_bar(position = "dodge", stat = "identity") +
  labs(
    title = "Mobile Operating System Usage by Age Group (Grouped)",
    x = "Age Group",
    y = "Count",
    fill = "Operating System"
  ) +
  theme_minimal()


Mobile_impact$Gender<-factor(Mobile_impact$Gender,
                             levels = c('Male', 'Female'))


#•	Gender × Health risks
gender_healthrisks<-Mobile_impact %>%
  count(Gender, Health.Risks) %>% 
  ggplot(aes(x=Gender, y = n,  fill = Health.Risks))+
  geom_bar(position='dodge', stat = 'identity')+
  labs(
    title = 'Gender by Health Risks ',
    x='Gender',
    y='Count',
    fill = 'Health Risks' 
  )+
  theme_minimal()

interactive_gender.healthrisks<-ggplotly(gender_healthrisks)
interactive_gender.healthrisks
#•	Gender × Daily usages
unique(Mobile_impact$Daily.usages)

gender.dailyusage<-ggplot(Mobile_impact, aes(x = Gender, fill = Daily.usages)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) + # Format y-axis as percentages
  labs(
    title = "Proportional Impact on Gender by Daily usuage",
    x = "Gender",
    y = "Proportion",
    fill = "Daily usage"
  ) +
  theme_minimal()
interactive_gender.dailyusage<-ggplotly(gender.dailyusage)
interactive_gender.dailyusage

#•	Age × Attention span
age_attentionspan<-ggplot(Mobile_impact, aes(x = Age, fill = Attention.span)) +
  geom_bar(position = "stack") + # 'position = "stack"' is the default, but explicitly stated for clarity
  labs(
    title = "Stacked Bar Chart of Age by Attention span",
    x = "Age",
    y = "Count",
    fill = "Attention span"
  ) +
  theme_minimal() # Apply a clean theme
interactive_age_attentionspan<-ggplotly(age_attentionspan)
interactive_age_attentionspan

########### NON PARAMETRIC STATISTICAL TEST ########
#Chi-square test of Independence
# Daily usages × Health rating
#Initial Chisuare testing resulted in a warning that the approximations may be incorrect
unique(Mobile_impact$Daily.usages) #Daily usages is fine
unique(Mobile_impact$Health.rating) # Too much categories

#To fix this we are collapsing some of the categories and rerun the chisquare code
collapse_health <- function(x) {
  if (grepl("Poor", x)) {
    return("Poor")
  } else if (grepl("Fair", x)) {
    return("Fair")
  } else if (grepl("Good", x)) {
    return("Good")
  } else if (grepl("Excellent", x)) {
    return("Excellent")
  } else {
    return(NA)
  }
}

Mobile_impact$Health.rating.collapsed <- sapply(
  Mobile_impact$Health.rating,
  collapse_health)
#Verify collapsed variable
view(Mobile_impact$Health.rating.collapsed)

#Convert to ordered factor
Mobile_impact$Health.rating.collapsed<-factor(
  Mobile_impact$Health.rating.collapsed, 
  levels=c("Poor","Fair","Good","Excellent")
  
)

#Now we create the contingency table
usage.rating_contigency<-table(Mobile_impact$Daily.usages,
                                Mobile_impact$Health.rating.collapsed)
usage.rating_contigency
#Even after collapsing the freqencies, i still couldn't calculate my chi square because the cell counts are small
#So we resulted to using the Fisher's Exact Test
usagerating_fisher<-fisher.test(usage.rating_contigency)
usagerating_fisher

#Daily usages × Symptom frequency
usages.symptom_contigency<-table(Mobile_impact$Daily.usages,
                                 Mobile_impact$Symptom.frequency)

usages.symptom_fisher<-fisher.test(usages.symptom_contigency)

usages.symptom_fisher

#Daily usages × Usage distraction
usage.distraction_contigency<-table(Mobile_impact$Daily.usages,
                                    Mobile_impact$Usage.distraction)
usage.distraction_fisher<-fisher.test(usage.distraction_contigency)
usage.distraction_fisher

#Daily usages × Attention span
usage.attention_contigency<-table(Mobile_impact$Daily.usages,
                                  Mobile_impact$Attention.span)
usage.attention_fisher<-fisher.test(usage.attention_contigency)
usage.attention_fisher

#Mobile phone use for education × Performance impact
education.performance_contigency<-table(Mobile_impact$Mobile.phone.use.for.education,
      Mobile_impact$Performance.impact)
education.performance_fisher<-fisher.test(education.performance_contigency, simulate.p.value=TRUE)
education.performance_fisher

#Helpful for studying × Performance impact
study.performance_contigency<-table(Mobile_impact$Helpful.for.studying,
        Mobile_impact$Performance.impact)

study.performance_fisher<-fisher.test(study.performance_contigency)
study.performance_fisher

#Educational Apps × Attention span
app.span_contigency<-table(Mobile_impact$Educational.Apps,
      Mobile_impact$Attention.span)
app.span_fisher<-fisher.test(app.span_contigency)
app.span_fisher

#Usage distraction × Performance impact
distraction.performance<-table(Mobile_impact$Usage.distraction,
      Mobile_impact$Performance.impact)

distraction.performance_fisher<-fisher.test(distraction.performance)
distraction.performance_fisher

#Usage distraction × Attention span
distraction.span_contigency<-table(Mobile_impact$Usage.distraction,
      Mobile_impact$Attention.span)
distraction.span_fisher<-fisher.test(distraction.span_contigency)
distraction.span_fisher

#Daily usages × Health risks
usage.risks_contigency<-table(Mobile_impact$Daily.usages,
      Mobile_impact$Health.Risks)
usage.risks_fisher<-fisher.test(usage.risks_contigency)
usage.risks_fisher

#Health precautions × Symptom frequency
precautions.frequecy_contigency<-table(Mobile_impact$Health.precautions,
      Mobile_impact$Symptom.frequency)
precautions.frequency_fisher<-fisher.test(precautions.frequecy_contigency)
precautions.frequency_fisher

#Health precautions × Health rating
precautions.rating_contigency<-table(Mobile_impact$Health.precautions,
                                     Mobile_impact$Health.rating.collapsed)
precautions.rating_fisher<-fisher.test(precautions.rating_contigency)
precautions.rating_fisher

#Gender × Health risks
gender.risks_contigency<-table(Mobile_impact$Gender,
      Mobile_impact$Health.Risks)
gender.risk_fisher<-fisher.test(gender.risks_contigency)
gender.risk_fisher

#Gender × Daily usages
gender.usages_contigency<-table(Mobile_impact$Gender,
      Mobile_impact$Daily.usages)
gender.usage_fisher<-fisher.test(gender.usages_contigency)
gender.usage_fisher

#Age × Attention span
age.span_contigency<-table(Mobile_impact$Age,
      Mobile_impact$Attention.span)
age.span_fisher<-fisher.test(age.span_contigency)
age.span_fisher


