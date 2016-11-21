package beans;

import java.util.Date;

public class res {
	private int id_resv;
	private int id_mem;
	private int id_film;
	private String film_name;
	private String watch_date;
	private Date resv_date;
	private int seat_resv_no;
	private String resv_status="-";
	public int getId_resv() {
		return id_resv;
	}
	public void setId_resv(int id_resv) {
		this.id_resv = id_resv;
	}
	public int getId_mem() {
		return id_mem;
	}
	public void setId_mem(int id_mem) {
		this.id_mem = id_mem;
	}
	public int getId_film() {
		return id_film;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public String getFilm_name() {
		return film_name;
	}
	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}
	public String getWatch_date() {
		return watch_date;
	}
	public void setWatch_date(String watch_date) {
		this.watch_date = watch_date;
	}
	public Date getResv_date() {
		return resv_date;
	}
	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}
	public int getSeat_resv_no() {
		return seat_resv_no;
	}
	public void setSeat_resv_no(int seat_resv_no) {
		this.seat_resv_no = seat_resv_no;
	}
	public String getResv_status() {
		return resv_status;
	}
	public void setResv_status(String resv_status) {
		this.resv_status = resv_status;
	}
	
	
}
