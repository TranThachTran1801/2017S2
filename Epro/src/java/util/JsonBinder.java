
package util;

import com.google.gson.Gson;

/**
 *
 * @author IU-CSE Team
 */

public class JsonBinder {

    private static final Gson GSON = new Gson();
    
    public static String toJson(Object objectMapper) {
        return GSON.toJson(objectMapper);
    }
    
    public static Object fromJson(String jsonString, Class objectClass) {
        return GSON.fromJson(jsonString, objectClass);
    }
    
}
