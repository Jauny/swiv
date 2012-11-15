var images = ['breakingbad.jpg', 'brothers.jpg', 'gamesofthrone.jpg', 'sonsofanarchy.jpg', 'vampire.jpg'];
var randomimage = images[Math.floor(Math.random() * images.length)];

$(document).ready(function() {
  $("body").css("background-image", 'url(/assets/' + randomimage + ')');
});