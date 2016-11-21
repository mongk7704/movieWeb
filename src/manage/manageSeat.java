package manage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import beans.*;

public class manageSeat {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/film_booking"; 
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"root","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void delete(int fid)
	{
		connect();
		String sql="delete from seat_no where id_film = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
	}
	

	public void regist(int id)
	{
		connect();
		
		String sql="insert into seat_no(id_film) values(?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		
	}
	public void makePay(int mid,int fid,String sname)
	{
		connect();
		String sql ="update seat_no set "+sname + "=1 where id_film = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, sname);
			//pstmt.setInt(2, mid);
			pstmt.setInt(1, fid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	public void deleteRes(int mid,int fid,String sname)
	{
		connect();
		String sql ="update seat_no set "+sname + "=0 where id_film = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	public seat getDBList(int filmno) {
		connect();
		seat sdata = new seat();
		
		String sql = "select * from seat_no where id_film=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, filmno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				sdata.setId_seat(rs.getInt("id_seat"));
				sdata.setSeat1(rs.getInt("seat1"));
				sdata.setSeat2(rs.getInt("seat2"));
				sdata.setSeat3(rs.getInt("seat3"));
				sdata.setSeat4(rs.getInt("seat4"));
				sdata.setSeat5(rs.getInt("seat5"));
				sdata.setSeat6(rs.getInt("seat6"));
				sdata.setSeat7(rs.getInt("seat7"));
				sdata.setSeat8(rs.getInt("seat8"));
				sdata.setSeat9(rs.getInt("seat9"));
	
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return sdata;
	}
}
