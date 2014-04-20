function isValidEmail(email, required) {
    if (required==undefined) {   
        required=true;
    }
    if (email==null) {
        if (required) {
            return false;
        }
        return true;
    }
    if (email.length==0) {  
        if (required) {
            return false;
        }
        return true;
    }
    if (! allValidChars(email)) {  
        return false;
    }
    if (email.indexOf("@") < 1) { 
        return false;
    } else if (email.lastIndexOf(".") <= email.indexOf("@")) {  
        return false;
    } else if (email.indexOf("@") == email.length) {  
        return false;
    } else if (email.indexOf("..") >=0) { 
	return false;
    } else if (email.indexOf(".") == email.length) {  
	return false;
    }
    return true;
}

function allValidChars(email) {
  var parsed = true;
  var validchars = "abcdefghijklmnopqrstuvwxyz0123456789@.-_";
  for (var i=0; i < email.length; i++) {
    var letter = email.charAt(i).toLowerCase();
    if (validchars.indexOf(letter) != -1)
      continue;
    parsed = false;
    break;
  }
  return parsed;
}

function checkDate()
{
	var monthLength = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	var date = document.getElementById("id1").value;
	
	if (date=="") {
		return "Please check the following item and try again: The date field is required.";
	}

	var tmp = new Array();
	tmp = date.split('/');
	var day = parseInt(tmp[0]);
	var month = parseInt(tmp[1]);
	var year = parseInt(tmp[2]);

	if (!day || !month || !year) {
		return "Please check the following item and try again: The date format is not valid.";
	}

	if (month<1 || month>12) {
		return "Please check the following item and try again: Month can only be a value between 1 and 12.";
	}

	if (year/4 == parseInt(year/4)) {
		monthLength[1] = 29;
	}

	if (day > monthLength[month-1]) {
		return "Please check the following item and try again: The value for the day seems to be invalid.";
	}
	
	if (tmp[0].length != 2) {
		return "Please check the following item and try again: The value for the day must be of format DD";
	}
	if (tmp[1].length != 2) {
		return "Please check the following item and try again: The value for the month must be of format MM";
	}
	if (tmp[2].length != 4) {
		return "Please check the following item and try again: The value for the year must be of format YYYY";
	}

	monthLength[1] = 28;

	var now = new Date();
	now = now.getTime(); //NN3

	var dateToCheck = new Date();
	dateToCheck.setYear(year);
	dateToCheck.setMonth(month-1);
	dateToCheck.setDate(day);
	var checkDate = dateToCheck.getTime();

	if (now <= checkDate) {
		return "Please check the following item and try again: Entered date is in the future.";
	}
	return true;
}

function createLiEl(msg1, msg2, msg3, msg4, url)
{
    var liEl = document.createElement('li');
    var strongEl = document.createElement('strong');
    var text1 = document.createTextNode(msg1);
    strongEl.appendChild(text1);
    var text2 = document.createTextNode(msg2);
    var aEl = document.createElement('a');
    aEl.href = url;
    aEl.appendChild(text2);
    strongEl.appendChild(aEl);
    var text3 = document.createTextNode(msg3);
    strongEl.appendChild(text3);
    liEl.appendChild(strongEl);
    if (msg4 != null)
    {
	    var text4 = document.createTextNode(" " + msg4);
	    liEl.appendChild(text4);
	}
    return liEl;
}

function checkDate1()
{
	var monthLength = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	var date = document.getElementById("id1").value;
	
	var divEl = document.createElement('div');
	divEl.appendChild(document.createTextNode('Registration was not successful.'));
	divEl.appendChild(document.createElement('br'));
	divEl.appendChild(document.createElement('br'));
	divEl.appendChild(document.createTextNode('The form is redisplayed with incorrect fields identified by: '));
	var icon = document.createElement('img');
	icon.src='resources/images/alert_icon.gif';
	icon.alt='**';
	divEl.appendChild(icon);
	divEl.appendChild(document.createTextNode('.'));
	divEl.appendChild(document.createElement('br'));
	divEl.appendChild(document.createElement('br'));
	divEl.appendChild(document.createTextNode('Please check the following item(s) and try again:'));
	var olEl = document.createElement('ol');
	divEl.appendChild(olEl);
	divEl.setAttribute('id', 'error');
	if (date=="") {
	    var liEl = document.createElement('li');
        var strongEl = document.createElement('strong');
	    var liText = document.createTextNode('The date field is required.');
	    strongEl.appendChild(liText);
	    liEl.appendChild(strongEl);
	    olEl.appendChild(liEl);
	    return divEl;
	}

	var tmp = new Array();
	tmp = date.split('/');
	var dayStr = tmp[0];
	var monthStr = tmp.length > 1 ? tmp[1] : "";
	var yearStr = tmp.length > 2 ? tmp[2] : "";
	var day = parseInt(tmp[0]);
	var month = monthStr.length > 0 ? parseInt(monthStr) : -1;
	var year = yearStr.length > 0 ? parseInt(yearStr) : -1;

	if (year/4 == parseInt(year/4)) {
		monthLength[1] = 29;
	}

	if (!day || !month || !year) {
	    var msg1 = "Please check the following item and try again: The ";
	    var msg2 = "date";
	    var msg3 = " format is not valid.";
	    var msg4 = null;
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}

	if (tmp[0].length != 2) {
		var msg1 = "The format for ";
		var msg2 = "day";
		var msg3 = " in the field 'Date of birth' does not seem to be valid.";
		var msg4 = "It must be of format 'dd' (e.g. 01, 28).";
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}
	if ((day > 31) || (day > monthLength[month-1])) {
		var msg1 = "The value for the ";
		var msg2 = "day";
		var msg3 = " in the field 'Date of birth' is out of range.";
		var msg4 = "Allowed values are between 01 and 31, depending on the month.";
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}
	
	if (monthStr.length != 2) {
		var msg1 = "The format for ";
		var msg2 = "month";
		var msg3 = " in the field 'Date of birth' does not seem to be valid.";
		var msg4 = "It must be of format 'mm' (e.g. 01, 12).";
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}
	if (month<1 || month>12) {
		var msg1 = "The value for the ";
		var msg2 = "Month";
		var msg3 = " in the field 'Date of birth' is out of range.";
		var msg4 = "Allowed values are between 01 and 12.";
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}

	if (yearStr.length != 4) {
		var msg1 = "The format for ";
		var msg2 = "year";
		var msg3 = " in the field 'Date of birth' does not seem to be valid.";
		var msg4 = "It must be of format 'yyyy' (e.g. 1977, 2003).";
	    olEl.appendChild(createLiEl(msg1, msg2, msg3, msg4, '#id1'));
	}
	if (olEl.hasChildNodes())
	{
	    return divEl;
	}
	return true;
}

function clearNode(node) {
	while(node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}


// deprecated

function simplecheck() {
    var errStr="";
    var month = document.getElementById("id1").value;
    var day = document.getElementById("id2").value;
    var year = document.getElementById("id3").value;
    var i=0;
    
    if ((month=="")||(day=="")||(year=="")) {
      alert("error: Date is incomplete")
      return;
    }
    
    if (!isInteger(month)) {
        errStr="month";
        i++;
    }
    if (!isInteger(day)) {
        errStr+= (errStr=="")?"day":", day";
        i++;
    }
    if (!isInteger(year)) {
        errStr+= (errStr=="")?"year":", year";
        i++;
    }
    if (i==1)
        alert("error: "+errStr+": seems not to a number");
    if (i>1)
        alert("error: "+errStr+": seems not to be numbers");

}

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
