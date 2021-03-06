library(ggplot2)
library(shiny)
library(reshape2)
library(rsconnect)

rsconnect::setAccountInfo(name='yeongyushin',
                          token='5CFC081E20AEAAA2700272CE0B5C1834',
                          secret='CmOadnAkw6EDCI+1EL/kuV5U/6I3s7HY5WgknnwS')
library(rsconnect)
rsconnect::deployApp('~/Workout21.rmd')



ui <- fluidPage(
  titlePanel("Workout2"),
  
  fluidRow(
    column(3,
           sliderInput("ia", "Initial amount",
                       min = 0, max = 100000,
                       value = 1000, step = 500,
                       pre = "$", sep = ",",
                       animate = FALSE),
           sliderInput("ac", "Annual Contribution",
                       min = 0, max = 50000,
                       value = 2000, step = 500,
                       pre = "$", sep = ",",
                       animate = FALSE)
    ),
    column(4, 
           sliderInput("rr", "Return Rate (In %)",
                       min = 0, max = 20,
                       value = 5, step = 0.1),

           sliderInput("gr", "Growth Rate (In %)",
                       min = 0, max = 20,
                       value = 2, step = 0.1)
    ),
    column(4,
           sliderInput("y", "Year",
                       min = 0, max = 50,
                       value = 20, step = 1),
           selectInput("f", "Facet",
                       choices = c("Yes" = "yes", "No" = "no"))
    )
  ),
  
  
  mainPanel(
    h4("Timelines"),
    plotOutput("plot1", width = 850),
    h4("Balances"),
    tableOutput("table")
    
  ))

# Define server logic for slider examples ----
server <- function(input, output) {
  
  ##Default Values
  future_value <- function(amount, rate, year){
    return(amount*(1+rate)^year)
  }
  annuity <- function(contrib, rate, year){
    i <- 0
    sum <- 0
    while (i < year) {
      sum <- sum + future_value(contrib, rate, i)
      i <- i + 1
    }
    return(sum)
  }
  growing_annuity <- function(contrib, rate, year, growth){
    i <- 0
    sum <- 0
    while (i < year) {
      sum <- sum + future_value(contrib, rate, i)*(1 + growth)^(year-1-i)
      i <- i + 1
    }
    return(sum)
  }
  
  table_maker <- function(ia, ac, rr, gr, yr){
    
    year <- c(0:yr)
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    
    for (i in 0:yr){
      no_contrib[i+1] <- future_value(ia, rr, i)
    }
    for (i in 0:yr){
      fixed_contrib[i+1] <- future_value(ia, rr, i) + annuity(ac, rr, i)
    }
    for (i in 0:yr){
      growing_contrib[i+1] <- future_value(ia, rr, i) + growing_annuity(ac, rr, i, gr)
    }
    
    saving_simulation <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    return(saving_simulation)}
  #Graph1)
  graph_maker <- function(ia, ac, rr, gr , yr){
    year <- c(0:yr)
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    
    for (i in 0:yr){
      no_contrib[i+1] <- future_value(ia, rr, i)
    }
    for (i in 0:yr){
      fixed_contrib[i+1] <- future_value(ia, rr, i) + annuity(ac, rr, i)
    }
    for (i in 0:yr){
      growing_contrib[i+1] <- future_value(ia, rr, i) + growing_annuity(ac, rr, i, gr)
    }
    
    modality <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    modality_melted <- reshape2::melt(modality, id.var='year')
    modality_melted
    plot <- ggplot(data = modality_melted, aes(x = year, y = value, col=variable)) +
      geom_line()+
      geom_smooth()+
      labs(x = 'Years', y = 'Amount', title = 'Modalities')+
      theme_classic()+
      theme(legend.position = "right")
    return(plot)
  }
  
  #Graph2)
  graph_maker2 <- function(ia, ac, rr, gr , yr){
  values <- c()
  for (i in 0:yr){
    values[i+1] <- future_value(ia, rr, i)
  }
  for (i in 0:yr){
    values[i+yr+2] <- future_value(ia, rr, i) + annuity(ac, rr, i)
  }
  for (i in 0:yr){
    values[i+2*yr+3] <- future_value(ia, rr, i) + growing_annuity(ac, rr, i, gr)
  }
  
  year <- c(0:yr, 0:yr, 0:yr)
  type <- c()
  for (i in 0:yr){
    type[i+1] <- "regular saving"
  }
  for (i in 0:yr){
    type[i+yr+2] <- "High Yield"
  }
  for (i in 0:yr){
    type[i+2*yr+3] <- "Index Fund"
  }
  saving_simulation <- data.frame(year, values)
  saving_simulation_type <- cbind(saving_simulation, type)
  saving_simulation_melted <- reshape2::melt(saving_simulation, id.var='year')
  saving_simulation_melted_type <- cbind(saving_simulation_melted, type)
  
  p <- ggplot(data = saving_simulation_melted_type, aes(x = year, y = value, col = type, fill = type)) +
    geom_line()+
    facet_wrap(~type) +
    geom_smooth()+
    labs(x = 'Years', y = 'Amount', title = 'Modalities')+
    theme_classic()+
    theme(legend.position = "right")+
    geom_area(aes(alpha = 0.5))
    return(p)
  }
  #Facet or not
  d <- reactive({
    dist <- switch(input$f,
                   yes = graph_maker2,
                   no = graph_maker)
    
    dist(input$ia, input$ac, input$rr/100, input$gr/100, input$y)
  })
  
  
  #Output
  output$table <- renderTable({table_maker(input$ia, input$ac, input$rr/100, input$gr/100, input$y)})

  output$plot1 <-  renderPlot({d()})
                                   
}
# Create Shiny app ----
shinyApp(ui, server)
