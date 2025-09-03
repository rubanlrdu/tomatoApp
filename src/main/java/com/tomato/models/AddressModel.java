package com.tomato.models;

public class AddressModel {
	
	
	int addressID;
	int userId;
	private String addressLine1;
	private String addressLine2;
	private String landmark;
	private String city;
	private String state;
	private String postalCode;
	private String addressType;
	private Boolean isDefault;
	public AddressModel()
	{
		
	}
	
	public AddressModel(int userId, String addressLine1, String addressLine2, String landmark, String city,
			String state, String postalCode, String addressType, Boolean isDefault) {
		super();
		this.userId = userId;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.postalCode = postalCode;
		this.addressType = addressType;
		this.isDefault = isDefault;
	}
	
	
	public AddressModel(int addressID, int userId, String addressLine1, String addressLine2, String landmark,
			String city, String state, String postalCode, String addressType, Boolean isDefault) {
		super();
		this.addressID = addressID;
		this.userId = userId;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.postalCode = postalCode;
		this.addressType = addressType;
		this.isDefault = isDefault;
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	public String getAddressType() {
		return addressType;
	}
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Override
	public String toString() {
		return "AddressModel [addressID=" + addressID + ", userId=" + userId + ", addressLine1=" + addressLine1
				+ ", addressLine2=" + addressLine2 + ", landmark=" + landmark + ", city=" + city + ", state=" + state
				+ ", postalCode=" + postalCode + ", addressType=" + addressType + ", isDefault=" + isDefault + "]";
	}
	
	public String getAddress()
	{
		String address=addressLine1+", "+addressLine2+", "+landmark+", "+city+", "+state+", "+postalCode +", Address Type : "+addressType;
		return address;
	}




}
