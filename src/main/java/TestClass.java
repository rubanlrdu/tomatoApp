import java.util.List;

import com.tomato.DAO.AddressDAO;
import com.tomato.DAO.*;
import com.tomato.DAOImplementation.AddressImpl;
import com.tomato.DAOImplementation.MenuImpl;
import com.tomato.DAOImplementation.RestaurantImpl;
import com.tomato.models.AddressModel;
import com.tomato.models.MenuModel;

public class TestClass {

	public static void main(String[] args) {
		
		AddressDAO addressImpl=new AddressImpl();
	  	int addressId=1;
	 	AddressModel address=addressImpl.getAddress(addressId);
	 	System.out.print(address);
	}

}
