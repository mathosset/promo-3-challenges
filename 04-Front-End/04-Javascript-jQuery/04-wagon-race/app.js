function reset () {
  $('#player1, #player2')
    .find('.active')
      .removeClass('active')
    .end()
    .find('td:first-child')
      .addClass('active');
}


function forward(player_id) {
  var row = $(player_id);
  var active = row.find('.active');
  var next = active.next();
  var last = row.find('td:last-child');

  next.addClass('active');
  active.removeClass('active');

  if (next.is(':last-child')) {
    var player_name = player_id.match(/#(.+)/)[1];
    alert(player_name + "wins!");
  }
  // console.debug('next', active.next());
}
$(document).ready(function() {
  $(document).on('keyup', function(event) {
    // console.log(event);
    if (event.keyCode == 65){
      forward('#player1');
    }
    else if (event.keyCode == 80){
      forward('#player2');
    }
  });
});

    //   var i = $('#player1_race .active').index();
    //   $('#player1_race .active').removeClass('active');
    //   $('#player1_race td').eq(i+1).addClass('active');

    // }
    //   var i = $('#player2_race .active').index();
    //   $('#player2_race .active').removeClass('active');
    //   $('#player2_race td').eq(i+1).addClass('active');
    // }
