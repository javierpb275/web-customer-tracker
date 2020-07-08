package com.javi.springdemo.dao;

import java.util.List;

import com.javi.springdemo.entity.Customer;

public interface CustomerDAO {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);
	
}
