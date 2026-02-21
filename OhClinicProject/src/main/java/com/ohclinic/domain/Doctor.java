package com.ohclinic.domain;

import lombok.Data;

@Data
public class Doctor {
	
	private int no;
	private String id;
	private String password;
	private String name;
	private String specialty;
	private String location;
	private String workTime;
	
	private int enabled;
	
}
