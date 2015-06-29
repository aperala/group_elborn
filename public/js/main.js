function doLayout() {
  var my_canvas = document.getElementById("layout_canvas");
  canvas_context = my_canvas.getContext("2d");

  canvas_context.globalAlpha = 0.8;
  var pic = new Image();
  pic.src = "http://www.trbimg.com/img-53a3362b/turbine/hm-el-pulpo-restaurant-tapas-bar-southington-20140619";
  pic.addEventListener("load", function(){ 
                                canvas_context.drawImage(pic,0,0, my_canvas.width, my_canvas.height)
                               }, false);
}

window.addEventListener("load", doLayout, false);

function showHideTab(whichTab) {
  if ( whichTab == "food") {
    document.getElementById('food').style.display = "block";
    document.getElementById('drink').style.display = "none";
  }
  else {
    document.getElementById('food').style.display = "none";
    document.getElementById('drink').style.display = "block";
  }
}

function validateTelNum(eventIn, valIn) {
  console.log("valIn " + valIn );

  if ( typeof valIn != 'undefined' ) {
    // Strip spaces from the valIn (phone number)
    valIn = valIn.replace(/ /g,'');
    console.log("valIn " + valIn + " valIn.length: " + valIn.length);

    // Either cast the phone number as local (10 digits) or international (12 digits prefixed with + sign)
    // regex applied is for Spain telephone number formats
    if ( valIn.length == 10 ) {
      var phoneRegex = /^\d{3}[\ ]\d{3}[\ ]\d{4}$/;
      console.log("Doing the local number validation: " + phoneRegex);
      console.log("phoneRegex.test(valIn) " + phoneRegex.test(valIn) );
      var tempVar = valIn.slice(0,3) + " " + valIn.slice(3,6) + " " + valIn.slice(6,10);
    } else if ( valIn.length == 13 ) {
      var phoneRegex = /^\+\d{2}[\ ]\d{3}[\ ]\d{3}[\ ]\d{4}$/; 
      console.log("Doing the international number validation: " + phoneRegex);
      console.log("phoneRegex.test(valIn) " + phoneRegex.test(valIn) );
      var tempVar = valIn.slice(0,3) + " " + valIn.slice(3,6) + " " + valIn.slice(6,9) + " " + valIn.slice(9,13);
    } else {
      // If the phone number is not 10 or 13 chars, it is an invalid number - throw error msg on form
      console.log("1 Not a valid phone number");
      console.log(phoneRegex + " " + valIn + " Please enter a phone number in format xxx xxx xxxx or +xx xxx xxx xxxx");
      alert("Error: Please enter phone number in format xxx xxx xxxx or +xx xxx xxx xxxx");
      // Prevent the default submit behavior on the form
      eventIn.preventDefault();
    }
  
    if ( tempVar ) {
      if ( phoneRegex.test(tempVar) ) {
        console.log("valid phone format for Spain");
        console.log("tempVar: " + tempVar);
        var result = tempVar;
        // Pass the value back to the jquery call to set the value of the form field to the formatted number
      }
      else {
        console.log("2 Not a valid phone number");
        console.log(phoneRegex + " " + valIn + " Please enter a phone number in format xxx xxx xxxx or +xx xxx xxx xxxx");
        alert("error");
        // Prevent the default submit behavior on the form
        eventIn.preventDefault();
      }
      console.log("result : " + result);
      return result;
    }
  }
  else {
    // prevent the default submit behavior on the form
    eventIn.preventDefault();
  }
}

$(document).ready(function(){
  console.log("ready!");
  // Can validate individual fields when onblur event fires
  // OR can validate all fields on submit
  $('#form_reservation').on('submit', function(event){ 
                var thisEvent = event;
                var this_tel_num = $("input[name='res_contact']",this).val(); 
                console.log("this_tel_num : " + this_tel_num);
                var valOut = validateTelNum(thisEvent, this_tel_num); 
                console.log("valOut = " + valOut);
                if ( typeof valOut != 'undefined' ) {
                  $("input[name='res_contact']").val(valOut); 
                }
                console.log("reservation validateTelNum done!");
              });
  


$('#contact_form').on('submit', function(event){ 
                var thisEvent = event;
                var this_tel_num = $("input[name='telnum']",this).val(); 
                console.log("this_tel_num : " + this_tel_num);
                var valOut = validateTelNum(thisEvent, this_tel_num); 
                console.log("valOut = " + valOut);
                if ( typeof valOut != 'undefined' ) {
                  $("input[name='telnum']").val(valOut); 
                }
                console.log("contact validateTelNum done!");
              });
});


