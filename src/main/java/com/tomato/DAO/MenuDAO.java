package com.tomato.DAO;

import java.util.List;

import com.tomato.models.MenuModel;

public interface MenuDAO {

	void setMenu(MenuModel menu);
	MenuModel getMenu(int menuId);
	int updateMenu(MenuModel table);
	void deleteMenu(MenuModel menu);
	List<MenuModel> getAllRestaurantMenu(int restaurantId);
	List<MenuModel> getAllMenu();
	List<MenuModel> getMenyByCategory(int restaurantId, String category);
}