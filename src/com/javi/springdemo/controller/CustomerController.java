package com.javi.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javi.springdemo.dao.CustomerDAO;
import com.javi.springdemo.entity.Customer;
import com.javi.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	// We are no longer gonna use our DAO(Data Acces Object) instead we're gonna use our new Service layer(Customer Service)
	// need to inject our customer service
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		
		// get customers the Customer Service layer (no longer from the DAO)
		List<Customer> theCustomers = customerService.getCustomers();//Delegate calls to Service
						
		// add the customers to the model
		theModel.addAttribute("customers", theCustomers);//name, value
		
		return "list-customers";
		
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		Customer theCustomer = new Customer();
		
		theModel.addAttribute("customer", theCustomer);//name, value
		
		return "customer-form";
		
	}

}
