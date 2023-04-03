/**
 * 공통부분 함수 정의
 */

/*

// 홍두표 - 요소를 받고 값이 있으면 값을 반환, 없으면 데이터 타입에 맞는 디폴트 값 부여
getOrDefaultValue = (factor) => {
	if(factor.value) {
		return factor.value;
	}
    if(factor.type == 'text') {
        return ' ';
    }
    if(factor.type == 'textarea') {
        return ' ';
    }
    if(factor.type == 'date') {
        alert('시작일자와 종료일자를 입력해주세요.');
        return false;
    }
    if(factor.type == 'number') {
        return 0;
    }
    if(factor.type == 'hidden') {
        return ' ';
    }
}
*/
	
/* swal() 호출 함수 정의 */
function doSwal(title, content, type = "info") {
	swal(title, content, type, {
		timer : 4000,
		button : "확인"
	});
}

function delete_info(num) {
	if (num == 0) {
		doSwal("첫 행은 삭제할 수 없습니다.", "", "warning");
		return false;
	}
	document.querySelector("#child" + num).remove();
}

function first_row_check() {
	return doSwal("첫 행을 입력해주세요.", "", "warning");
}

function convertXSS(value) { 
	if (value.trim().length == 0) {
		return "";
	}
	console.log("value : " + value);
	value = value.replaceAll("& lt;", "<").replaceAll("& gt;", ">");
	value = value.replace("& #40;", "(").replace("& #41;", ")");
	value = value.replaceAll("& #44;", ",");
	value = value.replaceAll("& #39;", "'");
	value = value.replaceAll("eval\\((.*)\\)", "");
	return value;
}