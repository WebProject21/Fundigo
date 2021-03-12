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
	    			invalid[0].innerHTML = '아이디 중복확인을 해주세요.';
	    			document.getElementById('midchecker').removeAttribute('disabled');
	    		} else {
	    			inCheck[0].classList.add('is-invalid');
	    			inCheck[0].classList.remove('is-valid');
	    			if(!/^[a-z]/.test(inCheck[0].value)){
	    				invalid[0].innerHTML = '아이디 첫글자는 소문자로 시작해야합니다.';
	    			} else {	    				
	    				invalid[0].innerHTML = '아이디는 5글자 이상으로 영어소문자와 숫자를 사용해주세요.';
	    			}
	    			document.getElementById('midchecker').setAttribute('disabled', 'disabled');
	    		}
	    	}, false);
    		//아이디 중복검사
    		let mIdChecker = document.getElementById('midchecker');
    		mIdChecker.addEventListener('click', function(){
    			let mId = document.getElementById("mid");
    			$.ajax({
    				type : 'POST',
    				url : 'midcheck',
    				data:{
    					mid : mId.value
    				}, success:function(data){
    					if(data.code == 200){
    						let result = confirm('사용 가능한 아이디입니다. 사용하시겠습니까?');
    						if(result){
    							inCheck[0].classList.remove('is-invalid');
    							inCheck[0].classList.add('is-valid');
        						mId.setAttribute('readonly', 'readonly');
        						document.getElementById('midchecker').setAttribute('disabled', 'disabled');
    						}
    					} else {
    						alert('이미 존재하는 아이디입니다.');
    						inCheck[0].focus();
    					}
    				}
    			});
    		});
    		
    		//비밀번호 유효성검사
    		inCheck[1].addEventListener('keyup', function() {
	    		if(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}/.test(inCheck[1].value)) {
	    			inCheck[1].value = inCheck[1].value.trim();
	    			inCheck[1].classList.add('is-valid');
	    			inCheck[1].classList.remove('is-invalid');
	    		} else {
	    			inCheck[1].classList.add('is-invalid');
	    			inCheck[1].classList.remove('is-valid');
	    		}
	    	}, false);
    		
    		//비밀번호 확인
    		inCheck[2].addEventListener('keyup', function(){
    			if(inCheck[1].value==inCheck[2].value){
    				inCheck[2].classList.add('is-valid');
    				inCheck[2].classList.remove('is-invalid');
    			} else {
    				inCheck[2].classList.add('is-invalid');
    				inCheck[2].classList.remove('is-valid');
    			}
    		}, false);
    		
    		inCheck[1].addEventListener('focusout', function(){
    			if(inCheck[1].value==inCheck[2].value){
    				inCheck[2].classList.add('is-valid');
    				inCheck[2].classList.remove('is-invalid');
    			} else {
    				inCheck[2].classList.add('is-invalid');
    				inCheck[2].classList.remove('is-valid');
    			}
    		}, false);
    		
    		//별명 유효성검사
    		inCheck[3].addEventListener('keyup', function(){
    			if(/^[a-zA-Z가-힣]{2,15}$/.test(inCheck[3].value)){
    				inCheck[3].classList.add('is-valid');
    				inCheck[3].classList.remove('is-invalid');
    			} else {
    				inCheck[3].classList.add('is-invalid');
    				inCheck[3].classList.remove('is-valid');
    			}
    		}, false);
    		
    		//휴대폰 유효성검사
    		let mPhoneChecker = document.getElementById("mphonechecker");
    		inCheck[4].addEventListener('keyup', function() {
    			if(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test(inCheck[4].value)){
    				inCheck[4].classList.add('is-invalid');
    				mPhoneChecker.removeAttribute('disabled');
    				invalid[4].innerHTML = '휴대폰을 인증해주세요.';
    			} else {
    				inCheck[4].value = inCheck[4].value.replace(/[^0-9]/gi, '');
    				inCheck[4].classList.add('is-invalid');
    				inCheck[4].classList.remove('is-valid');
    				mPhoneChecker.setAttribute('disabled', 'disabled');
    			}
    		}, false);
    		
    		//휴대폰 인증번호 발송
			mPhoneChecker.addEventListener("click", function() {
				let result = confirm(inCheck[4].value+'로 인증문자를 보냅니다.');
				if(result){
					$.ajax({
						type:'POST',
						url:'phonecheck',
						data:{
							mphone:inCheck[4].value
						},
						success:function(data){
							if(data.code == 200){
	        						mPhoneChecker.setAttribute('disabled', 'disabled');
	        						inCheck[4].setAttribute('readonly', 'readonly');
	        						inCheck[4].classList.remove('is-invalid');
	        						inCheck[4].classList.add('is-valid');
	        						inCheck[5].removeAttribute('readonly');
	        						alert('인증번호가 발송되었습니다!');
							} else {
								alert('이미 이 번호로 가입된 아이디가 있습니다.');
								inCheck[4].removeAttribute('readonly');
							}
						}
					});
				}
			});
			
			//인증번호 유효성검사
			let validPhoneNumber = document.getElementById('validPhoneNumber');
			inCheck[5].addEventListener('keyup', function() {
    			if(inCheck[5].value.length==6){
    				inCheck[5].classList.add('is-invalid');
    				validPhoneNumber.removeAttribute('disabled');
    				invalid[5].innerHTML = '인증버튼을 눌러주세요.';
    			} else {
    				inCheck[5].classList.add('is-invalid');
    				inCheck[5].classList.remove('is-valid');
    				validPhoneNumber.setAttribute('disabled', 'disabled');
    			}
    		}, false);
			
    		//휴대폰 인증번호 입력
			validPhoneNumber.addEventListener('click', function(){
				let verifyNumber = inCheck[5].value;
				$.ajax({
    				type:'POST',
    				url:'phoneverify',
    				data:{
    					verifyNumber:verifyNumber
    				},
    				success:function(data){
    					if(data.code == 200){
    						alert('인증 되었습니다.');
    						inCheck[5].classList.remove('is-invalid');
    						inCheck[5].classList.add('is-valid');
    						inCheck[5].setAttribute('readonly', 'readonly');
    						validPhoneNumber.setAttribute('disabled', 'disabled');
    					} else {
    						if(data.verifyfullfail!=null){
    							inCheck[5].value = '';
    							invalid[5].innerHTML = '인증실패 한도 초과로 당분간 인증이 불가능합니다.';
    							inCheck[5].setAttribute('readonly', 'readonly');
    							inCheck[5].setAttribute('disabled', 'disabled');
    							validPhoneNumber.setAttribute('disabled', 'disabled');
    							inCheck[4].value = '';
    							invalid[4].innerHTML = '인증실패 한도 초과로 당분간 인증이 불가능합니다.';
    							inCheck[4].setAttribute('readonly', 'readonly');
    							inCheck[4].setAttribute('disabled', 'disabled');
    							inCheck[4].classList.add('is-invalid');
    							inCheck[4].classList.remove('is-valid');
    						} else{
    							invalid[5].innerHTML = '인증번호가 일치하지 않습니다. 다시 시도해주세요.('+data.verifyfail+'/3)';
    							inCheck[5].value = '';
    						}
    					}
    				}
    			});
			}, false);
    		
    		//데이터 전송 체크
    		form.addEventListener('submit', function(event) {
    			for(let i=0; i<inCheck.length; i++) {
    				if(inCheck[i].classList.contains('is-valid')===false){
    	    			inCheck[i].classList.add('is-invalid');
    					event.preventDefault();
    					event.stopPropagation();
    				}
    			}
	    	}, false);
    	});
	}, false);
})();