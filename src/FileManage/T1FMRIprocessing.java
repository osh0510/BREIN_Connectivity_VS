package FileManage;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class T1FMRIprocessing {

	public void T1Processing(String t1name) {

		String listsArray[] = t1name.split("!");

		for (int i = 0; i < listsArray.length; i++) {
			String listsArrayresult = listsArray[i].substring(0, listsArray[i].length() - 7);
			String path = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/ClientUpload/" + listsArrayresult; // ����
			String beforeFilePath = "C:/Users/Oh Seung Hwan/git/BREIN_ROI/ObJMesh/WebContent/ClientUpload";
			File Folder = new File(path);

			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // ���� �����մϴ�.
					System.out.println("������ �����Ǿ����ϴ�.");
				} catch (Exception e) {
					e.getStackTrace();
				}
			} else {
				System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
			}
			T1FMRIprocessing T1FMRIprocessing = new T1FMRIprocessing();

			System.out.println("�佺�˻�");
			System.out.println(listsArray[i]);
			System.out.println(beforeFilePath);
			System.out.println(path);

			Path file = Paths.get(beforeFilePath + "/" + listsArray[i]);

			Path movePath = Paths.get(path);

			try {
				Files.move(file, movePath.resolve(file.getFileName()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(path+"/log.txt"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
