<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>Insert title here</title>
</head>
<script>
function callback(result){
	alert(result.length);
}
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtill("goods/list");
		au.setCallbackSuccess(callback);
		au.send();
	})
})
</script>
<body>
<br><br><br><br><br><br><br>
<form action="${rootpath}/goods/list" method="post">
<input type="button" value="전송">
</form>
</body>
</html>