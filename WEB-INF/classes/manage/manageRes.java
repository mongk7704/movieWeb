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
public class manageRes {
	
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
	public void changeState(int resv)
	{
		connect();
		String sql = "update film_reservation set resv_status='ok' where id_resv = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resv);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	public res getReservation(int fid)
	{
		connect();
		res rinfo=new res();
		String sql="select * from film_reservation where id_resv=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				rinfo.setId_film(rs.getInt("id_film"));
				rinfo.setId_mem(rs.getInt("id_mem"));
				rinfo.setId_resv(rs.getInt("id_resv"));
				rinfo.setFilm_name(rs.getString("film_name"));
				rinfo.setResv_date(rs.getDate("resv_date"));
				rinfo.setWatch_date(rs.getString("watch_date"));
				rinfo.setResv_status(rs.getString("resv_status"));
				rinfo.setSeat_resv_no(rs.getInt("seat_resv_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return rinfo;
		
	}
	public ArrayList<res> getDBList(int mid) {
		connect();
		ArrayList<res> mdata = new ArrayList<res>();
		
		String sql = "select * from film_reservation where id_mem = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				res rinfo = new res();
				rinfo.setId_film(rs.getInt("id_film"));
				rinfo.setId_mem(rs.getInt("id_mem"));
				rinfo.setId_resv(rs.getInt("id_resv"));
				rinfo.setFilm_name(rs.getString("film_name"));
				rinfo.setResv_date(rs.getDate("resv_date"));
				rinfo.setWatch_date(rs.getString("watch_date"));
				rinfo.setResv_status(rs.getString("resv_status"));
				rinfo.setSeat_resv_no(rs.getInt("seat_resv_no"));
				mdata.add(rinfo);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return mdata;
	}
	public void regist(int mid,int fid,String fname,String wdate,int sno)
	{
		connect();
		Calendar cal = Calendar.getInstance();
		Date d=new Date(cal.getTimeInMillis());
		String sql="insert into film_reservation(id_mem,id_film,film_name,watch_date,resv_date,seat_resv_no,resv_status) values(?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.setInt(2, fid);
			pstmt.setString(3, fname);
			pstmt.setString(4, wdate);
			pstmt.setDate(5, d);
			pstmt.setInt(6, sno);
			pstmt.setString(7, "-");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		
		
	}
	public ArrayList<Integer> RidfromMid(int mid)
	{
		connect();
		ArrayList<Integer> mdata = new ArrayList<Integer>();
		
		String sql="select id_resv from film_reservation where id_mem = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int val=0;
				val=rs.getInt(1);
				mdata.add(val);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		return mdata;
	}
	public ArrayList<Integer> RidfromFid(int fid)
	{
		connect();
		ArrayList<Integer> mdata = new ArrayList<Integer>();
		
		String sql="select id_resv from film_reservation where id_film = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int val=0;
				val=rs.getInt(1);
				mdata.add(val);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		return mdata;
	}
	public void delete(int resv)
	{
		connect();
		String sql="delete from film_reservation where id_resv = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, resv);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
	}
}
