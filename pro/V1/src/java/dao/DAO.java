/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.*;
import bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author thanh_000
 */
public class DAO {
    
    public DAO() {
        
    }
    
    DatabaseConnection db = new DatabaseConnection();
    Connection con = null;
    
    public boolean checkLogin(String username, String password) throws SQLException {
        ResultSet rs = null;
        con = db.setConnection();
        try {
            
            String sql = "Select * From webproject.account Where username='" + username + "' and password='" + password + "'";
            rs = db.getResult(sql, con);
            boolean result = rs.next();
            
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            con.close();
        }
        return false;
    }

//    public boolean register(String username, String pass, String fullname, String email, String phone, int role) {
//        con = db.setConnection();
//        try {
//
//            String sql = "Insert Into account (Fullname,Username,Pass_word,Email,Phone_Num,Role_ID)" + "values(?,?,?,?,?,?)";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, fullname);
//            ps.setString(2, username);
//            ps.setString(3, pass);
//            ps.setString(4, email);
//            ps.setString(5, phone);
//            ps.setInt(6, role);
//            int result = ps.executeUpdate();
//            ps.close();
//            con.close();
//            if (result > 0) {
//                return true;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    public boolean updatePerson(String username, String pass, String fullname, String email, String phone) {
        con = db.setConnection();
        try {
            
            String sql = "update account set Fullname ='" + fullname + "',Email = '" + email + "',Phone_Num = '" + phone + "',Pass_word = '" + pass + "' where Username ='" + username + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean addGenre(String genreName) {
        
        con = db.setConnection();
        try {
            
            String sql = "Insert Into genre (Genre_Name) values('" + genreName + "')";
            PreparedStatement ps = con.prepareStatement(sql);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean insertReal(String street, String ward, String district, int price, int id_range, int id_user, int id_transaction_type,
            String description, String owner_email, int phone, String[] url, int bed, int toilet, int category, String fullname) {
        con = db.setConnection();
        try {
            String sql = "Insert Into project.realestate (street,wart,district,price,id_range,id_transaction_type,id_user,description,owner_email, phone,category,full_name) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, street);
            ps.setString(2, ward);
            ps.setString(3, district);
            ps.setInt(4, price);
            ps.setInt(5, id_range);
            ps.setInt(6, id_transaction_type);
            ps.setInt(7, id_user);
            ps.setString(8, description);
            ps.setString(9, owner_email);
            ps.setInt(10, phone);
            ps.setInt(11, category);
            ps.setString(12, fullname);
            int result = ps.executeUpdate();
            System.out.print(sql);
            //
            ps.close();
            con.close();
            
            if (result > 0) {
                
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean insertPicture(String street, String ward, String district, int price, int id_range, int id_user, int id_transaction_type,
            String description, String owner_email, int phone, String[] url, int bed, int toilet, int category) {
        con = db.setConnection();
        try {
            String sql4 = "Select * from project.realestate where wart = '" + ward + "' and district = '" + district + "' and street = '" + street + "' and phone = '" + phone + "' and price = '" + price + "' and id_range = '" + id_range + "'";
            PreparedStatement stmt = con.prepareStatement(sql4);
            //stmt.setString(1, term + "%");
            ResultSet rs4 = stmt.executeQuery();
            //ResultSet rs4 = db.getResult(sql4, con);
            System.out.printf(sql4);
            int id_real = 0;
            //boolean abc = rs4.next();
            //System.out.print("jujuj " + abc);
            while (rs4.next()) {
                id_real = rs4.getInt("id_real");
            }
            PreparedStatement ps1 = null;
            System.out.println(id_real);
            
            for (int i = 0; i < url.length; ++i) {
                System.out.print(url[i]);
                String sql1 = "Insert Into project.real_has_picture(id_picture,id_real, url) values(?,?,?)";
                ps1 = con.prepareStatement(sql1);
                ps1.setInt(1, i + 1);
                ps1.setInt(2, id_real);
                ps1.setString(3, url[i]);
                int result = ps1.executeUpdate();
            }
            
            ps1.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();;
            
        }
        
        return false;
    }
    
    public boolean insertRoom(String street, String ward, String district, int price, int id_range, int id_user, int id_transaction_type,
            String description, String owner_email, int phone, String[] url, int bed, int toilet, int category) {
        con = db.setConnection();
        try {
            String sql4 = "Select * from project.realestate where wart = '" + ward + "' and district = '" + district + "' and street = '" + street + "' and phone = '" + phone + "' and price = '" + price + "' and id_range = '" + id_range + "'";
            PreparedStatement stmt = con.prepareStatement(sql4);
            //stmt.setString(1, term + "%");
            ResultSet rs4 = stmt.executeQuery();
            //ResultSet rs4 = db.getResult(sql4, con);
            System.out.printf(sql4);
            int id_real = 0;
            //boolean abc = rs4.next();
            //System.out.print("jujuj " + abc);
            while (rs4.next()) {
                id_real = rs4.getInt("id_real");
            }
            PreparedStatement ps1 = null;
            System.out.println(id_real);
            
            for (int i = 0; i < 2; ++i) {
                
                String sql1 = "Insert Into project.real_has_room(id_real, id_room_type, number_room) values(?,?,?)";
                ps1 = con.prepareStatement(sql1);
                ps1.setInt(1, id_real);
                ps1.setInt(2, i + 1);
                if (i == 0) {
                    ps1.setInt(3, bed);
                } else {
                    ps1.setInt(3, toilet);
                }
                int result = ps1.executeUpdate();
                
            }
            
            ps1.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateGenre(String newGenre, String oldGenre) {
        con = db.setConnection();
        try {
            
            String sql = "update genre set Genre_Name ='" + newGenre + "' where Genre_Name ='" + oldGenre + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateReal(int id_real, int price, int id_transaction_type, String description, int id_range) {
        con = db.setConnection();
        try {
            
            String sql = "update project.realestate set price ='" + price + "', id_transaction_type ='" + id_transaction_type + "', description ='" + description + "', id_range ='" + id_range + "'  where id_real ='" + id_real + "'";
            System.out.print(sql);
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean insertCareer(String content, String daytime) {
        con = db.setConnection();
        try {
            
            String sql = "Insert Into project.career (daytime,content) values(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, daytime);
            ps.setString(2, content);
            int result = ps.executeUpdate();
            
            ps.close();
            con.close();
            
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateUser(String id, String fullname, String user, String pass, String email, String phone, String role) {
        con = db.setConnection();
        try {
            
            String sql = "update project.account set Fullname ='" + fullname + "', Username ='" + user + "', Pass_word ='" + pass
                    + "', Email ='" + email + "', Phone_Num ='" + phone + "', Role_ID ='" + role + "' where User_ID ='" + id + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateMovie(String oldName, String name, String actor, String infor, String genre,
            String director, String length, String year, String place, String id, String picture, String view, String links) {
        con = db.setConnection();
        try {
            
            String sql = "update movie set Movie_ID ='" + id + "',Movie_Name ='" + name + "',Movie_Picture ='" + picture + "',Movie_Actor='" + actor + "',"
                    + "Movie_Information='" + infor + "',Movie_Genre='" + genre + "',Movie_Director='" + director + "',"
                    + "Movie_Length='" + length + "',Movie_Year='" + year + "',Movie_Place='" + place + "',Movie_Views='" + view + "',Movie_Links='" + links + "'"
                    + " where Movie_Name ='" + oldName + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteGenre(String genreName) {
        con = db.setConnection();
        try {
            
            String sql = "Delete from genre where Genre_Name ='" + genreName + "'";
            db.getResultDo(sql, con);
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deletereal(int id_real) {
        con = db.setConnection();
        try {
            
            String sql = "Delete from project.real_has_picture where id_real ='" + id_real + "'";
            db.getResultDo(sql, con);
            System.out.print(sql);
            String sq2 = "Delete from project.real_has_room where id_real ='" + id_real + "'";
            db.getResultDo(sq2, con);
            String sq3 = "Delete from project.realestate where id_real ='" + id_real + "'";
            System.out.print(sq3);
            db.getResultDo(sq3, con);
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteMovie(String movieName) {
        con = db.setConnection();
        try {
            
            String sql = "Delete from movie where Movie_Name ='" + movieName + "'";
            db.getResultDo(sql, con);
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteUser(String id) {
        con = db.setConnection();
        try {
            
            String sql = "Delete from account where User_ID ='" + id + "'";
            db.getResultDo(sql, con);
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean checkPassMD5(String username, String pass) {
        con = db.setConnection();
        
        try {
            
            String sql = "Select * From User Where Username='" + username + "' and Password='" + pass + "'";
            ResultSet rs = db.getResult(sql, con);
            boolean result = rs.next();
            rs.close();
            con.close();
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<String> getDataForSearch(String term) {
        con = db.setConnection();
        ArrayList<String> list = new ArrayList<>();
        String SELECT = "SELECT * FROM Problem where Header like '%" + term + "%'";
        String data;
        try {
            
            PreparedStatement stmt = con.prepareStatement(SELECT);
            //stmt.setString(1, term + "%");
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                data = rs.getString("Header");
                list.add(data);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return list;
        
    }

    //register
    public boolean register(String username, String password, String birthday, String phone, String email, String name, int role) {
        con = db.setConnection();
        try {
            
            String sql = "Insert Into webproject.account (username,password,birthday,phone,email,name, ID_role)" + "values(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, birthday);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, name);
            ps.setInt(7, role);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //check user
    public boolean checkUser(String username) {
        con = db.setConnection();
        try {
            String sql = "Select * from webproject.account Where username='" + username + "'";
            ResultSet rs = db.getResult(sql, con);
            boolean result = rs.next();
            
            System.out.println(sql);
            System.out.println(result);
            rs.close();
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<myproduct> getProduct() {
        ArrayList<myproduct> pro = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "Select * from badao.myproduct";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                myproduct temp = new myproduct();
                temp.setID_product(rs.getInt("ID_product"));
                temp.setName(rs.getString("name"));
                temp.setDescription(rs.getString("description"));
                temp.setPrice(rs.getDouble("price"));
                temp.setID_status(rs.getInt("ID_status"));
                temp.setID_manufacturer(rs.getInt("ID_manufacturer"));
                temp.setID_range(rs.getInt("ID_range"));
                pro.add(i, temp);
                ++i;
            }
            rs.close();
            System.out.println(i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }
    
    public myproduct productDetail(int id) {
        myproduct temp = new myproduct();
        con = db.setConnection();
        try {
            String sql = "Select * from badao.myproduct where ID_product ='" + id + "'";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                
                temp.setID_product(rs.getInt("ID_product"));
                temp.setName(rs.getString("name"));
                temp.setDescription(rs.getString("description"));
                temp.setPrice(rs.getDouble("price"));
                temp.setID_status(rs.getInt("ID_status"));
                temp.setID_manufacturer(rs.getInt("ID_manufacturer"));
                temp.setID_range(rs.getInt("ID_range"));
                ++i;
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return temp;
    }
    
    public boolean order(shoppingcart1 cart, String accid) {
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int year = localDate.getYear();
        int month = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();
        con = db.setConnection();
        try {
            String sql = "Insert Into badao.order (accid, day, month, year, totalPrice) values(? , ? , ? , ? , ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accid);
            ps.setInt(2, day);
            ps.setInt(3, month);
            ps.setInt(4, year);
            ps.setDouble(5, cart.getTotal());
            
            int result = ps.executeUpdate();
            System.out.print(sql);
            //
            ps.close();
            
            String sql2 = "SELECT max(ID_order) as max FROM badao.`order` where accid = '" + accid + "'  and day = '" + day + "' and month = '" + month + "' and year = '" + year + "' and totalPrice = '" + cart.getTotal() + "' ;";
            System.out.println(sql2);
            ResultSet rs = db.getResult(sql2, con);
            int i = 0;
            while (rs.next()) {
                
                i = rs.getInt("max");
                
            }
            PreparedStatement ps1 = null;
            ArrayList<myproduct> list = cart.getCart();
            for (int j = 0; j < list.size(); ++j) {
                myproduct temp = list.get(j);
                String sql3 = "Insert Into badao.productlist (ID_order, ID_product, quantity, price, totalPrice ) values(? , ? , ? , ? , ?)";
                ps1 = con.prepareStatement(sql3);
                ps1.setInt(1, i);
                ps1.setInt(2, temp.getID_product());
                ps1.setInt(3, temp.getQuantity());
                ps1.setDouble(4, temp.getPrice());
                ps1.setDouble(5, temp.getQuantity() * temp.getPrice());
                int result1 = ps1.executeUpdate();
                
            }
            ps1.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public ArrayList<order> getOrder(int day, int month, int year) {
        
        ArrayList<order> ans = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "SELECT * FROM badao.`order` where day = '" + day + "' and  month = '" + month + "' and year = '" + year + "'";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                order temp = new order();
                temp.setID_order(rs.getInt("ID_order"));
                temp.setAccid(rs.getString("accid"));
                temp.setDay(day);
                temp.setMonth(month);
                temp.setYear(year);
                temp.setTotalPrice(rs.getDouble("totalPrice"));
                int id = temp.getID_order();
                
                String sql1 = "SELECT * FROM badao.productlist where ID_order ='" + id + "'";
                ResultSet rs1 = db.getResult(sql1, con);
                ArrayList<myproduct> cart = temp.getList();
                while (rs1.next()) {
                    myproduct temp1 = new myproduct();
                    temp1.setID_product(rs1.getInt("ID_product"));
                    temp1.setQuantity(rs1.getInt("quantity"));
                    temp1.setPrice(rs1.getDouble("price"));
                    cart.add(temp1);
                }
                ans.add(temp);
                
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }
    
    public ArrayList<order> getOrder1(int month, int year) {
        
        ArrayList<order> ans = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "SELECT * FROM badao.`order` where  month = '" + month + "' and year = '" + year + "'";
            System.out.println(sql);
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                order temp = new order();
                temp.setID_order(rs.getInt("ID_order"));
                temp.setAccid(rs.getString("accid"));
                temp.setDay(rs.getInt("day"));
                temp.setMonth(month);
                temp.setYear(year);
                temp.setTotalPrice(rs.getDouble("totalPrice"));
                int id = temp.getID_order();
                
                String sql1 = "SELECT * FROM badao.productlist where ID_order ='" + id + "'";
                ResultSet rs1 = db.getResult(sql1, con);
                ArrayList<myproduct> cart = temp.getList();
                while (rs1.next()) {
                    myproduct temp1 = new myproduct();
                    temp1.setID_product(rs1.getInt("ID_product"));
                    temp1.setQuantity(rs1.getInt("quantity"));
                    temp1.setPrice(rs1.getDouble("price"));
                    cart.add(temp1);
                }
                ans.add(temp);
                
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }
    
    public ArrayList<order> getOrderID(int ID_oder) {
        
        ArrayList<order> ans = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "SELECT * FROM badao.`order` where  ID_order = '" + ID_oder + "'";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                order temp = new order();
                temp.setID_order(rs.getInt("ID_order"));
                temp.setAccid(rs.getString("accid"));
                temp.setDay(rs.getInt("day"));
                temp.setMonth(rs.getInt("month"));
                temp.setYear(rs.getInt("year"));
                temp.setTotalPrice(rs.getDouble("totalPrice"));
                int id = temp.getID_order();
                
                String sql1 = "SELECT * FROM badao.productlist where ID_order ='" + id + "'";
                ResultSet rs1 = db.getResult(sql1, con);
                ArrayList<myproduct> cart = temp.getList();
                while (rs1.next()) {
                    myproduct temp1 = new myproduct();
                    temp1.setID_product(rs1.getInt("ID_product"));
                    temp1.setQuantity(rs1.getInt("quantity"));
                    temp1.setPrice(rs1.getDouble("price"));
                    cart.add(temp1);
                }
                ans.add(temp);
                
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }
    
    public ArrayList<order> getOrderAcc(String accid) {
        
        ArrayList<order> ans = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "SELECT * FROM badao.`order` where  accid = '" + accid + "'";
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                order temp = new order();
                temp.setID_order(rs.getInt("ID_order"));
                temp.setAccid(rs.getString("accid"));
                temp.setDay(rs.getInt("day"));
                temp.setMonth(rs.getInt("month"));
                temp.setYear(rs.getInt("year"));
                temp.setTotalPrice(rs.getDouble("totalPrice"));
                int id = temp.getID_order();
                
                String sql1 = "SELECT * FROM badao.productlist where ID_order ='" + id + "'";
                ResultSet rs1 = db.getResult(sql1, con);
                ArrayList<myproduct> cart = temp.getList();
                while (rs1.next()) {
                    myproduct temp1 = new myproduct();
                    temp1.setID_product(rs1.getInt("ID_product"));
                    temp1.setQuantity(rs1.getInt("quantity"));
                    temp1.setPrice(rs1.getDouble("price"));
                    cart.add(temp1);
                }
                ans.add(temp);
                
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }
    
    public order getOrder(String ID_order) {
        order ans = new order();
        con = db.setConnection();
        try {
            String sql = "SELECT * FROM badao.`order` where  ID_order = '" + ID_order + "'";
            System.out.println(sql);
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                
                ans.setID_order(rs.getInt("ID_order"));
                ans.setAccid(rs.getString("accid"));
                ans.setDay(rs.getInt("day"));
                ans.setMonth(rs.getInt("month"));
                ans.setYear(rs.getInt("year"));
                ans.setTotalPrice(rs.getDouble("totalPrice"));
                int id = ans.getID_order();
                System.out.println(ans.getTotalPrice());
                String sql1 = "SELECT * FROM badao.productlist where ID_order ='" + id + "'";
                ResultSet rs1 = db.getResult(sql1, con);
                ArrayList<myproduct> cart = ans.getList();
                while (rs1.next()) {
                    myproduct temp1 = new myproduct();
                    temp1.setID_product(rs1.getInt("ID_product"));
                    temp1.setQuantity(rs1.getInt("quantity"));
                    temp1.setPrice(rs1.getDouble("price"));
                    cart.add(temp1);
                }
                
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }
    
    public ArrayList<myproduct> getProductSearch(String name) {
        ArrayList<myproduct> pro = new ArrayList<>();
        con = db.setConnection();
        try {
            String sql = "Select * from badao.myproduct where name Like '" + name + "%'";
            System.out.println(sql);
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            while (rs.next()) {
                myproduct temp = new myproduct();
                temp.setID_product(rs.getInt("ID_product"));
                temp.setName(rs.getString("name"));
                temp.setDescription(rs.getString("description"));
                temp.setPrice(rs.getDouble("price"));
                temp.setID_status(rs.getInt("ID_status"));
                temp.setID_manufacturer(rs.getInt("ID_manufacturer"));
                temp.setID_range(rs.getInt("ID_range"));
                pro.add(i, temp);
                ++i;
            }
            rs.close();
            System.out.println(i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }
    
    public boolean getrating(String ID_product, String accid) {
        boolean empty = true;
        con = db.setConnection();
        try {
            String sql = "Select * from badao.rating where rating.ID_product ='" + ID_product + "' and rating.accid = '" + accid + "'";
            System.out.println(sql);
            ResultSet rs = db.getResult(sql, con);
            int i = 0;
            
            while (rs.next()) {
                empty = false;
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (empty) {
            System.out.println("data is empty");
            return false;
        }
        return true;
    }
    
    public int getratingStart(int ID_product, String accid) {
        boolean empty = true;
        int i = 3;
        con = db.setConnection();
        try {
            String sql = "Select * from badao.rating where rating.ID_product ='" + ID_product + "' and rating.accid = '" + accid + "'";
            System.out.println(sql);
            ResultSet rs = db.getResult(sql, con);
            
            while (rs.next()) {
                empty = false;
                i = rs.getInt("rating");
            }
            rs.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (empty) {
            System.out.println("data is empty");
            return 3;
        }
        return i;
    }
    
    public void rating(String ID_product, String accid, String start) {
        con = db.setConnection();
        try {
            String sql = "Insert Into badao.rating (ID_product, accid, rating) values(? , ? , ?)";
            System.out.println(sql);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(ID_product));
            
            ps.setString(2, accid);
            ps.setInt(3, Integer.parseInt(start));
            
            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.print("done");
            }
//
            ps.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateRaing(String ID_product, String accid, String start) {
        con = db.setConnection();
        try {
            
            String sql = "update badao.rating  set rating ='" + start + "' where ID_product ='" + ID_product + "' and accid ='" + accid + "'";
            System.out.println(sql);
            db.getResultDo(sql, con);
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public void comment(String accid, String ID_product, String comment) {
        con = db.setConnection();
        try {
            String sql = "Insert Into badao.comment (ID_product, accid, comment) values(? , ? , ?)";
            System.out.println(sql);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(ID_product));
            
            ps.setString(2, accid);
            ps.setString(3, comment);
            
            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.print("done");
            }
//
            ps.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
