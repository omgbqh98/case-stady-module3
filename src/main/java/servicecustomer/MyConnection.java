package servicecustomer;

import java.sql.*;

public class MyConnection {
    private String jdbcURL = "jdbc:mysql://localhost:3306/video?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "omgbqh98";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    public void thucThiSQL(String sql)throws Exception {
        Connection connection=getConnection();
        Statement stmt =connection.createStatement();
        stmt.executeUpdate(sql);
    }

    public ResultSet chonDuLieuDTB(String sql) throws SQLException {
        Connection connection = getConnection();
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        return rs;
    }
}
