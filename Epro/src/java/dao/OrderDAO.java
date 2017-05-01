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
   
    private double totalcost;

 

}
