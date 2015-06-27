function doLayout() {
  var my_canvas = document.getElementById("layout_canvas");
  canvas_context = my_canvas.getContext("2d");

  canvas_context.globalAlpha =0.5;
  var pic = new Image();
  //pic.src = "media/elborn_logo.png";
  pic.src = "http://farm6.staticflickr.com/5225/5605922398_ff3c8cbedc_z.jpg";
  pic.addEventListener("load", function(){ 
                                canvas_context.drawImage(pic,0,0, my_canvas.width, my_canvas.height)
                               }, false);
}

window.addEventListener("load", doLayout, false);

// $('[data-tab]').on('click', function (e) {
// $(this).addClass('active').siblings('[data-tab]').removeClass('active')
// $(this).siblings('[data-content=' + $(this).data('tab') + ']').addClass('active').siblings('[data-content]').removeClass('active')
//  e.preventDefault()
// })


$(document).ready(function(){
  console.log("ready!");
  $('[data-tab]').on('click', function(){
    console.log("onclick event");
    $(this).addClass('tab_active');
    console.log("addClass tab_active ");
    $(this).siblings('[data-tab]').removeClass('tab_active');
    console.log("removeClass tab_active ");
    //$(this).siblings('[data-content]').removeClass('content_active')
  });
});
