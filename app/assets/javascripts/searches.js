$(document).ready(function() {


// $( ".submit-button > input" ).click(function() {
//   // alert( "Handler for .click() called." );
//   $('#loading').css('visibility', 'visible');
// });

$("form").on("submit", function(e) {
  e.preventDefault();
  $(".flex-items-default").remove();
  var category = $("#category option:selected").val();
  var radius = $("#radius option:selected").val();
  console.log(radius);
});

});