var localities = new Array()


	localities.push(new Array(1, 'Kurla (E)', 7));

	localities.push(new Array(1, 'Kurla (W)', 8));

	localities.push(new Array(1, 'MULUND EAST', 9));

	localities.push(new Array(1, 'MULUND WEST', 10));

	localities.push(new Array(1, 'Andheri (E)', 11));

	localities.push(new Array(1, 'Andheri (W)', 12));

	localities.push(new Array(1, 'MALAD', 22));

	localities.push(new Array(1, 'Churchgate ', 33));

	localities.push(new Array(1, 'Marine Lines (W) ', 34));

	localities.push(new Array(1, 'Marine Lines (E) ', 35));

	localities.push(new Array(1, 'Charni Road (W) ', 36));

	localities.push(new Array(1, 'Charni Road (E) ', 37));

	localities.push(new Array(1, 'Grant Road (W) ', 38));

	localities.push(new Array(1, 'Grant Road (E) ', 39));

	localities.push(new Array(1, 'Mumbai Central (W) ', 40));

	localities.push(new Array(1, 'Mumbai Central (E) ', 41));

	localities.push(new Array(1, 'Mahalaxmi (W) ', 42));

	localities.push(new Array(1, 'Mahalaxmi (E) ', 43));

	localities.push(new Array(1, 'Lower Parel (W) ', 44));

	localities.push(new Array(1, 'Lower Parel (E) ', 45));

	localities.push(new Array(1, 'Elphinston (E) ', 46));

	localities.push(new Array(1, 'Elphinston (W) ', 47));

	localities.push(new Array(1, 'Dadar (E) ', 48));

	localities.push(new Array(1, 'Matunga (W) ', 49));

	localities.push(new Array(1, 'Matunga (E) ', 50));

	localities.push(new Array(1, 'Mahim (W) ', 51));

	localities.push(new Array(1, 'Mahim (E) ', 52));

	localities.push(new Array(1, 'Khar (W) ', 53));

	localities.push(new Array(1, 'Khar (E) ', 54));

	localities.push(new Array(1, 'Bandra (W) ', 55));

	localities.push(new Array(1, 'Bandra (E) ', 56));

	localities.push(new Array(1, 'Santacruz (W) ', 57));

	localities.push(new Array(1, 'Santacruz (E) ', 58));

	localities.push(new Array(1, 'Vile Parle west ', 59));

	localities.push(new Array(1, 'Vile Parle East ', 60));

	localities.push(new Array(1, 'Jogeshwari (E) ', 61));

	localities.push(new Array(1, 'Jogeshwari (W) ', 62));

	localities.push(new Array(1, 'Goregaon (E) ', 63));

	localities.push(new Array(1, 'Goregaon (W) ', 64));

	localities.push(new Array(1, 'Kandivali (W) ', 65));

	localities.push(new Array(1, 'Borivali (W) ', 66));

	localities.push(new Array(1, 'Borivali (E) ', 67));

	localities.push(new Array(1, 'Dadar (W) ', 68));


function citySelected() {
 
  city_id = $('city').getValue();
  
  options = $('locality').options;
  options.length = 1;
  //alert("hi");
  localities.each(function(local) {
    if (local[0] == city_id) {
      options[options.length] = new Option(local[1], local[2]);
    }
  });
  //if (options.length == 1) { 
  //  $('location').hide();
  //} else { 
  //  $('location').show();
  //}
}

document.observe('dom:loaded', function() { 
  //alert('hi');    
  $('city').observe('change', citySelected);
  citySelected();
});

function citySelected1() {
 
  city_id = $('company_city_id').getValue();
  
  options = $('company_locality_id').options;
  options.length = 1;  
  localities.each(function(local) {
    if (local[0] == city_id) {
      options[options.length] = new Option(local[1], local[2]);
    }
  });
  
}

document.observe('dom:loaded', function() {      
  $('company_city_id').observe('change', citySelected1);
  citySelected1();
});
