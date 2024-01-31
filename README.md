## JD: The answer to the question: what working directory should it be run from is _relative to the main directory of your repo_. Since your repo only has one directory so far, your answer should be: “the script is run from the main directory.” Similarly, if you use a read command, you should say something like `read("filename.csv")`; not something like `read("/Users/justinbenjamin/Desktop/McMaster/Courses/BIO 708/QMEE/filename.csv")`

Egg sizes can vary within bird species species and within an individual based on the time of year, food availability, order in the laying period, and age. 
Subsequently, the hatching and fledging rates may be correlated with egg sizes depending on the species. 
Here I will be exploring the egg size (lengths and widths) of eggs from Pukekos (*Porphyrio melanotus melanotus*). 
Pukekos exhibit a very rare breeding behaviour known as joint-laying where more than 1 female may lay eggs in the same nest and collectively take care of the young.
Pukekos live in kin groups woth linear dominance hierachy systems.
Egg sizes and patterns vary between and within females laying in the nest but the females don't seem to show any preferences for their own eggs compared the others.
A fair bit is known about egg sizes in other bird species but I am curious how egg sizes might play a role in this rare breeding and social system. 

I have data on the egg dimensions, laying order, hatching success, and genetic relatedness to dominant and subordinate members of the group. 
The biological questions are currently being brainstormed but I am interested in seeing if there are any relationships or patterns between egg size and the 
rare breeding system that could provide some insight into the evolution of joint laying behaviour and dominance hierarchies. 

P.S. Please ask for any references.




I have added my assignment 2 and the readRDS scripts to my repository. 
The main assignment 2 script is pretty simple still as I get my project and available data sorted out. I looked at the structure and class of my 
data to see if there were any problems. I also made some histograms and a scatterplot to see how my data is spread. 
I added a saveRDS at the end of the script that saves my dataframe of my data. 
My second script can read in the rds file from the other script under a new name in a new session. This script is also very simple, just repeats the scatterplot
but I changed the colour of the points from black to blue and the theme of the figure. 
The working directory of my project is "/Users/justinbenjamin/Desktop/McMaster/Courses/BIO 708/QMEE"
I don't quite understand what the question "what working directory should they be run from?" mean and would like some clarification on that in class next week. 

I am going to meet with my supervisor soon to discuss the directions the project will go. I am currently trying to compile all the data we have from 
past years on egg size into a single spreadsheet with the same format to simplify analyses in R (a grueling process so far). 
In terms of breaking down the project into replicable components, here are some ideas to make sure my work is reproduceable:

1. Documenting my steps along the way like using this README or commenting in my code.
2. Version control using Git or RMarkdown. 
3. Trying to automate repetitive tasks where possible (have excel or R do math and organization so I don't have to). This could include data fetching, preprocessing steps. This would enhance replicability and reduces human error.



I have uploaded my assignment 3 to my repository. The script is run from the main directory. I have run it from start to finish in a brand new R session
and it ran smoothly without any errors. I have fixed some issues like including the readxl function and taking out unecessary code like install.packages
from the script. I also made an edit to the script that is commited because I had some unecessary code in there.
Here I am trying to show a few different ggplot figures. I have a scatterplot, a figure of faceted histograms, and a figure of faceted qqplots. As I am working on acquiring and organzing a more fullsome dataset with data from other years and data on hatching rates and fledging rates, the figures I have produced are more preliminary for seeing the distributions of the data so that I can make informed decisions when it comes to the statistical analyses. 
I am not sure if I have done the qqplot correctly so I may muck around and fix that at some point. 
I decided to keep the figures simple because simplicity is key. The plots show the most critical information like the position of points within the scatterplot and qqplots and the lengths of bars in the histograms while excluding "extra" features like a bunch of colours and volumes and textures that are not quite as clear on their own. I really like faceted figures because they reduce the amount of code needed (i.e. don't have to copy paste text to make a bunch of individual figures). 




MMV question:
1% of the population has it and will test positive 100%
5% of the population without it will test positive

So 6% of people tested in this population will have a positive test but only 1/6 of those will actually have it. 
Of those that test positive for MMV, 16.67% actually have it and the rest are false positives. 

If my friend tests positive for MMV I will tell them that they likely don't have it but it is possible.
I will also tell them that since they have a chance of having the disease that they should sit in during Thursday's lecture that will continue on statistical philosphy so that they can learn about their disease and learn some of the statistical techniques and whatnot to use in order to treat themselves. 
I think I might have MMD myself and this week's material is the first part of my medical treatment. 







