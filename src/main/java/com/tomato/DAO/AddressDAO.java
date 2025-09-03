package com.tomato.DAO;

import java.util.List;

import com.tomato.models.AddressModel;

public interface AddressDAO {
	
	void setAddress(AddressModel address);
	void updateAddress(AddressModel address);
	void deleteAddress(int addressId);
	
	AddressModel getAddress(int addressId);
	List<AddressModel> getAllAddress();
	List<AddressModel> getAllAddressByUser(int userId);

}
