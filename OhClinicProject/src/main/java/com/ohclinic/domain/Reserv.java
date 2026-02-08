package com.ohclinic.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reserv {
	
	private int no;
	private int pNo;
	private int dNo;
	private String pName;
	private String pGender;
	private int pAge;
	private String pPhone;
	private String dName;
	private Date nextReserv;
	
}
