package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tomato.DAO.AddressDAO;
import com.tomato.models.AddressModel;
import com.tomato.models.MenuModel;

public class AddressImpl implements AddressDAO{
	
	
	String INSERT="insert into `address` (`userid`,`addressLine1`,`addressLine2`,"
			+ "`landmark`,`city`,`state`,`postalCode`,`addressType`,`isDefault`) values (?,?,?,?,?,?,?,?,?)";
	
	String UPDATE="update `address` set `addressLine1`=?,`addressLine2`=?,`landmark`=?,`city`=?,`state`=?,`postalCode`=?,`addressType`=?,`isDefault`=? where `addressid`=?";
	
	String SELECT="select * from `address` where `addressid`=?";
	
	String SELECTALL="select * from `address`";
	
	String SELECTALLBYUSER="select * from `address` where `userid`=?";
	
	String DELETE="delete from `address` where `addressid`=?";

	@Override
	public void setAddress(AddressModel address) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(INSERT);
			pstmt.setInt(1, address.getUserId());
			pstmt.setString(2, address.getAddressLine1());
			pstmt.setString(3, address.getAddressLine2());
			pstmt.setString(4, address.getLandmark());
			pstmt.setString(5, address.getCity());
			pstmt.setString(6, address.getState());
			pstmt.setString(7, address.getPostalCode());
			pstmt.setString(8, address.getAddressType());
			pstmt.setBoolean(9, address.getIsDefault());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateAddress(AddressModel address) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(UPDATE);
			pstmt.setString(1, address.getAddressLine1());
			pstmt.setString(2, address.getAddressLine2());
			pstmt.setString(3, address.getLandmark());
			pstmt.setString(4, address.getCity());
			pstmt.setString(5, address.getState());
			pstmt.setString(6, address.getPostalCode());
			pstmt.setString(7, address.getAddressType());
			pstmt.setBoolean(8, address.getIsDefault());
			pstmt.setInt(9, address.getAddressID());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteAddress(int addressId) {
		Connection con = DataBaseConnection.getConnection();
		try {
			PreparedStatement pstmt =con.prepareStatement(DELETE);

			pstmt.setInt(1, addressId);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public AddressModel getAddress(int addressId) {
		Connection con = DataBaseConnection.getConnection();
		AddressModel table=new AddressModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT);

			pstmt.setInt(1, addressId);
			ResultSet res=pstmt.executeQuery();
			
			if(res.next())
			{
				addressId=res.getInt("addressId");
				int userId=res.getInt("userId");
				String addressLine1=res.getString("addressLine1");
				String addressLine2=res.getString("addressLine2");
				String landmark=res.getString("landmark");
				String city=res.getString("city");
				String state=res.getString("state");
				String postalCode=res.getString("postalCode");
				String addressType=res.getString("addressType");
				Boolean isDefaultAddress=res.getBoolean("isDefault");
				table=new AddressModel(addressId,userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefaultAddress);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return table;
	}
	

	@Override
	public List<AddressModel> getAllAddress() {
		Connection con = DataBaseConnection.getConnection();
		List<AddressModel> list= new ArrayList<AddressModel>();
		AddressModel table=new AddressModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALL);


			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int addressId=res.getInt("addressId");
				int userId=res.getInt("userId");
				String addressLine1=res.getString("addressLine1");
				String addressLine2=res.getString("addressLine2");
				String landmark=res.getString("landmark");
				String city=res.getString("city");
				String state=res.getString("state");
				String postalCode=res.getString("postalCode");
				String addressType=res.getString("addressType");
				Boolean isDefaultAddress=res.getBoolean("isDefault");
				table=new AddressModel(addressId,userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefaultAddress);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AddressModel> getAllAddressByUser(int userId) {
		List<AddressModel> list= new ArrayList<AddressModel>();
		Connection con=DataBaseConnection.getConnection();
		AddressModel table=new AddressModel();
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECTALLBYUSER);

			pstmt.setInt(1, userId);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				int addressId=res.getInt("addressId");
				userId=res.getInt("userId");
				String addressLine1=res.getString("addressLine1");
				String addressLine2=res.getString("addressLine2");
				String landmark=res.getString("landmark");
				String city=res.getString("city");
				String state=res.getString("state");
				String postalCode=res.getString("postalCode");
				String addressType=res.getString("addressType");
				Boolean isDefaultAddress=res.getBoolean("isDefault");
				table=new AddressModel(addressId,userId,addressLine1,addressLine2,landmark,city,state,postalCode,addressType,isDefaultAddress);
				list.add(table);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
