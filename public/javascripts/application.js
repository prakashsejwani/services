// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
 var oparray = new Array();
// this function is called on application.html.erb for validations
function citycompusory()
{	
	var cityop='';
	var nm='';
	cityop = $('city').getValue();
	nm = $('q').getValue();
	if(cityop == ""){
		alert("Please select a city");
		return false;	
	}
	else if(nm == ""){
		alert("Company/Category name cannot be blank");
		return false;	
	}
	else{
		return true;
	}
}

function otherCategory(){	
	if ($('other_category').checked == true){		
		$('company_other_category').show();
	}
	else{		
		$('company_other_category').hide();
	}
}
/* ----------------------------------------------------------- */
// -------------------------
// Multiple File Upload
// -------------------------
function MultiSelector(list_target, max) {
  this.list_target = list_target;this.count = 0;this.id = 0;if( max ){this.max = max;} else {this.max = -1;};this.addElement = function( element ){if( element.tagName == 'INPUT' && element.type == 'file' ){element.name = 'attachment[file_' + (this.id++) + ']';element.multi_selector = this;element.onchange = function(){var new_element = document.createElement( 'input' );new_element.type = 'file';this.parentNode.insertBefore( new_element, this );this.multi_selector.addElement( new_element );this.multi_selector.addListRow( this );this.style.position = 'absolute';this.style.left = '-1000px';};if( this.max != -1 && this.count >= this.max ){element.disabled = true;};this.count++;this.current_element = element;} else {alert( 'Error: not a file input element' );};};this.addListRow = function( element ){var new_row = document.createElement('li');var new_row_button = document.createElement( 'a' );new_row_button.title = 'Remove This image';new_row_button.href = '#';new_row_button.innerHTML = 'Remove';new_row.element = element;new_row_button.onclick= function(){this.parentNode.element.parentNode.removeChild( this.parentNode.element );this.parentNode.parentNode.removeChild( this.parentNode );this.parentNode.element.multi_selector.count--;this.parentNode.element.multi_selector.current_element.disabled = false;return false;};new_row.innerHTML = element.value.split('/')[element.value.split('/').length - 1];new_row.appendChild( new_row_button );this.list_target.appendChild( new_row );};
}
/* ----------------------------------------------------------- */
// -------------------------
// Popup screen
// -------------------------

function showAreaSelector(link_id, div_id){	
//getting the link
	var link = $(link_id);
//getting the div
	var div = $(div_id);	
//determining it's location
	var link_x = getX(link);
	var link_y = getY(link);
//moving the div to the location of the link, slightly under and to the right
	
var div_x = link_x + link.width;
var div_y = link_y + link.height;
	
//setting the div's visibility and position
div.style.display = 'block';
}

function hideAreaSelector(div_id){
//get the div
div = $(div_id)	
//set the div visibility to 'hidden'
div.style.display = 'none';
}

function getY(element){
	var y = 0;
	for( var e = element; e; e = e.offsetParent)
		//iterate the offset Parents
	{
		y += e.offsetTop; 
		//add up the offsetTop values
	}
	return y;
}
function getX(element){
	var x = 0;
	for( var e = element; e; e = e.offsetParent)
//iterate the offset Parents
	{
		x += e.offsetLeft; 
//add up the offsetTop values
	}
	return x;
}
/* ----------------------------------------------------------- */

// --- used to select all categories while saving the company ---

function allselect(){  
  for(var i=0; i<$('category_ids').options.length;i++){
    $('category_ids').options[i].defaultSelected=true;
  }
}


/*--------------------------------------*/

