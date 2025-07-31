package com.tomato.DAO;

import java.util.List;

import com.tomato.models.MenuModel;

public interface MenuDAO {

	void setMenu(MenuModel menu);
	MenuModel getMenu(MenuModel menu);
	void updateMenu(MenuModel table);
	void deleteMenu(MenuModel menu);
	List<MenuModel> getAllMenu();
}
