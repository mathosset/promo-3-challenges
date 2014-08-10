var GRID_SIZE = 10;
var PLAYER1_KEY = 68; // D
var PLAYER2_KEY = 76; // L


$(function() {
  generate_grid(GRID_SIZE);
  give_player_hints(PLAYER1_KEY, PLAYER2_KEY);

  var session_id;
  var new_game = $("#new-game");
  var game_id;
  var last1,
      diff1;
  var last2,
      diff2;
  var player1_id,
      player2_id;

  $.getJSON( "/session/create", function( data ) {
    // console.log("Page chargée !");
    // console.log(data.id);
    session_id = data.id;
    new_game.show();
  });

  new_game.on('submit', function(event) {
    var player1 = $("#player1").val();
    var player2 = $("#player2").val();
    event.preventDefault();
    var data = JSON.stringify({
        players: [
          { name: player1 },
          { name: player2 }
        ]
      });
    $.post("/session/"+session_id+"/game/create", data, function(json) {
      new_game.hide();
      $("table").show();
      game_id = json.game.id;
      player1_id = json.game.players[0].id;
      player2_id = json.game.players[1].id;
      $(document).on('keyup', function(event) {
          // d = 68
          // l = 76
          if (event.which == PLAYER1_KEY) {
              if (last1) {
                diff1 = event.timeStamp - last1;
              }
              last1 = event.timeStamp;
              update_player_position("player1", 1, player1_id, diff1);
          }
          if (event.which == PLAYER2_KEY) {
              if (last2) {
                diff2 = event.timeStamp - last2;
              }
              last2 = event.timeStamp
              update_player_position("player2", 1, player2_id, diff2);
          }
      });
    });
  });

  function update_player_position(player, number, playerid, time) {
      var cases  = $('#' + player + '_race td'),
          length = cases.length,
          previous_position = cases.siblings('.active').index();

      cases.removeClass('active');
      cases.eq(previous_position + number).addClass('active');

      console.log(previous_position + number, length);
      if ((previous_position + number) >= length) {
          alert(player + ' has won ! time:' + time);
          var data = JSON.stringify({
                winner: playerid,
                elapsed_time: time
            });
          $.post("/game/"+game_id+"/finish", data, function(json) {
          });
          $.get("/game/"+game_id+"/results", function(data) {
            $("table").hide();
            $("#result").append("<br>"+"Winner is: "+ player + " - Time is:"+ time);
            $("#btn-start").show();

          });
          $("#btn-start").on('click', function() {
            reset();
            $("#btn-start").hide();
            $("table").show();
          });
          $.get("/session/"+session_id+"/games", function(data) {
            console.log("sessions:"+data);
          });
      }
  }
});

function generate_grid(size) {
  for (var i = 0; i < size - 1; i++) {
    $('#player1_race').append('<td></td>');
    $('#player2_race').append('<td></td>');
  }
}

function give_player_hints(player1_key, player2_key) {
  $('#player1_hint').html('Player 1: Hit <strong>' + String.fromCharCode(player1_key) + '</strong>');
  $('#player2_hint').html('Player 2: Hit <strong>' + String.fromCharCode(player2_key) + '</strong>');
}

function reset() {
    $('.racer_table td').removeClass('active');
    $('#player1_race td:first-child').addClass('active');
    $('#player2_race td:first-child').addClass('active');
}