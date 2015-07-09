pollutantmean <- function(directory, pollutant, id = 1:332) {
  wd<-"C:/Users/fernando farinha/Desktop/rprog-data-specdata"
  full_path <- paste(wd,"/",directory,sep="")
  setwd(full_path)
  csv_files <- dir()
  csv_id <- csv_files[id]
  for(var in 1:length(csv_id)) {
    if(var == 1) {
      data <- read.csv(csv_id[var], header = TRUE)
    } else {
      data_csv <- read.csv(csv_id[var], header = TRUE)
      data <- rbind(data, data_csv)
      
    }
  }
  col <- as.vector(data[pollutant])
  index <- complete.cases(col)
  setwd("C:/Users/fernando farinha/Desktop/rprog-data-specdata")
  return(mean(col[index,]))
}