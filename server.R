library("tidyverse")
function(input, output, session){
  output$download_starwars_data <- downloadHandler(
    filename = function() {
      paste0(Sys.Date(), "_starwars_data.csv")
    },
    content = function(file) {
      starwars%>%
        write_csv(file)
    }
  )
  output$star_table <- renderDT({
    starwars %>%
      select(name, species, homeworld, height) %>%
      filter(height <= input$height_limit_star_table) %>%
      arrange(desc(height))
  # striped = TRUE%>%
  # hover = TRUE%>%
  # na = "[Missing]"
}
)
  
  # output$star_wide <- renderTable({
  #   
  #   starwars %>%
  #     select(name:species) %>%
  #     filter(height <= input$height_limit_star_wide) %>%
  #     arrange(desc(height),
  #     extensions = "Buttons", #bc we wanna use buttons
  #     options = list(
  #       buttons = c("excel", "pdf"),
  #       dom = "Bftip")#the dom arguement is a string where we specify the components of the table we want to display. the "Bftip" stands for: buttons, filter, table, information, and page.
  #       #ALSO note that the little buttons won't work in the R-browser, it has to be deployed i think
  #     )
  #   
  # })
  
  output$star_lists <- renderTable({
    
    starwars %>%
      select(name, films, vehicles, starships) %>%
      mutate_if(is.list, list(~map_chr(., ~paste(.x, collapse = "<br>"))))
    
  }, width = "100%",
  
  sanitize.text.function = identity) #if you run without this line you'll see "<br>" in the text. Use this function to remove them/get a real list.
  
}