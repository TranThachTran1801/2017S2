
package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @author IU-CSE Team
 */

@Data
@AllArgsConstructor
@EqualsAndHashCode(of = {"accid", "accname", "accrole"})
public class UserSessionHolder  {
    
   private String accid;
   private String accname;
   private UserRole accrole;
   
   public static UserSessionHolder getUSHolderByAccount(Account account) {
       return new UserSessionHolder(account.getId(), account.getUsername(),
               account.getRole());
   }
   
   public static UserSessionHolder getGuestSession() {
       return new UserSessionHolder(null, null, UserRole.GUEST);
   }
   
}
