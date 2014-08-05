$(function() {
  $("img").click(function() {
    $("body").append("<div class='black'></div>");
    var src = $(this).attr("src");
    var img = $('<img/>').attr( {src: src});
    $("body").append($("<div class='my-modal'></div>").append(img));
  });
  $(document).on("click", ".my-modal", function(){
    $(".my-modal").remove();
    $(".black").remove();
  });


  // $('#wrapper img').mouseenter(function() {
  //   $('#wrapper img').animate({
  //     height: '+=500px',
  //     width: '+=500px'
  //   })
  // });

  // $('#wrapper img').mouseleave(function() {
  //   $('#wrapper img').animate({
  //     height: '-=500px',
  //     width: '-=500px'
  //   })
  // });
});