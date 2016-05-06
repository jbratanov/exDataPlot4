#
# Exploratory Data Analysis - Week 4 project
#
# 1. Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of the
# years 1999, 2002, 2005, and 2008.
#

#
# Read in the NEI and SCC datasets
#
NEI <- readRDS("c:/coursera/ExploratoryDataAnalysis/project/summarySCC_PM25.rds")
SCC <- readRDS("c:/coursera/ExploratoryDataAnalysis/project/Source_Classification_Code.rds")

# Aggregate data
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Generate the graph
png(filename="c:/coursera/ExploratoryDataAnalysis/project/plot1.png")

barplot(Emissions$PM, names.arg=Emissions$Group.1, xlab='Year',
        ylab=expression(paste('PM', ''[2.5], ' in Kilotons')),
        main=expression('Total PM[2.5] Emissions in the United States'))

dev.off()

