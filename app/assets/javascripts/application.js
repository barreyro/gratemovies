// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function () {
  var $sortedResults = $("#sortedResults");

  $("form").on("submit", function (event) {
    event.preventDefault();
    var $buttons = $("#sortButtons");
    $sortedResults.empty();
    var query = this.searchKeyword.value;

    $.getJSON("http://www.omdbapi.com/", {s:query}, function (data) {
      var $results = $("#results").empty();

      if (data.Error) {
        $results.html("No movies found.");
      } else {
        data.Search.forEach(function (movie) {
          var li = $("<li></li>");
          var a = $("<a></a>");
          a.text(movie.Title);
          a.attr("href", "#");
          a.on("click", function (event) {
            $sortedResults.empty();
            $.getJSON("http://www.omdbapi.com/", {i:movie.imdbID}, function (movieAttr) {
              console.log(movieAttr);
              var genre = movieAttr.Genre;
              var releaseDate = movieAttr.Released;
              // var link = $("<a></a>");
              // link.text(movieAttr.Title);
              link.attr("href", "#");
              $sortedResults.html(genre + " " + releaseDate);
              // $sortedResults.apped(link);
            });
          });
          li.append(a);
          $results.append(li);
        });
      }

    });
  });
});