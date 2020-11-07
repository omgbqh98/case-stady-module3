package serviceuser;

import model.Customer;
import model.User;
import servicecustomer.MyConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUser {
    private static final String DELETE_USERS_SQL = "delete from user where idUser = ?;";
    private static final String SEARCH ="select*from user where name like '?%'";
    MyConnection myConnection = new MyConnection();
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall("{call find_all}")) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idUser");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String pass = rs.getString("pass");
                users.add(new User(id, name, username, pass));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public List<User> search(String name) throws SQLException {
        List<User> users =new ArrayList<> ();
    try (Connection connection = myConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(SEARCH)){
        statement.setString(2,name);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("idUser");
//            String nameuser = rs.getString("name");
            String username = rs.getString("username");
            String pass = rs.getString("pass");
            users.add(new User(id, name, username, pass));
        }
        }
        return users;
    }

    public boolean deleteUser_new(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = myConnection.getConnection();
             PreparedStatement statement=connection.prepareStatement(DELETE_USERS_SQL)){
            statement.setInt(1,id);
            rowDelete = statement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_by_id(?)}";
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String username = rs.getString("username");
                String pass = rs.getString("pass");
                user = new User( id,name, username, pass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    @Override
    public boolean addAccount(Object obj) throws SQLException {
        User user = (User) obj;
        try {
            new MyConnection().thucThiSQL("insert into user(name,userName,pass) values('" +user.getName()+"','"+user.getUserName()+"','"+user.getPass()+"')");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public User getInformationUser(String username) {
//        User user =new User();
        try {
            ResultSet rs= new MyConnection().chonDuLieuDTB("select*from user where userName ='"+username+"'");
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String userName = rs.getString(3);
                String pass = rs.getString(4);
                return new User(id,name, userName, pass);
                }
            } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkDangKy(String username) {
        try {
            ResultSet rs = new MyConnection().chonDuLieuDTB("select*from user where username ='" + username + "' ");
            while (rs.next()) {
                if (rs.getString(3).equals(username)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }
    @Override
    public boolean checkLogin(String username,String pass) {
        try {
            ResultSet rs= new MyConnection().chonDuLieuDTB("select*from user where userName ='"+username+"'");
            while (rs.next()) {
                if (rs.getString(3).equals(username) && rs.getString(4).equals(pass)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static void main(String[] args) {
//       User user =new User("huynh","huynh","huynh");
//        try {
//            System.out.println(new UserService().addAccount(user));
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        System.out.println(new UserService().checkLogin("h","huynh"));

    }
}
