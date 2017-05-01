package db;

import java.sql.*;
import static jdk.nashorn.internal.runtime.Context.printStackTrace;

public class DatabaseConnection {

    Connection conn;
    String url;
    Statement stmt;
    ResultSet rs;

    public DatabaseConnection() {

    }

    public Connection setConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            url = "jdbc:mysql://localhost:3306/ecmrproj";
            conn = DriverManager.getConnection(url, "root", "123456");
        } catch (Exception e) {
            printStackTrace(e);
        }
        return conn;
    }

    public ResultSet getResult(String query, Connection conn) {
        this.conn = conn;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            printStackTrace(e);
        }
        return rs;
    }

    public void getResultDo(String query, Connection conn) {
        this.conn = conn;
        try {
            stmt = conn.createStatement();
            stmt.executeUpdate(query);
        } catch (Exception e) {
            printStackTrace(e);
        }
    }

    public boolean close(Connection conn) {
        try {
            conn.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
