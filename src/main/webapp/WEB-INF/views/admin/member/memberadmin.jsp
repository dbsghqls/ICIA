<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>고객 관리</title>
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css"
	media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/themes/ec-date-picker.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#eBtnInit").click(function() {
			$("#reset_script").each(function() {
				this.reset();
			});
		});

	});
	

	
	function allSelect(chkall)  {
		  const checkboxes 
		       = document.getElementsByName('check');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = chkall.checked;
		  })
		};
		
		
	
		function deleteValue() {
			var url = "/admin/delete";
			var valueArr = new Array();
			var list = $("input[name='check']");
			
			for (var i = 0; i < list.length; i++) {
				if(list[i].checked){
					console.log(valueArr);
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("선택된 고객이 없습니다.");
			}
			else{
				var check = confirm("정말 삭제하시겠습니까? 삭제된 고객은 다시 복구할 수 없습니다.");
				if(check == true){
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success: function(jdata){
						if(jdata = 1){
							alert("삭제 성공");
							location.replace("memberadmin")
						}
						else{
							alert("삭제 실패");
						}
					},
					
					error: function(error){
						alert(JSON.stringify(error));
					}
				});
			}
			else{
				alert("취소하였습니다.");
				$("#chk").prop("checked", false);
			}
			
			}
		
		};
		
		



</script>
</head>
<body>
	<form name="frm" method="get" action="memberadmin" id="reset_script">
		<!-- content -->
		<div id="content">
			<!-- 참고 : Frame 구분 시 컨텐츠 시작 -->
			<div class="headingArea">
				<div class="mTitle">
					<h1>고객 관리</h1>
					<span class="cManual eSmartMode" code="OD.AO"></span>
				</div>
				<div class="mBreadcrumb"></div>
			</div>
			<div class="optionArea " id="QA_deposit1">


				<div class="mOption">
					<table border="1" summary="">
						<caption>회원 정보 조회</caption>
						<colgroup>
							<col style="width: 145px;">
							<col style="width: auto;">
							<col style="width: 145px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">검색어</th>
								<td colspan="3"><select name="msearchOption"
									class="fSelect">
										<option value="m_id">아이디</option>
										<option value="m_name">이름</option>
										<option value="m_phone">전화번호</option>
								</select> <input type="text" name="mkeyword" class="fText"
									style="width: 240px;" /></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="mButton gCenter">
					<input type="submit" class="btnSearch" id="search" value="검색" />
					<div id="ordProgress" class="mLoading">
						<p>처리중입니다. 잠시만 기다려 주세요.</p>
						<img
							src="//img.echosting.cafe24.com/ec/mode/influencer/common/ico_loading.gif"
							alt="" />
					</div>
				</div>

				<input type="hidden" name="main_search" id="main_search" value="" />
			</div>

			<!--No delete -->
			<div id="ordOption1" class="mLayer gMedium"></div>
			<div id="ordOption2" class="mLayer gMedium"></div>
			<div id="ordOption3" class="mLayer gMedium"></div>
			<div id="layerOrderPath" class="mLayer gSmall"
				style="opacity: 1; top: 590px; left: 532px; margin-left: 0px; display: none;">
			</div>
			<div id="layerCompany" class="mLayer gSmall"
				style="display: none; opacity: 1;"></div>
			<div id="layerMethod" class="mLayer gSmall"
				style="display: none; opacity: 1;"></div>
			<!--No delete -->



			<div class="section" id="QA_inquiry2">
				<div class="mTitle">
					<h2>고객 목록</h2>
					<div class="cTip" code="CU.MM.MS.70"></div>
				</div>
				<div class="mState">
					<div class="gLeft">
						<p class="total">
							[총 회원 수 <strong>${map.scount}</strong>명] 검색 결과 <strong>${map.count}</strong>건
						</p>
					</div>
				</div>
				<div class="mCtrl typeHeader">
					<div class="gLeft">
						 <span>
						<a href="#none" class="btnNormal" onclick="deleteValue();">
								<em class="icoDel"> </em> 삭제
						</a>
						</span>
					</div>
				</div>
				<div class="mBoard gScroll gCellNarrow typeList">
					<table border="1" id="memberList" class="eChkColor"
						style="text-align: center;">
						<caption>고객 목록</caption>
						<colgroup>
							<col class="chk">
							<col style="width: 70px">
							<col style="width: 100px">
							<col style="width: 70px">
							<col style="width: 70px">
							<col style="width: 100px">
							<col style="width: 100px">
							<col style="width: 100px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" class="chkall"
									onclick="allSelect(this);"></th>
								<th scope="col">이름</th>
								<th scope="col"><strong class="array "><span>아이디</span>
								</strong></th>
								<th scope="col"><strong class="array "><span>등급</span>
								</strong></th>
								<th scope="col"><strong class="array "><span>가입일</span>
								</strong></th>
								<th scope="col"><strong class="array "><span>전화번호</span>
								</strong></th>
								<th scope="col"><strong class="array "><span>주소</span>
								</strong></th>
								<th scope="col"><strong class="array "><span>메모</span>
								</strong></th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${map.count != 0}">
								<c:forEach items="${map.mList}" var="mList">
									<tbody>
										<tr>
											<td scope="col"><input type="checkbox" name="check"
												value="${mList.m_id}"></td>
											<td>${mList.m_name}</td>
											<td><a href="${path}/admin/memberinfo?m_id=${mList.m_id}" class="txtLink" onclick="window.open(this.href,'memberinfo','width=500'); return false;">${mList.m_id}</a></td>
											<td>${mList.m_grade}</td>
											<td>${mList.enrolldate}</td>
											<td>${mList.m_phone}</td>
											<td>${mList.m_address}</td>
											<td>${mList.m_memo}</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tbody class="empty">
									<tr>
										<td colspan="8">검색된 고객 내역이 없습니다.</td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div class="mCtrl typeFooter"></div>
				<div class="mPaginate"></div>

			</div>
			<!-- //content -->
	</form>
</body>
</html>
