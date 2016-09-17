<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="/student/themes/default/css/icon.css">
	<script type="text/javascript" src="/student/scripts/jquery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/student/scripts/jquery/jquery.easyui.min.js"></script>
	<script>
	 $(window).load(function () { 
   		addTab('google','http://www.google.com');
		addTab('jquery','http://jquery.com/');
 });
  
		function addTab(title, url){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			} else {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
	</script>
	
</head>
<body>
 	<div style="margin-bottom:10px">
		<a href="#" class="easyui-linkbutton" ></a>
		<a href="#" class="easyui-linkbutton" ></a>
		<a href="#" class="easyui-linkbutton" ></a>
	</div>
	<div id="tt" class="easyui-tabs" style="width:400px;height:250px;">
		<div title="Home">
		</div>
	</div>
</body>
</html>