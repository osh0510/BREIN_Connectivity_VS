<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


	
<%
	// request.getRealPath("�����") �� ���� ������ ������ ���� ��θ� ���ؿ´�.
	// �ü�� �� ������Ʈ�� ��ġ�� ȯ�濡 ���� ��ΰ� �ٸ��� ������ �Ʒ�ó�� ���ؿ��°� ����
	//String uploadPath = request.getRealPath("/ClientUpload");
	
	String uploadPath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/txt";
	/* out.println("������ : " + uploadPath + "<br/>"); */
String str = request.getParameter(fileName);
out.println("value: " + str);
System.out.println("Ȯ��");

	int maxSize = 1024 * 1024 * 100; // �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����

	String name = "";
	String subject = "";

	String fileName1 = ""; // �ߺ�ó���� �̸�
	String originalName1 = ""; // �ߺ� ó���� ���� ���� �̸�
	long fileSize = 0; // ���� ������
	String fileType = ""; // ���� Ÿ��

	MultipartRequest multi = null;

	try {
		// request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
		multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<script>
	
	
	var fname = '<%=originalName1%>';
	var ftype = '<%=fileType%>';
		
	alert(fname);

    var url = '${pageContext.request.contextPath }/FileDatabaseAddController?fname1=' + encodeURI(fname); 
	window.location.href = url;    
	</script> 
	
		
<%--  	<form class="fpath-form" name="f" action="${pageContext.request.contextPath }/FileDatabaseAddController?fname1=fname" method="post">
	<input type="hidden" name="fname1" value=""> 
	<button style="opacity: 0;" id="chk2" name = "fpath1" value=""></button>
	</form>
	<script>
		chk2.click();
	</script>  --%>
</body>
</html>