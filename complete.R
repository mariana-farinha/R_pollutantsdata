complete <- function(directory, id = 1:332) {
  wd<-"C:/Users/fernando farinha/Desktop/rprog-data-specdata"
  full_path <- paste(wd,"/",directory,sep="")
  setwd(full_path)
  csv_files <- dir()
  for(i in 1:length(id)){
    c <-id[i]
    first_csv <- read.csv(csv_files[[c]], header = TRUE)
    first_csv <- complete.cases(first_csv)
    count <- sum(first_csv)
    if(i==1){
      table <- data.frame(id = c, nobs = count)
    }else{
      data <- data.frame(id = c, nobs = count)
      table <- rbind(table,data)
    }
  }
  setwd("C:/Users/fernando farinha/Desktop/rprog-data-specdata")
  return(table)
}
