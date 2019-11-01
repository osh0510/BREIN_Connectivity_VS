<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
 <script src="jquery/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="icon.css" />


<!DOCTYPE HTML>
<html>
<head>
<meta charset=EUC-KR">
<title>���� ���ε�</title>
<style>
.ubutton label {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin: 0.5em;
	padding: 0.6em 25px .6em 33px;
	position: relative;
	text-align: center;
	font: 1em/100% Arial, Helvetica, sans-serif;
	text-decoration: none;
	vertical-align: baseline;
	outline: none;
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-moz-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   			
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	-webkit-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   		
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   				
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	border: 1px solid #ccc /*{d-bup-border}*/;
	background: #fff /*{d-bup-background-color}*/;
	font-weight: bold;
	color: #444 /*{d-bup-color}*/;
	text-shadow: 0 /*{d-bup-shadow-x}*/ 1px /*{d-bup-shadow-y}*/ 1px
		/*{d-bup-shadow-radius}*/ #fff /*{d-bup-shadow-color}*/;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#fff /*{d-bup-background-end}*/)); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Chrome 10+, Saf5.1+ */
	background-image: -moz-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* FF3.6 */
	background-image: -ms-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* IE10 */
	background-image: -o-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Opera 11.10+ */
	background-image: linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#ffffff', GradientType=0); /* IE6-8 */
}

.ubutton button {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin: 0.5em;
	padding: 0.6em 25px .6em 33px;
	position: relative;
	text-align: center;
	font: 1em/100% Arial, Helvetica, sans-serif;
	text-decoration: none;
	vertical-align: baseline;
	outline: none;
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-moz-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   			
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	-webkit-box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   		
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	box-shadow: 0px 1px 4px /*{global-box-shadow-size}*/   				
		 rgba(0, 0, 0, .3) /*{global-box-shadow-color}*/;
	border: 1px solid #ccc /*{d-bup-border}*/;
	background: #fff /*{d-bup-background-color}*/;
	font-weight: bold;
	color: #444 /*{d-bup-color}*/;
	text-shadow: 0 /*{d-bup-shadow-x}*/ 1px /*{d-bup-shadow-y}*/ 1px
		/*{d-bup-shadow-radius}*/ #fff /*{d-bup-shadow-color}*/;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#fff /*{d-bup-background-end}*/)); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Chrome 10+, Saf5.1+ */
	background-image: -moz-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* FF3.6 */
	background-image: -ms-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* IE10 */
	background-image: -o-linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/); /* Opera 11.10+ */
	background-image: linear-gradient(#fff /*{d-bup-background-start}*/, #fff
		/*{d-bup-background-end}*/);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#ffffff', GradientType=0); /* IE6-8 */
}

.ubutton input[type="file"] { /* ���� �ʵ� ����� */
	position: absolute;
	padding: 0;
	margin: -1px;
	overflow: 


;
	clip: rect(0, 0, 0, 0);
}

.title1 {
	font-weight: bold;
	font: 2em/100% Arial, Helvetica, sans-serif;
}

.tcol {
	font: 1em/100% Arial, Helvetica, sans-serif;
}
</style>
<script>

function selected(){
var index = $("#selectBox option:selected").text();

alert(index);
}

var fileValue = $("#file1").val().split("\\");
var fileName = fileValue[fileValue.length - 1];
alert(fileName);

</script>
</head>
<body>
	<table style='width: 100%; height: 80px;'>
		<tr style='background-color: #eaf8ff;'>
			<td class='title1'><a> Select Files </a></td>
		</tr>
	</table>
	<h3>��Upload Image</h3>
	<table class="ubutton">
		<tr>
			<td><label onclick="location.href = 'ClientFileUploadPageT1.jsp'">T1 ���ε�</label></td>
			<td><label onclick="location.href = 'ClientFileUploadPageFMRI.jsp'">FMRI ���ε�</label></td>
			<td><label>����üũ</label></td>
			<td>
				<button onclick="location.href ='DataprocessingServlet'" method="post">��ó��</button> <%-- 		<form id="f" name="f"action="${pageContext.request.contextPath}/screenAddController"method="post">
					<button class="ubutton" src="${pageContext.request.contextPath }/DataprocessingServlet">��ó��</button>			
				</form> --%>
			</td>
			<td><label>View Log</label></td>
		</tr>
	</table>

	<table>
		<tr>
			<td><select id="selectBox" multiple="" style='height: 300px; width: 500px;' onchange="selected();">
				<c:forEach items="${T1list}" var="T1list" varStatus="status">
				<c:if test="${T1list.t1name != null }">
					<option>${T1list.t1name}</option>
					</c:if>
				</c:forEach>
			</select></td>
			<td><textarea wrap="hard" spellcheck="false" name='textbox2'style='height: 300px; width: 500px;'></textarea></td>
		</tr>
	</table>
	<h3>��Upload Connectivity</h3>
	<form action="FileUploadResult.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
			<td><div class="ubutton">
					<label for="uploadfile">���ε�</label><input type="file" id="uploadfile" name="file1">
				</div></td>
			<td colspan="2"><input class="button white" type="submit"value="����"> 
			<input class="button white" type="reset"value="���ΰ�ħ"></td>
			</tr>
		</table>
		<form action="${pageContext.request.contextPath }/ViewerController" method="post">
			<table style="width: 53%">
				<tr style="height: 30px; width: 100px; background-color: #86c5e3;">
					<th>���Ϲ�ȣ</th>
					<th>�����</th>
					<th>�����̸�</th>
					<th>�����</th>
					<th>ó������</th>
				</tr>
				<!-- movieBoardListcontroller -->
				<c:forEach items="${list}" var="list" varStatus="status">
					<%-- <c:forEach begin="${list.index}" end ="${list.index }" items="${listfnameNull}" var="listfnameNull"> --%>
					<c:if test="${list.fname != null }">
						<tr style="text-align: center">
							<td>${list.fnum}</td>
							<td id="id">${list.id}</td>
							<td><a href=${pageContext.request.contextPath }/ViewerController?fnum=${list.fnum } id="fname">${list.fname }</a></td>
							<td id="fdate">${list.fdate }</td>
							<td id="listfnameNull">${listfnameNull[status.index].fileNull}</td>
						</tr>
					</c:if>
				</c:forEach>
				<%-- 	</c:forEach> --%>
			</table>
		</form>
	</form>
</body>
</html>