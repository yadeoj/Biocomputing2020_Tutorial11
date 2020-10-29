#Exercise 9 Extra Credit
#By Joseph Day

#Grabbing an input variable for the directory and grabbing all the names of its files

dir <- readline(prompt = "What directory are we in? ")

file_names <- c(list.files(dir))

#Pre-making a vector before looping

values <- c()
  
#Creating our for loop for the task. Going to loop through each text file essentially.

for (i in 1:length(file_names)) {
  
  #Reading in the data for one of the files
  
  data <- read.csv(paste(dir, "/", file_names[i], sep = ""))
  
  #Checking the number of Observations and if there is no data at all (no columns)
  
  if (nrow(data) == 0) {
    
    print(paste("There are no observations for ", file_names[i], ":", sep = "" ))
    print("We're going to skip it!")
    next
  }
  
  else if (nrow(data) < 50 ){
    
    print(paste("There are less than 50 observations for ", file_names[i], ":", sep = "" ))
    
    bool <- readline(prompt = "Would you like to continue? Type yes or no: ")
    
    if(bool == "no") {
      
      next
      
  }
    
  }
  
  #Asking for the column name of the wanted file
  
  print(paste("Here are the column names for ", file_names[i], ":", sep = "" ))
  
  print(colnames(data))
  
  col <- readline("For what column do you want the coefficient of variation? ")
  
  c <- paste("data", "$", col, sep = "" )
  
  #Calculate the coefficient of variation of that column
  
  values[i] <- sd(eval(parse(text = c)))/ mean(eval(parse(text = c)))
}

#Presenting the finished vector

print("The vector containing the coefficients of variation is: ")

values<- values[!is.na(values)]

values


