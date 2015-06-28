function doLayout() {
  var my_canvas = document.getElementById("layout_canvas");
  canvas_context = my_canvas.getContext("2d");

  canvas_context.globalAlpha = 0.8;
  //if ( whichPage == "all" ) {
  var pic = new Image();
  pic.src = "http://www.trbimg.com/img-53a3362b/turbine/hm-el-pulpo-restaurant-tapas-bar-southington-20140619";
 
    //pic.src = "http://farm6.staticflickr.com/5225/5605922398_ff3c8cbedc_z.jpg";
  //}
  //else {
  //var pic = new Image();
    //pic.src = "http://www.trbimg.com/img-53a3362b/turbine/hm-el-pulpo-restaurant-tapas-bar-southington-20140619";
  //}
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

function doLayout_menu(){
  alert("got here");
  var my_canvas = document.getElementById("layout_canvas");
  canvas_context = my_canvas.getContext("2d");

  canvas_context.globalAlpha = 0.8;
  var pic = new Image();
  pic.src = "media/elborn_logo.png"
  //"http://www.trbimg.com/img-53a3362b/turbine/hm-el-pulpo-restaurant-tapas-bar-southington-20140619";
 
  canvas_context.drawImage(pic,0,0, my_canvas.width, my_canvas.height);
}

function showHideTab(whichTab) {
  //alert("a: " + whichTab);
  if ( whichTab == "food") {
    document.getElementById('food').style.display = "block";
    document.getElementById('drink').style.display = "none";
  }
  else {
    document.getElementById('food').style.display = "none";
    document.getElementById('drink').style.display = "block";
  }

}

$(document).ready(function(){
  console.log("ready!");
});
