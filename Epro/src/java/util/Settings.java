
package util;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Product;
import model.UserSessionHolder;

/**
 *
 * @author IU-CSE Team
 */

public class Settings {
    private static final String BEAN_NAME = "W3bUs3eS3ssi0n";
    private static final String ACCOUNT_NAME = "C^rr3nt@cc0ntUs3r";
    private static final String CART_NAME = "Us3rC@rtS3ssi0n";
  
    public static HttpSession getCurrentSession(HttpServletRequest request) {
        return request.getSession(false);
    }
    
    public static UserSessionHolder getCurrentUserSession(HttpServletRequest request) {
        UserSessionHolder ush = (UserSessionHolder)getCurrentSession(request).getAttribute(BEAN_NAME);
        
        return ush == null ? UserSessionHolder.getGuestSession() : ush;
    } 
    
    public static Account getCurrentAccount(HttpServletRequest request) {
        return (Account)getSessionAttribute(request, ACCOUNT_NAME);
    }
    
    public static void initializeCart(HttpServletRequest request) {
        List<Product> products = new ArrayList<>();
        Cart cart = new Cart(products);
        
        setSessionAttribute(request, CART_NAME, cart);
    }
    
    public static Cart getCart(HttpServletRequest request) {
        Cart cart = (Cart)getSessionAttribute(request, CART_NAME);
        
        while (cart == null) {
            initializeCart(request);
            cart = (Cart)getSessionAttribute(request, CART_NAME);
        }
        
        return cart;
    }
    
    public static void addToCart(HttpServletRequest request, Product product) {
        Cart cart = getCart(request);
        cart.addProduct(product);
        removeSessionAttribute(request, CART_NAME);
        setSessionAttribute(request, CART_NAME, cart);
    }
    
    
    public static void setWebUserSession(HttpServletRequest request,
            UserSessionHolder userSessionHolder, Account account) {
        HttpSession sess = getCurrentSession(request);
        if (sess == null) {
            sess = request.getSession();
        }
        
        UserSessionHolder ush = getCurrentUserSession(request);
        if (!ush.equals(UserSessionHolder.getGuestSession())) {
            sess.removeAttribute(BEAN_NAME);
            sess.removeAttribute(ACCOUNT_NAME);
        }
        
        sess.setAttribute(BEAN_NAME, userSessionHolder);
        sess.setAttribute(ACCOUNT_NAME, account);
    }
    
    public static void removeWebUserSession(HttpServletRequest request) {
        HttpSession sess = getCurrentSession(request);
        
        sess.removeAttribute(BEAN_NAME);
        sess.removeAttribute(ACCOUNT_NAME);
        sess.removeAttribute(CART_NAME);
    }
    
    public static Object getSessionAttribute(HttpServletRequest request, String name) {
        return getCurrentSession(request).getAttribute(name);
    }
    
    public static void setSessionAttribute(HttpServletRequest request, String name, Object value) {
        HttpSession sess = getCurrentSession(request);
        
        Object currentValue = sess.getAttribute(name);
        if (currentValue != null) {
            sess.removeAttribute(name);
        }
        
        sess.setAttribute(name, value);
    }
    
    public static void removeSessionAttribute(HttpServletRequest request, String name) {
        getCurrentSession(request).removeAttribute(name);
    }
    
}
