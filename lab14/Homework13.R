##HW13
##Maya Medina
  

knitr::opts_chunk$set(echo = TRUE)


library(tidyverse)
library(shiny)
library(shinydashboard)
library(naniar)
library(janitor)



UC_admit <- read_csv("data/UC_admit.csv") %>% clean_names()



str(UC_admit)



names(UC_admit)



naniar::miss_var_summary(UC_admit)


UC_admit %>% 
 ggplot(aes(x=ethnicity))+
  geom_bar()




library(shiny)

ui <- dashboardPage(
  dashboardHeader(title="UC Admissions"),
  dashboardSidebar(disable = T),
  dashboardBody(
     fluidRow(
      box(width=3,
      selectInput("x", "UC Campus", unique(UC_admit$campus)), hr()),
      box(width=3,
      selectInput("y", "Year", unique(UC_admit$academic_yr)), hr()),
      box(width = 8,
      plotOutput("plot", width = "600px", height = "400px")))))


server <- function(input, output, session) {
  session$onSessionEnded(stopApp)
  
  output$plot <- renderPlot({
    
  UC_admit %>% 
  filter(category=="Admits") %>% 
  group_by(academic_yr) %>% 
  ggplot(aes(x=ethnicity, y=filtered_count_fr))+
  geom_col()
  
})}


shinyApp(ui, server)



library(shiny)

ui <- dashboardPage(
  dashboardHeader(title="UC Admissions"),
  dashboardSidebar(disable = T),
  dashboardBody(
     fluidRow(
      box(width=3,
      selectInput("x", "UC Campus", unique(UC_admit$campus)), hr()),
      box(width=3,
      selectInput("y", "Ethnicity", unique(UC_admit$ethnicity)), hr()),
      box(width=3,
      selectInput("z", "Year", unique(UC_admit$academic_yr)), hr()),
      box(width = 8,
      plotOutput("plot", width = "600px", height = "400px")))))


server <- function(input, output, session) {
  session$onSessionEnded(stopApp)
  
  output$plot <- renderPlot({
    
  UC_admit %>% 
  filter(category=="Admits") %>% 
  group_by(academic_yr) %>% 
  ggplot(aes(x=ethnicity, y=filtered_count_fr))+
  geom_col()
  
})}


shinyApp(ui, server)











