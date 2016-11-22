package beans;

public class seat {
	private int id_seat;
	private int id_film;
	private int seat1;
	private int seat2;
	private int seat3;
	private int seat4;
	private int seat5;
	private int seat6;
	private int seat7;
	private int seat8;
	private int seat9;
	public boolean seatCheck()
	{
		if(seat1+seat2+seat3+seat4+seat5+seat6+seat7+seat8+seat9==9)
			return false;
		else
			return true;					
	}
	public int getId_seat() {
		return id_seat;
	}
	public void setId_seat(int id_seat) {
		this.id_seat = id_seat;
	}
	public int getId_film() {
		return id_film;
	}
	public void setId_film(int id_film) {
		this.id_film = id_film;
	}
	public int getSeat1() {
		return seat1;
	}
	public void setSeat1(int seat1) {
		this.seat1 = seat1;
	}
	public int getSeat2() {
		return seat2;
	}
	public void setSeat2(int seat2) {
		this.seat2 = seat2;
	}
	public int getSeat3() {
		return seat3;
	}
	public void setSeat3(int seat3) {
		this.seat3 = seat3;
	}
	public int getSeat4() {
		return seat4;
	}
	public void setSeat4(int seat4) {
		this.seat4 = seat4;
	}
	public int getSeat5() {
		return seat5;
	}
	public void setSeat5(int seat5) {
		this.seat5 = seat5;
	}
	public int getSeat6() {
		return seat6;
	}
	public void setSeat6(int seat6) {
		this.seat6 = seat6;
	}
	public int getSeat7() {
		return seat7;
	}
	public void setSeat7(int seat7) {
		this.seat7 = seat7;
	}
	public int getSeat8() {
		return seat8;
	}
	public void setSeat8(int seat8) {
		this.seat8 = seat8;
	}
	public int getSeat9() {
		return seat9;
	}
	public void setSeat9(int seat9) {
		this.seat9 = seat9;
	}
	public String seatState(int seat)
	{
		if(seat==0)
			return "예약가능";
		else
			return "예약불가";
	}

}
