
package model;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
public class Account {
    private String id;
    private String username;
    private String password;
    private String email;
    private String address;
    private Activation activate;
    private UserRole role;
    private String createDate;
    
    
    public boolean isValidate(String username, String password) {
        return this.username.equals(username) 
                && this.password.equals(password) 
                && this.activate.equals(Activation.ACTIVATED);
    }
}
