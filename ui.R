# load packages
library(shiny)


# make UI
ui <- fluidPage(
                 sidebarLayout(
                     sidebarPanel(
                         h4('Selection'),
                         sliderInput('sliderGirth', 'What is the diameter of the tree?',5,25,value=10),
                         hr(),
                         checkboxInput('showModel1', 'Show the model', value = TRUE),
                         hr(),
                         helpText('R base dataset find more ', tags$a(href='https://rdrr.io/r/datasets/trees.html','here.'))),

                     
                     mainPanel(
                         h1('Tree height prediction app'),
                         h2('Instructions'),
                         p('In this very small shiny app you can choose the diameter of a tree and predict the height of the tree.
                         Use the sidebare panel to the right to select the diameter of a tree. You can choose if you want to show the regression 
                         line of the prediction. Below the graph you will see the predicted height of the tree.  This siny app is using the R base data set
                           \'trees\'. This dataset provides measurements of the diameter, height and volumen of timber in 31 felled black cherry trees.' ),
                        h2('Plot'),
                        p('Select the diameter of a tree and predict it\'s height.'),
                        plotOutput("plot1"),
                        h3("Predicted tree height from model:"),
                        textOutput('pred1')
                       ))
                     )
                 




