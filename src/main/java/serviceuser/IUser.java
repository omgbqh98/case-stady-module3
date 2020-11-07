package serviceuser;

import java.sql.SQLException;

public interface IUser {
    public boolean addAccount(Object obj) throws SQLException;

    public boolean checkLogin(String username,String pass);
}
