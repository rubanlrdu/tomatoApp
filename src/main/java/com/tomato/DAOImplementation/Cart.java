package com.tomato.DAOImplementation;

import java.util.HashMap;
import java.util.Map;

import com.tomato.models.CartItemModel;

public class Cart {
		
	Map<Integer,CartItemModel> items=new HashMap<>();
	
	public void addItem(CartItemModel item) {
		int itemId=item.getId();
		if(items.containsKey(itemId)) {
			CartItemModel existingItem=items.get(itemId);
			existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
			
		}
		else {
		items.put(itemId, item);
		}
	}
	
	public void updateItem(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity<=0) {
				items.remove(itemId);
			}
			else {
				items.get(itemId).setQuantity(quantity);
			}
		}
	}
	
	public CartItemModel getItem(int menuId) {
		
		return items.get(menuId);
	}
	
	public Map<Integer,CartItemModel> getAllItems(){
		return items;
	}
	
	public void removeItem(int menuId) {
		items.remove(menuId);
	}
	
	public void removeAllItems() {
		items.clear();
	}
}
