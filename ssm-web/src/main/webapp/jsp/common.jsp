<%--
  Created by IntelliJ IDEA.
  User: PanZhe
  Date: 2017/11/19
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>公共jsp</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<link  href="${pageContext.request.contextPath}/resource/css/main.css" rel="stylesheet" type="text/css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/easyui/css/easyui.css"></link>--%>
    <!-- 弹出框 -->
    <%--<link href="${pageContext.request.contextPath}/resource/ui/css/skins/black.css" rel="stylesheet" />--%>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/easyui/css/icon.css"></link>--%>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/easyui/css/demo.css"></link>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/util.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/ui/js/artDialog.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/ui/js/iframeTools.js"></script>
</head>
<body>
<input type="hidden" id="permissionSession" value="${sessionScope.permissionList}" />
<input type="hidden" id="realpath" value="${pageContext.request.contextPath}"/>
</body>
</html>

