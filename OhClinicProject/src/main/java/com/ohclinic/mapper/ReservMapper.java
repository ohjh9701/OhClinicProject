package com.ohclinic.mapper;

import java.util.List;

import com.ohclinic.domain.Reserv;

public interface ReservMapper {

	public int Create(Reserv reserv) throws Exception;
	public Reserv read(Reserv reserv) throws Exception;
	public int update(Reserv reserv) throws Exception;
	public int delete(Reserv reserv) throws Exception;
	public List<Reserv> list() throws Exception;
	
}
