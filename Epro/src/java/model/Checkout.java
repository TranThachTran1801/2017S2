
package model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author IU-CSE Team
 */

@AllArgsConstructor
@Data
public class Checkout {
    private List<Order> forms;
}
