<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>HiTRUST ACS</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="static/jquery-1.9.1.js"></script>
</head>
<body>
	<div style="text-align: center;">
		<h2>Hello World!</h2>
		<div class="boc_main_right_maintext">���ÿ���ȫ��֤ϵͳ</div>
		<form name="loginForm" id="loginForm" method="post" action="">
			<input type="hidden" name="p" value="DoLogin">
			<div class="login_m">
				<div class="login_boder">
					<div class="login_padding">
						<h2>�û���</h2>
						<label> <input type="text" id="UserId" name="UserId"
							class="txt_input txt_input2" value="">
						</label>
						<h2>����</h2>
						<label> <input type="password" name="UserPassword"
							id="UserPassword" class="txt_input" value="">
						</label>
						<h2>ͼ����֤��</h2>
						<input type="text" id="hVerifyCode" maxLength=4 size=4 readonly="readonly"/>
						<label> <input type="text" maxLength=4 size=4
							name="verifyCode" id="verifyCode" value="">&nbsp;&nbsp;<img
							align="center" id="verifyimageid" name="verifyimageid"
							onclick="getVerifyCodeForLogin()" border="0">
						</label>
						<div class="rem_sub">

							<input type="button" class="sub_button" value="��   ��"
								onclick="Javascript:window.close()"> <input
								type="button" class="sub_button" value="��   ¼"
								onclick="Javascript:LoginConmit();">

						</div>
					</div>
				</div>
				<!--login_boder end-->
			</div>
			<!--login_m end-->
			<br /> <br />
			<!-- <p align="center">2004 �����������ſƼ����޹�˾ ��Ȩ����</p> -->
		</form>
	</div>
</body>
<script>
	$(function() {
		getVerifyCodeForLogin();
	});
	function getVerifyCodeForLogin() {
		$("#verifyimageid").attr("src","VerifyImage?timeStamp="
				+ getTimeStamp());
		setTimeout(function() {
			htmlobj = $.ajax({
				url : "VerifyImageForLogin?timeStamp="+ getTimeStamp(),
				async : true,
				success : function(data) {
					$("#hVerifyCode").val(data);
					console.log("getVerifyCodeForLogin:" + $("#hVerifyCode").val());
				}
			});
		}, 100);
	}

	function getTimeStamp() {
		var dt = new Date();
		var ux = Date.UTC(dt.getFullYear(), dt.getMonth(), dt.getDay(), dt
				.getHours(), dt.getMinutes(), dt.getSeconds()) / 1000;
		return ux;
	}
	//��¼
	function LoginConmit() {
		console.log("LoginConmit:" + $("#myDiv").text());
		var userId = $("#UserId").val();
		var userPassword = $("#UserPassword").val();
		var verifyCode = $("#verifyCode").val();
		if ('' == userId) {
			alert('�������û���');
			return;
		}
		if ('' == userPassword) {
			alert('����������');
			return;
		}
		if ('' == verifyCode) {
			getVerifyCodeForLogin();
			alert('������ͼ����֤��');
			return;
		}
		if ($("#hVerifyCode").val() != verifyCode) {
			getVerifyCodeForLogin();
			alert('��������ȷ��ͼ����֤��');
			return;
		} else {
			alert('ͼ����֤����֤�ɹ���');
		}
		$("#loginForm").submit();
	}
</script>
</html>
