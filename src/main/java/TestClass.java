import java.util.List;

import com.tomato.DAOImplementation.RestaurantImpl;
import com.tomato.DAOImplementation.UserImpl;
import com.tomato.models.RestaurantModel;
import com.tomato.models.UserModel;

public class TestClass {

	public static void main(String[] args) {
		UserImpl userImpl=new UserImpl();
		UserModel user=new UserModel("sanjay ramse","ruban","password","email","phone","address","role");
		/*userImpl.setUser(user);*/
		System.out.print(userImpl.getUser("rosesarerosie"));
		/*userImpl.deleteUser("ruban");
		 userImpl.updateUser(user);*/
		List list =userImpl.selectAllUsers();	
		System.out.print(list);
		RestaurantModel restaurant = new RestaurantModel(
			    "Muniyandi vilas",            // name
			    "123 Main Street, Anytown, USA 12345", // address
			    "555-123-4567",                      // phone
			    "4.5",                               // rating
			    "American",                          // cusineType
			    true,                                // isActive
			    "25-35 minutes",                     // eta
			    "https://example.com/images/diner.jpg" // imagePath
			);
		restaurant.setRestaurantID(1);
		RestaurantImpl restaurantImplementation=new RestaurantImpl();
		restaurantImplementation.updateRestaurant(restaurant);
	}

}
