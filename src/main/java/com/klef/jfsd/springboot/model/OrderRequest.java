package com.klef.jfsd.springboot.model;

import lombok.Data;

@Data
public class OrderRequest 
{
   private String fullname;
   
   private String email;
   
   private String mobileno;
   
   private String address;
   
   @Override
public String toString() {
	return "OrderRequest [fullname=" + fullname + ", email=" + email + ", mobileno=" + mobileno + ", address=" + address
			+ ", city=" + city + ", state=" + state + ", pincode=" + pincode + ", paymentType=" + paymentType + "]";
}

private String city;
   
   private String state;
   
   private String pincode;
   
   private String paymentType;

public String getFullname() {
	return fullname;
}

public void setFullname(String fullname) {
	this.fullname = fullname;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getMobileno() {
	return mobileno;
}

public void setMobileno(String mobileno) {
	this.mobileno = mobileno;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
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

public String getPincode() {
	return pincode;
}

public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String getPaymentType() {
	return paymentType;
}

public void setPaymentType(String paymentType) {
	this.paymentType = paymentType;
}
}
