package repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import model.Category;
import model.Product;
import util.Constant;
import util.JsonBinder;

/**
 *
 * @author IU-CSE Team
 */
public class APIFetcher {
    
    private static String fetch(String fetchURL) {
        StringBuilder response = new StringBuilder("");
        try {
            String urlFetch = "http://localhost:" + Constant.getServerPort() +  "/WebProviders" + fetchURL;
            URL url = new URL(urlFetch);
            HttpURLConnection uRLConnection = (HttpURLConnection) url.openConnection();
            
            uRLConnection.setRequestMethod("GET");
            uRLConnection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
            
            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(uRLConnection.getInputStream()))) {
                String inputLine;
                response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
            }
        } catch (IOException e) {
        }
        
        return response.toString();
    }
    
    public static List<Product> fetcher(String url) {
        String jsonString = fetch(url);
        Category category = (Category) JsonBinder.fromJson(jsonString, Category.class);
        
        System.out.println("dsrdrr" +jsonString);
        
        ProductRepositoty.saveProductFromProviders(category.getProducts());
        
        return category.getProducts();
        
    }
    
}
