<%--
  Created by IntelliJ IDEA.
  User: PanZhe
  Date: 2017/11/19
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function login() {
            var realPath = $("#realPath").val();
            window.location.href = realPath + "/resource/ui/index.jsp";
        }
    </script>
</head>
<body>
    <input type="hidden" id="realPath" value="${pageContext.request.contextPath}" />
    <input type="button" value="登陆" onclick="login()" />
</body>
</html>
