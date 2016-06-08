$(function(){

  function addBorder(){
    $('.all-form-no-border .form-control').each(function(input){
      if ($(this).val() !== '') {
        $(this).addClass('all-form-border-left');
      } else {
        $(this).removeClass('all-form-border-left')
      };
    });
  }

  addBorder();

  $('.all-form-no-border .form-control').focusout(function(){
    addBorder();
  });

});
