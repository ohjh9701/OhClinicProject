package com.ohclinic.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Reserv {
	
	private int no;
	private int pNo;
	private int dNo;
	private String patientName;
	private String patientGender;
	private int patientAge;
	private String patientPhone;
	private String doctorName;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date nextReserv;
	
}
