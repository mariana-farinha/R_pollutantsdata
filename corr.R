corr <- function(directory, threshold = 0){
  wd<-"C:/Users/fernando farinha/Desktop/rprog-data-specdata"
  full_path <- paste(wd,"/",directory,sep="")
  setwd(full_path)
  csv_files <- dir()
  v <- c()
  for(i in csv_files){
    current_csv <- read.csv(i, header=TRUE)
    current_csv<-current_csv[complete.cases(current_csv),]
    total_complete <- nrow(current_csv)
    if(total_complete > threshold){
      correlation <- as.numeric(cor(current_csv['nitrate'], current_csv['sulfate']))
      v <- append(v, correlation)
    }
  }
  setwd("C:/Users/fernando farinha/Desktop/rprog-data-specdata")
  if(is.null(v)){
    return(c())
  }else{
    return(v)
  }
}