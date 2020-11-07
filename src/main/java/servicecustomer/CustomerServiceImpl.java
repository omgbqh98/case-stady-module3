package servicecustomer;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    MyConnection myConnection = new MyConnection();

    private static final String SELECT_CUSTOMER_BY_ID = "select id,name,email,address,image from customer where id =?;";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update users set name = ?,email= ?, address =?,image=? where id = ?;";

    public CustomerServiceImpl() {
    }


    public Customer getUserById(int id) {
        Customer user = null;
        String query = "{CALL get_by_id(?)}";
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1,id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                user = new Customer(id, name, email, address,image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }

@Override
    public List<Customer> findAll() {
        List<Customer> users = new ArrayList<>();
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall("{call find_all}")) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                users.add(new Customer(id, name, email, address,image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    @Override
    public boolean deleteUser_new(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement=connection.prepareCall("{call delete_customer(?)}")){
            callableStatement.setInt(1,id);
            rowDelete = callableStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }
    public void addCustomer(Customer user) throws SQLException {
        String query = "{CALL add_customer(?,?,?,?)}";
        // try-with-resource statement will auto close the connection.
        try (Connection connection = myConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getAddress());
            callableStatement.setString(4, user.getImage());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public boolean updaterCustomer(Customer user) throws SQLException {
        boolean rowUpdate;
        try(Connection connection=myConnection.getConnection();
            CallableStatement callableStatement = connection.prepareCall("{call update_customer(?,?,?,?,?)}")) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getAddress());
            callableStatement.setString(5, user.getImage());
            rowUpdate = callableStatement.executeUpdate() > 0;
        }
        return rowUpdate;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
