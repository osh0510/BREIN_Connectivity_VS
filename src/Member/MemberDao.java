package Member;

import java.util.ArrayList;

public interface MemberDao {
	void insert(member m); //id�߰�

	member select(String id); //id����
	
	String selectId(String name,String tel); //idã��
							//��й�ȣ ����

	void update(member m); //id����

	void delete(String id); //id����
	
	ArrayList<member> selectAll(String area);// &&&����
	
}
