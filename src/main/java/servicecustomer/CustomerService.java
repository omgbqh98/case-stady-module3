package servicecustomer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    public void addCustomer(Customer customer) throws SQLException;

    public boolean deleteUser_new(int id) throws SQLException;

    public Customer selectCustomer(int id);

    public List<Customer> findAll();

    public boolean updaterCustomer(Customer user) throws SQLException;
}

