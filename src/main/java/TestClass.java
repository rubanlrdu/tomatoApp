import java.util.List;

import com.tomato.DAO.AddressDAO;
import com.tomato.DAO.MenuDAO;
import com.tomato.DAOImplementation.AddressImpl;
import com.tomato.DAOImplementation.MenuImpl;
import com.tomato.models.AddressModel;
import com.tomato.models.MenuModel;

public class TestClass {

	public static void main(String[] args) {
		
		int userId=1;
		MenuDAO menuImpl=new MenuImpl();
		List<MenuModel> menu=menuImpl.getMenyByCategory(2, "Breakfast Fushion"); 
		System.out.print(menu);
	}

}
