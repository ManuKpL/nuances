$(function(){
  $(window).scroll(function(){
    if ($(this).scrollTop() > 275) { $('.navbar').css('background', 'rgba(9,12,155,0)')}
    else if ($(this).scrollTop() > 250) { $('.navbar').css('background', 'rgba(9,12,155,0.1)')}
    else if ($(this).scrollTop() > 225) { $('.navbar').css('background', 'rgba(9,12,155,0.2)')}
    else if ($(this).scrollTop() > 200) { $('.navbar').css('background', 'rgba(9,12,155,0.3)')}
    else if ($(this).scrollTop() > 175) { $('.navbar').css('background', 'rgba(9,12,155,0.4)')}
    else if ($(this).scrollTop() > 150) { $('.navbar').css('background', 'rgba(9,12,155,0.5)')}
    else if ($(this).scrollTop() > 125) { $('.navbar').css('background', 'rgba(9,12,155,0.6)')}
    else if ($(this).scrollTop() > 100) { $('.navbar').css('background', 'rgba(9,12,155,0.7)')}
    else if ($(this).scrollTop() > 75) { $('.navbar').css('background', 'rgba(9,12,155,0.8)')}
    else if ($(this).scrollTop() > 50) { $('.navbar').css('background', 'rgba(9,12,155,0.9)')}
    else { $('.navbar').css('background', 'rgba(9,12,155,1)')}
  });
});
