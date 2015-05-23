#' Render markdown to HTML
#'
#' Renders markdown text to HTML using \href{https://github.com/markdown-it/markdown-it}{markdown-it}
#'
#' @export
#' @param md input markdown text
#' @param html enable HTML tags in source
#' @param xhtmlOut use \code{'/'} to close single tags (\code{<br />}).
#' @param breaks convert \code{'\\n'} in paragraphs into \code{<br>}
#' @param langPrefix CSS language prefix for fenced blocks
#' @param linkify autoconvert URL-like text to links
#' @param typographer enable some language-neutral replacement + quotes beautification
#' @param quotes double + single quotes replacement pairs, when typographer enabled and smartquotes on.
#' Set doubles to \code{'«»'} for Russian, \code{'„“'} for German.
#' @param highlight enable highlight.js syntax coloring
#' @param inline render inline (without paragraths & blocks)
markdownit <- function(md, html = FALSE, xhtmlOut = FALSE, breaks = FALSE, langPrefix = "language-",
  linkify = FALSE, typographer = FALSE, quotes = '“”‘’', highlight = TRUE, inline = FALSE) {
  options = list(
    html = html,
    xhtmlOut = xhtmlOut,
    breaks = breaks,
    langPrefix = langPrefix,
    linkify = linkify,
    typographer = typographer,
    quotes = quotes,
    highlight = highlight
  )
  ct$call("mdrender", paste(md, collapse = "\n"), options, inline)
}
