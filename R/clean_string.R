#' Clean News Article
#'
#' `cleanString` cleans scrapped news articles text strings by removing and/or replacing special characters and punctuation. It also trims the string and encodes it with "UTF-8".
#' @param text The string to be cleaned. Either character or character vector.
#' @return The cleaned and transformed text string or strings vector, depending on the input format.
#' @examples
#' str <- data(example)
#' temp1 <- cleanString(str, )
#' temp2 <- cleanString(str, )
#' @export
cleanString <- function(text) {
  text %>%
    stri_encode(., from = NULL, to = "UTF-8") %>%
    str_remove_all("-\r\n\t|\t|\r|\n|\n$|^\n|-\n|  |;|           |â|, ,|
                   ^ ,  , ,  , |^ , , |^ , |^, |^, , |^, , , , |^, , , , , |
                   ^, , , , , , , ,|^, , , , , , , , , , , , , , , , , , , |
                   ^, , , , , , , , , , , , , |^, , , , , , , , , |^, , , , , , , |
                   ^, , , , , , |^, , , , , |^, , , , |^, , , |^, , |^, |^,|^: |
                   ^\\?, |^ |^ |^  , |^ , |^, |") %>%
    str_replace_all("\n+", "\n") %>%
    str_replace_all("‘", "'") %>%
    str_replace_all("’", "'") %>%
    str_replace_all("“", "\"") %>%
    str_replace_all("”", "\"") %>%
    str_replace_all("–", "-") %>%
    str_replace_all("Ã¶", "oe") %>%
    str_replace_all("Â", "") %>%
    str_replace_all("Ã©", "é") %>%
    str_remove_all("\"|,|\\\\|\\n|&nbsp") %>%
    gsub("([a-zA-Z0-9]\\.)([A-Z])", "\\1 \\2", .) %>%
    gsub("([a-zA-Z0-9]\\?)([A-Z])", "\\1 \\2", .) %>%
    gsub("([a-zA-Z0-9]\\!)([A-Z])", "\\1 \\2", .) %>%
    gsub("([a-z]\\.\\))([A-Z])", "\\1 \\2", .) %>%
    trimws()
}
