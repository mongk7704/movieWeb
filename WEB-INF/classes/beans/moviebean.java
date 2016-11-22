package beans;

public class moviebean {
	private int id_film;
	private String name_film;
	private String age_phase;
	private int seat_num;
	private String watch_date;
	public int getId_film() {
		return id_film;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public String getName_film() {
		return name_film;
	}
	public void setName_film(String name_film) {
		this.name_film = name_film;
	}
	public String getAge_phase() {
		return age_phase;
	}
	public void setAge_phase(String age_phase) {
		this.age_phase = age_phase;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public String getWatch_date() {
		return watch_date;
	}
	public void setWatch_date(String watch_date) {
		this.watch_date = watch_date;
	}
}