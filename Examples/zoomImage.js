$(document).ready(function() {
  $('slides').prepend("<div class=\"zoomDiv\"><img src=\"\" class=\"zoomImg\"></div>");
  // onClick function for all plots (img's)
      $('img:not(.zoomImg)').click(function() {
                                            $('.zoomImg').attr('src', $(this).attr('src'));
                                            $('.zoomDiv').css({opacity: '1', width: '60%'});
                                          }
                                );
                                
  // onClick function for zoomImg
      $('img.zoomImg').click(function() {
                                     $('.zoomDiv').css({opacity: '0', width: '0%'});
                                     }
                        );
});