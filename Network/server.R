#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(visNetwork)

shinyServer(function(input, output) {
    output$network <- renderVisNetwork({
        load("nodes.RData")
        load("edges.RData")
        
        visNetwork(nodes, edges) %>%
            visIgraphLayout()
    })
})
