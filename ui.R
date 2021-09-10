# Load libraries
library(shiny)
library(tidyverse)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    # TASK 1: Application title
    titlePanel(title = "Demographic Data Trends"),
    p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demogrphic information."),
    
    # TASK 2: Add first fluidRow to select input for country
    fluidRow(
      column(12, 
             wellPanel(selectInput(inputId = "country", 
                                   label = "Select a country:", 
                                   choices = c("United-States", "Canada", "Mexico", "Germany", "Philippines"),
                                   selected = "United States"))  
             )
    ),
    
    # TASK 3: Add second fluidRow to control how to plot the continuous variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a continuouse Variable and graph type (boxplot/histogram) to view on the right"),
               radioButtons(inputId ="continuous_variable", 
                            label="Continuous Variable:", 
                            choices = c("age", "hours_per_week")),
               radioButtons(inputId = "graph_type", 
                            label="Type of Graph:", 
                            choices = c("histogram", "boxplot")    # add radio buttons for chart type
               )
             ),
             column(9, plotOutput("p1"))  # add plot output
    ),
    
    # TASK 4: Add third fluidRow to control how to plot the categorical variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a categorical variable to view bar chart"),
               radioButtons(inputId ="categorical_variable", 
                            label="Categorical Variable:", 
                            choices = c("education", "workclass","sex")),
               checkboxInput(inputId = "is_stacked", 
                             label = "Stacked?",
                             value = FALSE)  
             )
      ),
      column(9, plotOutput("p2"))  # add plot output
    )
  )
)
