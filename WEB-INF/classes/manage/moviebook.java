package manage;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import beans.*;
public class moviebook {
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
	public int regist(moviebean mem)
	{
		connect();
		int val=0;
		String sql="insert into film(name_film,age_phase,seat_num,watch_date) values(?,?,?,?)";
		String sql2="select LAST_INSERT_ID()";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mem.getName_film());
			pstmt.setString(2, mem.getAge_phase());
			pstmt.setInt(3, mem.getSeat_num());
			pstmt.setString(4, mem.getWatch_date());
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			val=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		return val;
	}
	public moviebean getMovie(int fid)
	{
		connect();
		moviebean minfo=new moviebean();
		String sql="select * from film where id_film=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				minfo.setId_film(rs.getInt("id_film"));
				minfo.setName_film(rs.getString("name_film"));
				minfo.setSeat_num(rs.getInt("seat_num"));
				minfo.setAge_phase(rs.getString("age_phase"));
				minfo.setWatch_date(rs.getString("watch_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return minfo;
		
	}
	public ArrayList<moviebean> getDBList() {
		connect();
		ArrayList<moviebean> mdata = new ArrayList<moviebean>();
		
		String sql = "select * from film order by id_film desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				moviebean minfo = new moviebean();
				minfo.setId_film(rs.getInt("id_film"));
				minfo.setName_film(rs.getString("name_film"));
				minfo.setSeat_num(rs.getInt("seat_num"));
				minfo.setAge_phase(rs.getString("age_phase"));
				minfo.setWatch_date(rs.getString("watch_date"));
				mdata.add(minfo);
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
	public void delete(int fid)
	{
		connect();
		String sql="delete from film where id_film = ? ";
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
}
