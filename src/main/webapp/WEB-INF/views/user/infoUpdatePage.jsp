<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="header.jsp"></jsp:include>
<title>답인사 | 기본회원정보</title>
<style>
.profile_info {
	text-align: center;
}

.user-delete {
	margin-top: 100px;
	font-size: 20px;
	margin-bottom: 20px;
}

.input_txt {
	width: 250px;
	border: 0;
	border-bottom: 1px solid #606060;
}

#user-title {
	padding-bottom: 30px;
}

.input_title {
	color: gray;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#change-btn").click(function(){
		$(".modify").toggle();
	});
	$("#change-btn-phone").click(function(){
		$(".modify-phone").toggle();
	});
	$("#change-btn-email").click(function(){
		$(".modify-email").toggle();
	});
});
</script>
</head>
<body>

	<div class="profile_info">
		<h2 id="user-title">회원 정보</h2>
		<div class="profile_group">
			<h4 class="group_title">로그인 정보</h4>
			<div>
				<h5 class="title-id">아이디</h5>
				<p class="desc_id">
					<strong>${mDto.m_id }</strong>
				</p>
			</div>

		</div>
		<div class="unit">
			<h5 class="title">비밀번호</h5>
			<p class="desc password">
				<strong>************</strong>
			</p>
			<button type="button" class="btn btn_modify outlinegrey small"
				id="change-btn">변경</button>
		</div>
		<form>
			<div class="modify" style=" display: none;">
				<h5 class="title">비밀번호 변경</h5>
				<div class="input_box">
					<h6 class="input_title">현재 비밀번호</h6>
					<div class="input_item">
						<input type="password" placeholder="영문, 숫자 조합 8-16자"
							autocomplete="off" class="input_txt">
					</div>

				</div>
				<div class="input_box">
					<h6 class="input_title">새 비밀번호</h6>
					<div  class="input_item">
						<input type="password" placeholder="영문, 숫자 조합 8-16자"
							autocomplete="off" class="input_txt">
					</div>
					<br>
				</div>
				<div class="modify_btn_box">
					<button type="button" class="btn outlinegrey medium" slot="button"
						id="cancle-btn">취소</button>
					<button type="button" class="save-btn"
						slot="button">저장</button>
				</div>
			</div>
		</form>
		<div class="profile_group">
			<h4 class="group_title">개인 정보</h4>
			<div class="unit">
				<h5 class="title">이름</h5>
				<p class="desc">
					<strong>${mDto.m_name }</strong>
				</p>

			</div>
		</div>

		<div class="unit">
			<h5 class="title">휴대폰 번호</h5>
			<p class="desc">
				<strong>${mDto.m_phone }</strong>
			</p>
			<button type="button" class="change-btn"
				id="change-btn-phone">변경</button>
		</div>

		<form>
			<div class="modify-phone" style="display: none;">
				<div class="input_box">
					<h6 class="input_title">휴대폰번호 변경</h6>
					<div class="input_item">
						<input type="text" autocomplete="off" class="input_txt"
							placeholder="예)01012341234">

						<div class="phone_btn_box">
							<button type="button" id="cancle-btn"
								class="btn outlinegrey medium">취소</button>
							<button type="button" id="change-btn"
								class="password-change-btn">변경</button>
						</div>


					</div>
				</div>
			</div>
		</form>


		<div class="unit">
			<h5 class="title">이메일 주소</h5>
			<p class="desc email">
				<strong>${mDto.m_email }</strong>
			</p>
			<button type="button" class="btn btn_modify outlinegrey small"
				id="change-btn-email">변경</button>
		</div>



		<form>
			<div class="modify-email" style="display: none;">
				<div class="input_box">
					<h6 class="input_title">이메일 주소 변경</h6>
					<div class="input_item">
						<input type="email" autocomplete="off" class="input_txt"
							placeholder="예)dabyinsa@dabyinsa.com">
					</div>
					<p class="input_error"></p>
				</div>
				<div class="modify_btn_box">
					<button type="button" id="" class="btn outlinegrey medium"
						>취소</button>
					<button type="button" class="email-change-btn"
						>변경</button>
				</div>
			</div>
		</form>


		<div class="user-delete">
			<a href="#">회원탈퇴</a>
		</div>
	</div>



	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>