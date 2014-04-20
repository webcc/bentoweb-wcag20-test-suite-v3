
var CHECKED = "resources/images/sc4.1.2_l1_208_checked.gif";
var UNCHECKED = "resources/images/sc4.1.2_l1_208_unchecked.gif";

function toggleCheckbox(imgId) {
  var theImg = document.getElementById(imgId);
  //alert("imgId = " + imgId );
 
  if ( theImg.src.lastIndexOf(CHECKED)!= -1 ) {
    theImg.src = UNCHECKED;
    // additional code ...
  }
  else {
    theImg.src = CHECKED;
    // additional code ...
  }
}
