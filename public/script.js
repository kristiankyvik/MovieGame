$(function() {

	$( "#search" ).click(function(evt) {
		evt.preventDefault();
		var search_word=$("#search_word").val();
	  	$.post("/search", { data: search_word  } , function(res){
	  		console.log(res);
	  		var received=JSON.parse(res)
	  		$.each( received, function( key, value ) {
	  			
	  			$("#posters").append(prep_for_html(value));
			});

	  	});});
	var prep_for_html=function(param){
	  	$("#posters").prepend($( '<img src='+ param +' alt="Smiley face" height="100" width="60">' ));
	
	}


	});





