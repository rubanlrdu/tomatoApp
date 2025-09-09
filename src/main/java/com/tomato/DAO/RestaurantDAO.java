package com.tomato.DAO;
import java.util.List;

import com.tomato.models.RestaurantModel;

public interface RestaurantDAO {
	void setRestaurant(RestaurantModel Restaurant);
	void deleteRestaurant(int restaurantId);
	void updateRestaurant(RestaurantModel Restaurant);
	RestaurantModel getRestaurant(int restaurantId);
	RestaurantModel getRestaurantByAdmin(int adminId);
	List<RestaurantModel> getAllRestaurant();
}
