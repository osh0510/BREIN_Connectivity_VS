package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
 
 
 
public class MariaDB {
 
    public static void main(String[] args) {
 
        new MariadbInfo();
 
    }
}
 
class MariadbInfo {
    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;
 
    MariadbInfo() {
 
        try {
 
            //JDBC ����̹��� Ŭ���� �̸��� �־��ش� .
            Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("�ε�����");
        } catch (Exception e) {
            System.out.println("�ε�����");
            return;
        }
 
        try {
 
            //getConnection(�����ͺ��̽�URL, DB ���̵�, DB�н�����);
            connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/osh", "hr", "hr");
            System.out.println("DB ���� ����");
        } catch (Exception e) {
            System.out.println("DB ���� ����");
        }
 
        try {
 
           //Statement��ü�� ����� �޼ҵ�
           statement = connection.createStatement();
 
 
 
           //executeQuery() �Ű������� SQL���� �־ ����
           resultSet = statement.executeQuery("select * from member where id= osh");
           
           
    
 
        //���� ����� ���� �� ��ġ�� �̵��ϴ� �޼ҵ�
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            System.out.println(name);
        }
    
    
        String sql = "select count(*) as count from member";
        resultSet = statement.executeQuery(sql);
        resultSet.next();
        String count = resultSet.getString("count");
        System.out.println(Integer.parseInt(count));
      
      } catch (Exception e) {
       // TODO: handle exception
      }finally{
          try{
             if(connection!=null)connection.close();
             if(statement!=null)statement.close();
             if(resultSet!=null)resultSet.close();
          }catch (Exception e) {
        // TODO: handle exception
          }
    
      }
   }
}
