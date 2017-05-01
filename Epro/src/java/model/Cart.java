
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
public class Cart {
    private List<Product> products;
    
    public void addProduct(Product product) {
        this.products.add(product);
    }
}
