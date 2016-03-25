
#download dataset
myfile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",myfile)

my_unzip <- unzip(myfile)
data <- read.table(my_unzip,header=T,sep=";",na.strings="?") #loading dataset in data frame

#Data processing
sub_data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] #selecting only the data for two specific days and make a new sub dataset
sub_data$my_Time = paste(sub_data$Date, sub_data$Time) #create a new column with both the date and the time
sub_data$my_Time = strptime(paste(sub_data$Date, sub_data$Time),format="%d/%m/%Y %H:%M:%S") #change the format of the my_time from character to Date-time



#graphic
png(file = "plot1.png",width = 480, height = 480) #save the plot to a png file
hist(sub_data$Global_active_power,
     col=2,
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()




