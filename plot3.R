#download dataset
myfile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",myfile)

my_unzip <- unzip(myfile)
data <- read.table(my_unzip,header=T,sep=";",na.strings="?") #loading dataset in data frame

#Data processing
sub_data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] #selecting only the data for two specific days and make a new sub dataset
sub_data$my_Time = paste(sub_data$Date, sub_data$Time) #create a new column with both the date and the time
sub_data$my_Time = strptime(paste(sub_data$Date, sub_data$Time),format="%d/%m/%Y %H:%M:%S") #change the format of the my_time from character to Date-time


png(file = "plot3.png",width = 480, height = 480) #save the plot to a png file
plot(sub_data$my_Time,sub_data$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="")
lines(sub_data$my_Time,sub_data$Sub_metering_2,col=2)
lines(sub_data$my_Time,sub_data$Sub_metering_3,col=4)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c(1,2,3))
dev.off()


