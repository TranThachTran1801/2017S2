
package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IU-CSE Team
 */
public class Encript {
    
    public static String encript(String string) {

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(string.getBytes());
            
            byte byteData[] = md.digest();
            
            //convert the byte to hex format method 1
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            
            //convert the byte to hex format method 2
            StringBuilder hexString = new StringBuilder();
            for (int i=0;i<byteData.length;i++) {
                String hex=Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1) hexString.append('0');
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Encript.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
