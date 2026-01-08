# Impact of Mobile Phone Usage on Students Health and Academic Performance
# 1. INTRODUCTION
The widespread use of mobile phones among students has transformed communication, learning, and access to information. While mobile devices offer educational benefits, concerns remain regarding their potential effects on students’ health, attention span, and academic performance.  This study examines patterns of mobile phone usage among students and explores perceived academic and health impacts, with particular emphasis on usage intensity, distraction, and preventive health practices.

This study aims to describe mobile phone usage patterns among students, examine how mobile phones are used for educational purposes, assess students’ perceived health and academic impacts of mobile phone use, and explore associations between mobile phone usage characteristics and health-related outcomes.

# 2.	METHODOLOGY
# 2.1.	Study design and Data Source
This data was sampled from Kaggle, a database repository platform that houses millions of datasets for researchers looking to explore existing knowledge in a particular field. Upon thoroughly examining this data, I noticed that the data captured demographic characteristics, mobile phone usage behaviors, educational use, academic performance perceptions, and health-related outcomes, which captured key areas for a detailed study.

# 2.2.	Variables 
The study variables were grouped as follows:
a.	Demographics: Age, Gender
b.	Mobile Phone Characteristics: Mobile Phone, Mobile Operating System
c.	Usage Patterns: Daily usages, Mobile phone activities, Usage distraction, Attention span
d.	Educational Use: Mobile phone use for education, Educational Apps, Helpful for studying, Useful features, Beneficial subject
e.	Academic Impact: Performance impact
f.	Health Outcomes: Health Risks, Usage symptoms, Symptom frequency, Health precautions, Health rating
In the original data set, the CSV file contained the “Names of the participants” variable. This column was treated as an identifier and excluded from the analysis.

# 2.3.	Data Preparation
The dataset was imported as a CSV file using the read.csv command in R. Categorical variables were retained as categorical factors where appropriate. All columns were used for the analysis except the “Name” variable. The dataset contained 100 rows with 19 variables. No duplicates were found in the data set. 
After checking for missing data, it was identified that the R code executed couldn’t identify the missing data because they were represented as “”, leading to a return with no missing values. This issue was resolved by relabeling the empty cell as “NA” and issuing an omit missing values command, which reduced the rows to 91. This was the number of rows used in this analysis.

# 2.4.	Analytical Approach 
Descriptive analytics were used to summarize individual variables through frequencies, percentages, and summary statistics. Exploratory Data Analysis (EDA) was conducted using cross-tabulations and visual inspection to identify patterns and relationships between variables. To formally assess associations between categorical variables, Fisher’s Exact Test was employed. This test was chosen due to the small expected cell counts in several contingency tables. Statistical significance was assessed at the 5% level.

# 3.	DESCRIPTIVE ANALYTICS 
# 3.1.	Demographic Characteristics 
The majority of respondents were within the typical student age range of 21-25 years, constituting 69/91, with both male and female students represented (81% males to 18% females). All respondents reported owning and using a smartphone, with 80% indicating that they were Android users, resulting in Android being the most commonly used mobile operating system in this study. 
 <img width="945" height="414" alt="image" src="https://github.com/user-attachments/assets/d15b682e-563b-473b-8685-5915ed62dbdc" />


# 3.2.	Mobile Phone Usage Patterns.
63% of students reported that they performed all major mobile phone activities examined in this study, which include messaging, social media usage, and web browsing, with 42% indicating a daily usage between 4-6 hours, and 26% using their phones for 2 -4 hours a day, keenly followed by 25% mentioning a daily usage over 6 hours. 
<img width="725" height="368" alt="image" src="https://github.com/user-attachments/assets/8284ee6d-894a-4e6e-8a1d-115f5f38ba43" />


# 3.3.	Educational Use of Mobile Phones
95% of students agreed with the assertion that mobile phones helped them study; however, 51 of them indicated that they sometimes alternated between using mobile devices for educational resources and complementing them with other study materials provided. Of all available mobile educational apps presented to participants in this study (educational videos, language, productivity tools, and study planners), 57% of participants preferred the use of educational videos to aid their studies. Many students (46) perceived mobile phones as helpful for studying, particularly in research areas, with 66 referring to internet access as one of the most useful features of a mobile device
<img width="399" height="431" alt="image" src="https://github.com/user-attachments/assets/b1cd23d9-00d0-459a-93c7-155398cdeed7" />

<img width="543" height="319" alt="image" src="https://github.com/user-attachments/assets/10d2cab9-7ea6-44e2-bd94-d017899f4a72" />



# 3.4.	Academic Performance and Attention
A proportion of students (32.5%) reported experiencing phone-induced distraction, particularly during studies, with 71% highlighting that indeed phones were reducing their attention span. However, 54% of students admitted to these devices, tremendously boosting their academic performance and overall output.

<img width="975" height="471" alt="image" src="https://github.com/user-attachments/assets/2f04ef58-fe08-4334-a627-0199ad179561" />

 
# 3.5.	Health Status and Symptoms
The majority of students (61%) agreed with the assertion that the consistent use of mobile devices exposed them to several health risks, with 51 out of the 91 students expressing occasional side effects from using their devices. Due to these side effects, 36% of students have taken steps to limit their screen time, while 21% take intermediate breaks during prolonged use. However, the majority of students indicated that they felt good, meaning that most of them had not started experiencing some of the long-term detriments that come with prolonged mobile device usage over time.

<img width="975" height="433" alt="image" src="https://github.com/user-attachments/assets/96242337-8faf-44a2-86b2-46ae7d8f93bf" />


# 4.	EXPLORATORY DATA ANALYSIS (EDA)
# 4.1.	Usage Intensity vs Outcomes
Analysis of daily mobile phone usage revealed mixed health and attention outcomes across usage levels. Students who use their devices for less than two hours daily generally acknowledged potential health risks, although some perceived no risk due to their limited use. The four-to-six-hour usage group constituted the largest proportion of respondents and showed varied experiences, with many reporting occasional symptoms, while others reported no symptoms or no attention effects. Reports of frequent symptoms were more common among students using their devices for two to four hours daily. Analysis of daily usage and attention span showed that students within the four- to six-hour usage category were most likely to report a reduced attention span. In contrast, students with less than two hours of daily usage were least likely to report any effects on attention span. Overall, the findings suggest that moderate to high mobile phone use is associated with diverse health and attention experiences rather than uniformly negative effects.

<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/ae87408b-ab7a-44c8-8c6a-79fa96714ef4" />
<img width="627" height="585" alt="newplot (1)" src="https://github.com/user-attachments/assets/9bf009c7-7ce5-4cd2-89e1-a57cc9725eaa" />



# 4.2.	Educational Use vs Academic Performance
Students who never use mobile phones for education reported mixed academic performance perceptions, clustering around neutral and agree responses, while those who used phones rarely or sometimes tended to report modest positive impacts. Overall, more frequent educational use was associated with more favorable performance perceptions, although the relationship appeared weak to moderate due to considerable overlap across usage categories. Among respondents who did not find mobile devices helpful for studying, perceptions of performance impact were evenly split between neutral and strongly negative, whereas a notable proportion of those who found devices helpful reported positive academic effects. Regarding attention span, students who primarily used educational videos were more likely to report reduced attention, while those using study planners and productivity tools generally reported no perceived impact on attention.

<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/b235dde9-14b5-492e-859a-008f4f49bfdd" />
<img width="627" height="585" alt="newplot (1)" src="https://github.com/user-attachments/assets/8926be61-6ac2-49de-bfcc-5a2f72a96b7f" />
<img width="627" height="585" alt="newplot (2)" src="https://github.com/user-attachments/assets/5d23b3d0-487d-4ae4-99b0-a39d44cd329e" />


# 4.3.	Distraction and Attention Dynamics
Analysis of usage distraction and academic performance suggests that phone-related distractions during lectures or study periods are more commonly associated with neutral to negative perceived performance impacts, whereas students who reported phones as not distracting tended to report neutral or positive academic outcomes. Regarding usage distraction and attention span, the highest proportion of students who experienced distractions while studying also reported having attention span difficulties. In contrast, students who did not perceive phones as distracting showed mixed responses on attention span, with nearly equal proportions reporting the presence or absence of attention-related issues.

<img width="885" height="318" alt="Usage distraction vrs performance impact" src="https://github.com/user-attachments/assets/01a64744-af32-49a1-96e9-4e336742b90b" />
<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/78ee389a-d9d2-4069-8478-debb80b22695" />


# 4.4.	Health Risks and Preventive Behavior
The findings suggest that health precautions may help mitigate mobile phone–related symptoms. Students who reported occasional symptoms commonly indicated that they managed these effects by limiting screen time, while those using blue light filters were more likely to report excellent health ratings. Additionally, respondents with good health ratings frequently cited reduced screen time as a key precautionary measure, indicating a generally positive association between precautionary behaviors and perceived health outcomes.
<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/5dc855f9-d6c8-494b-8f9a-f7a76d0bdaa7" />
<img width="627" height="585" alt="newplot (1)" src="https://github.com/user-attachments/assets/36f63fa7-4ac1-4407-8ff2-0f20f8097e2f" />


# 4.5.	Demographic Differences
Exploratory analysis suggests modest demographic differences in mobile phone–related outcomes. A higher proportion of male students reported experiencing health risks compared to females, although females constituted a larger share of moderate daily users (4–6 hours), while males were slightly more represented among heavy users (over 6 hours daily). Females also marginally exceeded males among low-usage respondents (less than two hours per day). In terms of age, students aged 21–25 years were likely to report attention span issues, with over half indicating reduced attention.
<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/715be19e-32e8-45f0-a8c1-646470b0fefa" />
<img width="627" height="585" alt="newplot (1)" src="https://github.com/user-attachments/assets/3acdd3f3-94ba-4beb-ab61-d54d74dab159" />
<img width="627" height="585" alt="newplot" src="https://github.com/user-attachments/assets/c18767e1-3c61-4ece-b272-57333e682316" />



# 5.	FISHER'S EXACT TEST RESULTS
Fisher’s Exact Test was employed to examine associations between key mobile phone usage variables, academic outcomes, and health-related indicators. This test was selected due to the categorical nature of the variables and the presence of small expected cell counts in several contingency tables. Statistical significance was assessed at the 5% level.
A statistically significant association was observed between daily mobile phone usage and self-rated health rating (p = 0.0258), indicating that variations in daily usage levels were associated with differences in students’ perceived health impact. Similarly, a significant relationship was found between perceived helpfulness of mobile phones for studying and academic performance impact (p = 0.0440) as well as mobile phone use for education and performance impact (p=0,0724), suggesting that students who found mobile phones helpful for studying were more likely to report positive academic outcomes.
In addition, health precautions and symptom frequency were significantly associated (p = 0.0289), implying that the adoption of precautionary measures, such as taking screen breaks or limiting usage, was related to how frequently students experienced health-related symptoms.
No statistically significant associations were found between daily mobile phone usage and symptom frequency (p = 0.8004), usage distraction (p = 0.6039), or attention span (p = 0.4748). Furthermore, daily usage was not significantly associated with reported health risks (p = 0.2058).
Regarding educational and behavioral factors, no significant relationships were observed between mobile phone use for education and performance impact (p = 0.0725), educational app usage and attention span (p = 0.8939), or usage distraction and academic performance (p = 0.4477). Demographic variables also showed no significant associations, as gender was not related to health risks (p = 0.9281) or daily usage (p = 0.3545), and age was not significantly associated with attention span (p = 0.4055).
Overall, the bivariate analysis suggests that while certain aspects of mobile phone use, particularly overall usage intensity, perceived educational usefulness, and health precautionary behaviors, are associated with perceived health and academic outcomes, many usage and demographic factors did not demonstrate statistically significant relationships within this sample.

# 6.	CONCLUSION
This study highlights the importance of balanced mobile phone usage among students. While mobile phones are valuable educational tools, excessive and distracted use may negatively impact health and academic performance. Promoting responsible usage and health-conscious practices may help maximize benefits while minimizing risks.
