
package model;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
public class Order {
    private String productName;
    private int quantity;
}
