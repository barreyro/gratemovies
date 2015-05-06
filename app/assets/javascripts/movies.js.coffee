$.ajax(url: "http://api.themoviedb.org/3/movie/id").done (html) ->
  $(".results").append html