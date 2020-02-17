$(function(){
  // trigger payment description and fields on selection
  $('form#payment input[type="radio"]').change(function(){
    $('.payment-option-details').addClass('d-none');
    $(this).closest('.payment-option').find('.payment-option-details').removeClass('d-none');
  });

  // ajaxify checkout steps
  $('body').on('submit', '#content form', function(){
    $('#content').css('opacity', '0.75');
  })
});