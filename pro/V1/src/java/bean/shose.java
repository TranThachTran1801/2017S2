/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author trung
 */
public class shose {
    private int ID_shose;
    private String name;
    private String description;
    private double price;
    private int ID_status;
    private int ID_manufacturer;
    private int ID_range;
    private int quantity;

    public shose(int ID_shose, String name, String description, double price, int ID_status, int ID_manufacturer, int ID_range) {
        this.ID_shose = ID_shose;
        this.name = name;
        this.description = description;
        this.price = price;
        this.ID_status = ID_status;
        this.ID_manufacturer = ID_manufacturer;
        this.ID_range = ID_range;
        this.quantity = 0;
    }

    public shose() {
    }

    public int getID_shose() {
        return ID_shose;
    }

    public void setID_shose(int ID_shose) {
        this.ID_shose = ID_shose;
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
