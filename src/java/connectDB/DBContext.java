package connectDB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public Connection getConnection() throws Exception{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + "localhost" + ":1433"+ ";instance=" + "SQLEXPRESS" + ";databaseName=" + "Social_Network";
            Connection conn = DriverManager.getConnection(url,"sa","12");
        return conn;  
    }
    public static void main(String[] args) throws Exception {
        DBContext d = new DBContext();
        System.out.println(d.getConnection());
    }
}
