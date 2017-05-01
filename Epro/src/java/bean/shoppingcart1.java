/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import bean.*;
import java.util.*;

/**
 *
 * @author Dung Viet
 */
public class shoppingcart1 {

    private double total;
    private int totalitem;
    ArrayList<shose> cart;


    public shoppingcart1() {
        this.total = 0;
        this.totalitem = 0;
        this.cart = new ArrayList<>();
        
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getTotalitem() {
        return totalitem;
    }

    public void setTotalitem(int totalitem) {
        this.totalitem = totalitem;
    }

    public ArrayList<shose> getCart() {
        return cart;
    }

    public void setCart(ArrayList<shose> cart) {
        this.cart = cart;
    }

    public void addProduct(shose temp, int quantity) {
        int flag = 0;
        for (int i = 0; i < cart.size(); ++i) {
            shose e = cart.get(i);
            if (e.getID_shose() == temp.getID_shose()) {
                int quan = e.getQuantity();
                quan += quantity;
                total += e.getPrice() * quantity;
                e.setQuantity(quan);
                flag = 1;
                break;
            }
        }
        if (flag == 0) {
            temp.setQuantity(quantity);
            this.cart.add(temp);

            total += temp.getPrice() * quantity;
            totalitem++;
        }
    }

    public void deleteProduct(int id) {
        for (int i = 0; i < cart.size(); ++i) {
            shose e = cart.get(i);
            if (e.getID_shose() == id) {
                cart.remove(i);
                total -= e.getPrice() * e.getQuantity();
                --totalitem;
            }
        }
    }
}
