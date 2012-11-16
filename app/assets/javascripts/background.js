var images = ['breakingbad.jpg', 'breakingbad2.jpg', 'brothers.jpg', 'fringe.jpg', 'gamesofthrone.jpg', 'house.jpg', 
              'sonsofanarchy.jpg', 'sonsofanarchy2.jpg', 'tbbt.jpg', 'theoffice.jpg', 'trueblood.jpg', 'vampire.jpg',
              'walkingdead.jpg', 'walkingdead2.jpg'];
var randomimage = images[Math.floor(Math.random() * images.length)];

$(document).ready(function() {
  $("body").css("background-image", 'url(/assets/' + randomimage + ')');
});