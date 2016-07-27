$(document).ready(function() {
  $(".add-quest").click(function(e) {
    var target = e.target;
    e.preventDefault();
    $.ajax({
      url: $(target).attr("href"),
      method: "GET"
    })
    .done(function(response) {
      $(target).toggle();
      $("div.quest-holder").append(response)
    })
  })
  $(".quest-holder").submit(function(e) {
    var target = e.target;
    e.preventDefault();
    
    $.ajax({
      url: $(target).attr("action"),
      method: "post",
      data: $('form').serialize()
    })
    .done(function(response) {
      target.remove();
      $(".quest-list").append(response)
    })
  })
});