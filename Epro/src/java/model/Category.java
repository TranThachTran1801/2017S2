
package model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
public class Category {
    private String name;
    private String supplierId;
    private List<Product> products;
}
