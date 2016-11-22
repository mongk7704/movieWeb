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

public class manageMem {
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
	public memberbean login(String id,String pass)
	{
		connect();
		memberbean mdata=new memberbean();
		String sql= "select *from membership where password=? and name_mem=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()!=false){
			mdata.setName_mem(rs.getString("name_mem"));
			mdata.setId_mem(rs.getInt("id_mem"));
			mdata.setPassword(rs.getString("password"));
			mdata.setAge_mem(rs.getInt("age_mem"));
			mdata.setRdate(rs.getString("rdate"));
			rs.close();}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
		disconnect();}
		
		return mdata;	
	}
	public boolean check(String id)
	{
		connect();
		boolean flag = false;
		String sql="select* from membership where name_mem = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			flag=rs.next();
			rs.close();
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		return flag;
		
		
	}
	public void regist(memberbean mem)
	{
		connect();
		Calendar cal = Calendar.getInstance();
		Date d=new Date(cal.getTimeInMillis());
		String sql="insert into membership(name_mem,password,age_mem,rdate) values(?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mem.getName_mem());
			pstmt.setString(2, mem.getPassword());
			pstmt.setInt(3, mem.getAge_mem());
			pstmt.setDate(4, d);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
		
	}
	public void reform(int id,String password,int age)
	{
		connect();
		String sql="update membership set password= ? , age_mem=? where id_mem=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setInt(2, age);
			pstmt.setInt(3, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
	}
	public ArrayList<memberbean> getDBList() {
		connect();
		ArrayList<memberbean> mdata = new ArrayList<memberbean>();
		
		String sql = "select * from membership order by id_mem desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				memberbean minfo = new memberbean();
				minfo.setId_mem(rs.getInt("id_mem"));
				minfo.setName_mem(rs.getString("name_mem"));
				minfo.setAge_mem(rs.getInt("age_mem"));
				minfo.setRdate(rs.getString("rdate"));
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
	public void delete(int mid)
	{
		connect();
		String sql="delete from membership where id_mem = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			disconnect();}
	}
	
	
}
