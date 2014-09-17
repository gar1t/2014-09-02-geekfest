-module(index).

data(_) ->
    #{
      title       => "What's the Deal with Functional Programming?",
      description => "A presentation by Garrett Smith at Geekfest, "
                     "Groupon on Sept 2, 2014",
      where       => "Geekfest, Chicago",
      date        => "Sept 2, 2014",
      author      => "Garrett Smith",
      twitter     => "gar1t",
      blog        => "http://gar1t.com",

      transition  => "fade",
      theme       => "night",

      slides      => {apply, fun slides/1, {markdown, "slides.md"}}
     }.

slides(Markdown) ->
    format_slides(lpad_markdown:to_html(Markdown)).

format_slides(HTML) ->
    re:split(HTML, "<hr />").

site(_) ->
    #{
      "presentation/index.html" => {template, "templates/index.html"},
      "presentation"            => {dir,      "static"}
     }.
