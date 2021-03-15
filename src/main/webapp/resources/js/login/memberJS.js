(function() {
	'use strict';
	window.addEventListener('load', function() {
		
		let forms = document.getElementsByClassName('needs-validation');
    	let validation = Array.prototype.filter.call(forms, function(form) {
	    	let inCheck = form.querySelectorAll('input');
	    	let invalid = document.getElementsByClassName('invalid-feedback');
	    	
    		//아이디 유효성검사 : 영문시작+영문+숫자조합으로 5-15글자
	    	inCheck[0].addEventListener('keyup', function() {
	    		if(/^[a-z]+[a-z0-9]{4,15}$/g.test(inCheck[0].value)) {
	    			inCheck[0].classList.remove('is-invalid');
    				inCheck[0].classList.add('is-valid');
	    		} else {
	    			inCheck[0].classList.add('is-invalid');
	    			inCheck[0].classList.remove('is-valid');
	    			if(!/^[a-z]/.test(inCheck[0].value)){
	    				invalid[0].innerHTML = '아이디 첫글자는 소문자로 시작해야합니다.';
	    			} else {	    				
	    				invalid[0].innerHTML = '아이디는 5글자 이상으로 영어소문자와 숫자를 사용해주세요.';
	    			}
	    			document.getElementById('midchecker').removeAttribute('disabled', 'disabled');
	    		}
	    	}, false);
    		
    		//비밀번호 유효성검사
    		inCheck[2].addEventListener('keyup', function() {
	    		if(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}/.test(inCheck[2].value)) {
	    			inCheck[2].value = inCheck[2].value.trim();
	    			inCheck[2].classList.add('is-valid');
	    			inCheck[2].classList.remove('is-invalid');
	    		} else {
	    			inCheck[2].classList.add('is-invalid');
	    			inCheck[2].classList.remove('is-valid');
	    		}
	    	}, false);
    		
    		//비밀번호 확인
    		inCheck[3].addEventListener('keyup', function(){
    			if(inCheck[2].value==inCheck[3].value){
    				inCheck[3].classList.add('is-valid');
    				inCheck[3].classList.remove('is-invalid');
    			} else {
    				inCheck[3].classList.add('is-invalid');
    				inCheck[3].classList.remove('is-valid');
    			}
    		}, false);
    		
    		inCheck[2].addEventListener('focusout', function(){
    			if(inCheck[2].value==inCheck[3].value){
    				inCheck[3].classList.add('is-valid');
    				inCheck[3].classList.remove('is-invalid');
    			} else {
    				inCheck[3].classList.add('is-invalid');
    				inCheck[3].classList.remove('is-valid');
    			}
    		}, false);
    		
    		//별명 유효성검사
    		inCheck[5].addEventListener('keyup', function(){
    			if(/^[a-zA-Z가-힣]{2,15}$/.test(inCheck[5].value)){
    				inCheck[5].classList.add('is-valid');
    				inCheck[5].classList.remove('is-invalid');
    			} else {
    				inCheck[5].classList.add('is-invalid');
    				inCheck[5].classList.remove('is-valid');
    			}
    		}, false);
    		//휴대폰 유효성검사
    		let mPhoneChecker = document.getElementById("mphonechecker");
    		inCheck[6].addEventListener('keyup', function() {
    			if(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test(inCheck[6].value)){
    				inCheck[6].classList.add('is-invalid');
    				mPhoneChecker.removeAttribute('disabled');
    				invalid[6].innerHTML = '휴대폰을 인증해주세요.';
    			} else {
    				inCheck[6].value = inCheck[6].value.replace(/[^0-9]/gi, '');
    				inCheck[6].classList.add('is-invalid');
    				inCheck[6].classList.remove('is-valid');
    				mPhoneChecker.setAttribute('disabled', 'disabled');
    			}
    		}, false);
    		
    		//휴대폰 인증번호 발송
			mPhoneChecker.addEventListener("click", function() {
				let result = confirm(inCheck[6].value+'로 인증문자를 보냅니다.');
				if(result){
					$.ajax({
						type:'POST',
						url:"/mypage/phonecheck",
						data:{
							phone:inCheck[6].value
						},
						success:function(data){
							if(data.code == 200){
	        						mPhoneChecker.setAttribute('disabled', 'disabled');
	        						inCheck[6].setAttribute('readonly', 'readonly');
	        						inCheck[6].classList.remove('is-invalid');
	        						inCheck[6].classList.add('is-valid');
	        						inCheck[7].removeAttribute('readonly');
	        						alert('인증번호가 발송되었습니다!');
							} else {
								alert('이미 이 번호로 가입된 아이디가 있습니다.');
								inCheck[6].removeAttribute('readonly');
							}
						}
					});
				}
			});
    		
	    
    	});
	}, false);
})();