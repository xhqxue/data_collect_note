url<-"http://www.r-datacollection.com/materials/ch-2-html/fortunes.html"
#just catch html file and storage
fortune<-readLines(con = url)
install.packages(c("stringr","XML","maps"))
library(XML)
#parse the html file and save it in a new object
parsed_fortune<-htmlParse(file = url)
print(parsed_fortune)



h1 <- list("body" = function(x){NULL})
parsed_fortunes <- htmlTreeParse(url, handlers = h1, asTree = TRUE)
parsed_fortunes$children



h2 <- list(
startElement = function(node, ...){
name <- xmlName(node)
if(name %in% c("div", "title")){NULL}else{node}
},
comment = function(node){NULL}
)
parsed_fortunes <- htmlTreeParse(file = url, handlers = h2, asTree = TRUE)
parsed_fortunes$children

getItalics = function() {
i_container = character()
list(i = function(node, ...){
i_container <<- c(i_container, xmlValue(node))
},
returnI = function() i_container)
}
#Instantiating an instance of the handler
h3 <- getItalics()
#Executing the parsing with the instatiated handler and printing the returned data
invisible(htmlTreeParse(url, handlers = h3))
h3$returnI()

