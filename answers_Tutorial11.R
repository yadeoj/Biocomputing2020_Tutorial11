# Challenge answers for Tutorial 11
# ICB 2020
# 10/23/2020
# SEJ

## Challenge #1
ants=read.csv("ants.csv",header=FALSE,stringsAsFactors=FALSE)
for(i in 1:nrow(ants)){
  print(paste("The ants go marching",ants[i,2],"by",ants[i,2],"hurrah, hurrah"))
  print(paste("The ants go marching",ants[i,2],"by",ants[i,2],"hurrah, hurrah"))
  print(paste("The ants go marching",ants[i,2],"by",ants[i,2]))
  print(paste('The little one stops to',ants[i,3]))
  print("And they all go marching down to the ground")
  print("To get out of the rain, BOOM! BOOM! BOOM!")
  print("")
  print("")
}

# Challenge #2 - take a file as argument and determine if sum is more or less than 100
assignmentChecker<-function(file){
  input<-read.csv(file,header=TRUE)
  
  total=sum(input)
  
  if(total<100){
    print("The file is correct, A+!")
  }else{
    print("Sorry, but you have failed. :(")
  }
}

# Challenge #3
randomNumbersFile<-function(filename="randomNumbers.csv"){
  # randomly sample the number of lines the file will have between 1 and 20
  numberLines<-sample(1:20,1)
  
  # create a variable to keep a running total for sampled numbers
  currentSum<-0
  # create a matrix with the correct number of lines as rows to write to the text file
  output<-matrix(0,numberLines,1)
  # loop for as many iterations as number of lines and sample a number randomly, but make sure it doesn't put us over 100
  for(i in 1:numberLines){
    # sample the random number using the "random uniform distribution" function
    newNumber=runif(n=1,min=0,max=(100-currentSum))
    # put the newly sampled number in the matrix to eventually be written to a file
    output[i]=newNumber
    # add the new Number to our running total
    currentSum=currentSum+newNumber
  }
  
  write.csv(output,filename,row.names=FALSE,col.names=FALSE)
}