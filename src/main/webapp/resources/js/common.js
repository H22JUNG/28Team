
/**
	공백체크
	입력받은 문자가 공백이나 값이 없는 경우 true 리턴
	param : String
 */
function isEmpty (str) {
	if ( str == '' || str == undefined || str == null || str == 'null' || str.trim() < 1 ) {
		return true
	} else {
		return false;
	} 
	 
}