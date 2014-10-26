
shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      headerPanel("Iris Data Analysis Tool"),
      selectInput("var", 
                  label = "Choose a variable to display on the Histogram and Summary views.",
                  choices = c("Sepal Length", "Sepal Width",
                              "Petal Length", "Petal Width"),
                  selected = "Sepal Length"),
      br(),
      p("Describe an observed iris using these sliders and find its predicted species on the Prediction tab."),
      sliderInput("slen", 
                  label = "Sepal Length:",
                  min = 4.3, max = 7.9, value = 6),
      sliderInput("swid", 
                  label = "Sepal Width:",
                  min = 2.0, max = 4.4, value = 3),
      sliderInput("plen", 
                  label = "Petal Length:",
                  min = 1.0, max = 6.9, value = 4),
      sliderInput("pwid", 
                  label = "Petal Width:",
                  min = 0.1, max = 2.5, value = 1),
      br(),
      img(src="iris_petal_sepal.png")
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Welcome",p("Welcome to the Iris Data Analysis Tool - your gateway into this classic data set."),br(),br(),br(),p("The drop down on the left lets you pick from one of four measurements. The Histogram and Summary tabs provide information on your selection."),br(),p("The Plot tab displays two plots made from the reference data set to give you an idea of the dimensions of an iris of a given species."),br(),p("A predictive model has been built. By adjusting the four sliders on the left, you can specify a new observation of an iris and see what the model classifies this as on the Prediction tab.")),
                  tabPanel("Histogram", plotOutput("histo")), 
                  tabPanel("Summary", verbatimTextOutput("summary")), 
                  tabPanel("Plot",plotOutput("plot1"),plotOutput("plot2")),
                  tabPanel("Prediction", verbatimTextOutput("prediction"))
      )
    )
  )
))