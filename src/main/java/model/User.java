package model;

public class User {
    int id;
    String name;
    String userName;
    String pass;

    public User() {
    super();}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User(int id, String name, String userName, String pass) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.pass = pass;
    }

    public User(String name, String userName, String pass) {
        this.name = name;
        this.userName = userName;
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
