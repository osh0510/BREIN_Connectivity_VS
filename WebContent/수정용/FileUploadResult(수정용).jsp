<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
String uploadPath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent";
int maxSize = 1024 * 1024 * 10000; // �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����

/*  String a = request.getParameter("t1f"); 
 System.out.println(a);	
 String[] a2 = a.split(",");

 for (int i=0; i< a2.length; i++){
 String decoa2 = a2[i].substring(0,a2[i].length()-7);
 String path = uploadPath + "/" + decoa2; //���� ���
	File Folder = new File(path);

	// �ش� ���丮�� ������� ���丮�� �����մϴ�.
	if (!Folder.exists()) {
		try{
		    Folder.mkdir(); //���� �����մϴ�.
		    System.out.println("������ �����Ǿ����ϴ�.");
	        } 
	        catch(Exception e){
		    e.getStackTrace();
		}        
      }else {
		System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
	}
 } 
 
System.out.println(a2[1]);  */

System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");
	// request.getRealPath("�����") �� ���� ������ ������ ���� ��θ� ���ؿ´�.
	// �ü�� �� ������Ʈ�� ��ġ�� ȯ�濡 ���� ��ΰ� �ٸ��� ������ �Ʒ�ó�� ���ؿ��°� ����
	//String uploadPath = request.getRealPath("/ClientUpload");
	/* out.println("������ : " + uploadPath + "<br/>"); */

	String name = "";
	String subject = "";
	String fileName1 = ""; // �ߺ�ó���� �̸�
	String originalName1 = ""; // �ߺ� ó���� ���� ���� �̸�
	long fileSize = 0; // ���� ������
	String fileType = ""; // ���� Ÿ��
	MultipartRequest multi = null;

	multi = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());	

	String id = multi.getParameter("name"); 

	System.out.println(id);
	
	try {
		// request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
	
		// form���� input name="name" �� �༮ value�� ������
		name = multi.getParameter("name");
				
		// name="subject" �� �༮ value�� ������
		subject = multi.getParameter("subject");		
		
		// ������ ��ü �����̸����� ������
		Enumeration files = multi.getFileNames();
		String query="";		
		
		while (files.hasMoreElements()) {
			 
			// form �±׿��� <input type="file" name="���⿡ ������ �̸�" />�� �����´�.
			String file1 = (String) files.nextElement(); // ���� input�� ������ �̸��� ������
			// �׿� �ش��ϴ� ���� ���� �̸��� ������
			originalName1 = multi.getOriginalFileName(file1);
			// ���ϸ��� �ߺ��� ��� �ߺ� ��å�� ���� �ڿ� 1,2,3 ó�� �پ� unique�ϰ� ���ϸ��� �����ϴµ�
			// �̶� ������ �̸��� filesystemName�̶� �Ͽ� �� �̸� ������ �����´�.(�ߺ��� ���� ó��)
			fileName1 = multi.getFilesystemName(file1);
			
			// ���� Ÿ�� ������ ������
			fileType = multi.getContentType(file1);
			// input file name�� �ش��ϴ� ���� ������ ������
			File file = multi.getFile(file1);
			// �� ���� ��ü�� ũ�⸦ �˾Ƴ�
			fileSize = file.length();
			
		}

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