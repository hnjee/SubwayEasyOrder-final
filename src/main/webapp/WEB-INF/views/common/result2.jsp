<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	var timer=setTimeout(function(){
		alert('${result}');
		location.href='${path}';
	},1500);
</script>
</body>

</html>