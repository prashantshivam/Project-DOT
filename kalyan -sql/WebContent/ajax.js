$(document).ready(function() {
	$('#path').click(function(event) {
		var name = $('#ipath').val();
		var name2=$('#ip').val();
		$.get('result1.jsp', {
			path : name,
			pid :name2,
			isparent : false
		}, function(responseText) {
			$('#display').html(responseText);
		});
	});
});
