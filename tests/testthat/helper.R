
removeWhiteSpace <- function(x){
  gsub("[[:space:]]", "", x)

}

#Removes carriage return (\n) and line feed (\r) characters in a string.
removeCRLF <- function(x){
  gsub("\n|\r", "", x)
}
