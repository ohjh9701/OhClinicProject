package com.ohclinic.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Patient {
	
	private int no;
	private String name;
	private String birthYear;
	private char gender;
	private int age;
	private String phone;
	private String location;
	private Date lastReserv;
	private Date nextReserv;
	private Doctor doctor;
	
	private String searchName;
	private String searchLocation;
	
}
