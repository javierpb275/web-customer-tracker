package com.javi.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javi.springdemo.dao.CustomerDAO;
import com.javi.springdemo.entity.Customer;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	// need to inject the customer DAO (Data Access Object)
	@Autowired
	private CustomerDAO customerDAO;//Spring will scan for a component that implements CustomerDAO interface
	
	@RequestMapping("/list")
	public String listCustomers(Model theModel) {
		
		// get customers from the DAO
		List<Customer> theCustomers = customerDAO.getCustomers();
						
		// add the customers to the model
		theModel.addAttribute("customers", theCustomers);//name, value
		
		return "list-customers";
		
	}

}
