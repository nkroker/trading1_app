function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('.profilepic').attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
	}
}


$(document).on('click', '.profilepic', function(){
	$(".file-uploader").click();
})



function playsound(){
	var audio = new Audio('/assets/cashreg.wav');
	audio.play();
}