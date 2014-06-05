complete <- function(directory, id = 1:332) {
 
  pollutantData<-data.frame()
  amt <- length(id)
  
  data_set <- matrix(nrow = amt, ncol = 2)
  colnames(data_set) <- c("id","nobs")
  
  curr_elem <- 0
  index <- 1
  y <- 0
  x <- 0
  
  for(file in rep(id)){
    pollutantData<-rbind(pollutantData, read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""), sep="," ,header=TRUE))
    
    temp <- pollutantData[complete.cases(pollutantData),]
    
    x <- nrow(temp) - y
    y <- nrow(temp)
    
    data_set[index,1] <- file
    data_set[index,2] <- x

    
    index <- index + 1
  }
  res <- as.data.frame(data_set)
}

