/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;
import java.util.*;
/**
 *
 * @author trung
 */
public class order {
    private int ID_order;
    private String accid;
    private int day;
    private int month;
    private int year;
    private double totalPrice;
    private ArrayList<myproduct> list;
    
    
    public order(int ID_order, String accid, int day, int month, int year, double totalPrice) {
        this.ID_order = ID_order;
        this.accid = accid;
        this.day = day;
        this.month = month;
        this.year = year;
        this.totalPrice = totalPrice;
        list = new ArrayList<>();
    }

    public order(int ID_order, String accid, int day, int month, int year, double totalPrice, ArrayList<myproduct> list) {
        this.ID_order = ID_order;
        this.accid = accid;
        this.day = day;
        this.month = month;
        this.year = year;
        this.totalPrice = totalPrice;
        this.list = list;
    }

    public ArrayList<myproduct> getList() {
        return list;
    }

    public void setList(ArrayList<myproduct> list) {
        this.list = list;
    }

    public order() {
        this.list = new ArrayList<>();
    }

    public int getID_order() {
        return ID_order;
    }

    public void setID_order(int ID_order) {
        this.ID_order = ID_order;
    }

    public String getAccid() {
        return accid;
    }

    public void setAccid(String accid) {
        this.accid = accid;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
