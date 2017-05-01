package util;

import java.util.Collections;

import java.util.Map;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

/**
 *
 * @author IU-CSE Team
 */
public class Constant {
   
    public static final ResourceBundle RESOURCES = ResourceBundle.getBundle("resource.constant");
    
    public static Map<String, String> getConstantByKey() {

        return Collections.list(RESOURCES.getKeys()).stream()
                .collect(Collectors.toMap(key -> key, RESOURCES::getString));
    }
    
    public static String getDBUsername() {
        return getConstantByKey().get("USERNAME");
    }
    
    public static String getDBPassword() {
        return getConstantByKey().get("PASSWORD");
    }
    
    public static String getDBConnection() {
        return getConstantByKey().get("CONNECTION_POOL");
    }
    
    public static String getServerPort() {
        return getConstantByKey().get("SERVER.PORT");
    }
}
