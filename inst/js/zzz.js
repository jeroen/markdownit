function mdrender(txt, options, inline){
  //enable highlight.js syntax highlighting
  if(options.highlight === true){
    options.highlight = function (str, lang) {
      if (lang && hljs.getLanguage(lang)) {
        try {
          return hljs.highlight(lang, str).value;
        } catch (__) {}
      }

      try {
        return hljs.highlightAuto(str).value;
      } catch (__) {}

      return ''; // use external default escaping
    };
  }

  //render
  var md = MarkdownIt(options);
  return inline ? md.renderInline(txt) : md.render(txt);
}
