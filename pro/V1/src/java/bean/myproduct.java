/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Dung Viet
 */
public class myproduct {
    private int ID_product;
    private String name;
    private String description;
    private double price;
    private int ID_status;
    private int ID_manufacturer;
    private int ID_range;
    private int quantity;
    private int ID_category;
    private int ID_SQ;

    public int getID_category() {
        return ID_category;
    }

    public void setID_category(int ID_category) {
        this.ID_category = ID_category;
    }

    public int getID_SQ() {
        return ID_SQ;
    }

    public void setID_SQ(int ID_SQ) {
        this.ID_SQ = ID_SQ;
    }

    public myproduct(int ID_product, String name, String description, double price, int ID_status, int ID_manufacturer, int ID_range, int ID_category) {
        this.ID_product = ID_product;
        this.name = name;
        this.description = description;
        this.price = price;
        this.ID_status = ID_status;
        this.ID_manufacturer = ID_manufacturer;
        this.ID_range = ID_range;
        this.quantity = 0;
        this.ID_category = ID_category;
    }

    public myproduct() {
    }

    public int getID_product() {
        return ID_product;
    }

    public void setID_product(int ID_product) {
        this.ID_product = ID_product;
    }

  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getID_status() {
        return ID_status;
    }

    public void setID_status(int ID_status) {
        this.ID_status = ID_status;
    }

    public int getID_manufacturer() {
        return ID_manufacturer;
    }

    public void setID_manufacturer(int ID_manufacturer) {
        this.ID_manufacturer = ID_manufacturer;
    }

    public int getID_range() {
        return ID_range;
    }

    public void setID_range(int ID_range) {
        this.ID_range = ID_range;
    }

    
    
}
