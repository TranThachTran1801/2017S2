package dao;

import lombok.AllArgsConstructor;
import lombok.Data;
import model.OrderType;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
public class OrderDAO {

    private String orderId;
    private String customerId;
    private String orderFullname;
    private String orderAddress;
    private String orderPhone;
    private String orderDate;
    private double totalCost;
    private String cardid;
    private String orderform;
    private OrderType ordertype;

}
