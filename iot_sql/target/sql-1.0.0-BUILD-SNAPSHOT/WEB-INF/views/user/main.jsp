<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container">
      <div class="starter-template">
        <h1 >Board Main</h1>
        <p class="lead" ></p>
      </div>
        <button id="btn" class="btn btn-lg btn-primary btn-block" data-url="${rPath}/user/logout">LOGOUT</button>
    </div><!-- /.container -->

<script>

$(document).ready(function(){
	$("input[type='button']").click(function(){
		var url = this.getAttribute("data-url");
		if(url){
			location.href=url;
		}
	})
	$("button[data-url]").click(function(){
		var url = this.getAttribute("data-url");
		if(url){
			location.href=url;
		}
	})
})
</script>
<body>

<input type="button" value="유저리스트 이동" data-url="${rPath}/user/list">

</body>
</html>