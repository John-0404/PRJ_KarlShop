package DAO;

import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public User checkUser(String user_email, String user_pass) {
        try {
            String query = "select * from users where user_email = ? and user_pass = ?";
            ps = connection.prepareStatement(query);
            ps.setString(1, user_email);
            ps.setString(2, user_pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return user;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateUser(int user_id, String user_name, String user_pass) {
        String sql = "update users set user_name =? , user_pass = ? where user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ps.setInt(3, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User checkAcc(String user_email) {
        try {
            String query = "select * from users where user_email = ?";
            ps = connection.prepareStatement(query);
            ps.setString(1, user_email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user_email, String user_pass) {
        try {
            String query = "insert into users values(?,?,?,?)";
            ps = connection.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, user_email);
            ps.setString(3, user_pass);
            ps.setString(4, "False");
            ps.executeUpdate();
        } catch (Exception e) {
        };
    }

    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from users";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void setAdmin(int user_id, String isAdmin) {
        String sql = "update users set isAdmin= ? where user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(2, user_id);
            ps.setString(1, isAdmin.toUpperCase());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteUser(int user_id) {
        String sql = "delete from users where user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

}
