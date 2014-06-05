pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  pollutantData<-data.frame()
  totalDF <- data.frame()

  amt <- length(id)
  sums_vect <- numeric(amt)
  num_elem <- 0
  curr_elem <- 0
  obs_sum <- 0
  
  for(file in rep(id)){
    pollutantData<-rbind(pollutantData, read.table(paste(directory,"/",sprintf("%03d", file),".csv",sep=""), sep=",", header=TRUE))
  
    para <- (pollutantData[, pollutant])
    para <- para[complete.cases(para)]
  
    
    ##### For DEBUG purposes:
      ##print("ID:")
      ##print(file)
      
      ##print("Current Element number is: ")
      ##print(length(para))
    
    num_elem <- num_elem + length(para)
    obs_sum <- obs_sum + sum(para)
    
    
    sums_vect[file] <- sum(para)  
  }
  
  res <- sums_vect[file] / length(para)
  res
}
