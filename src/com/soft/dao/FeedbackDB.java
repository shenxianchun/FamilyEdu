package com.soft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.soft.Bean.FeedbackBean;
import com.soft.Bean.OrderBean;

public class FeedbackDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private int pageSize=7;//一页显示几条记录
	private int rowCount=0;//共有几条记录(查表)
	private int pageCount=0;//共有几页(计算)
	
	public int getPageCount(){//得到总页数
		conn=Conn.getConnect();
		String sql="select count(*) from feedback";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			//计算pageCount,这里的算法很多，可以自己设计
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return pageCount;
	}
	public ArrayList getOrderPage(int pageNow){//-----订单分页给定页数的数据------------
		ArrayList feedback=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from feedback ORDER BY create_time DESC limit ?,?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,7*pageNow-7);
			ps.setInt(2,pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				FeedbackBean fb=new FeedbackBean();
				fb.setId(rs.getInt("id"));
				fb.setName(rs.getString("name"));
				fb.setRole(rs.getString("role"));
				fb.setTell(rs.getString("tell"));
				fb.setContent(rs.getString("content"));
				fb.setCreate_time(rs.getString("create_time"));
				feedback.add(fb);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return feedback;
	}
	public boolean addfeedback(String tell,String name,String role,String content){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="insert into feedback(tell,name,role,content,create_time)values('"+tell+"','"+name+"','"+role+"','"+content+"',NOW())";
		try {
			ps=conn.prepareStatement(sql);
			//System.out.println(tt);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return tt;
	}
	public boolean dell(String id){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="delete from feedback where id="+id;
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return tt;
	}
	
	
	
	public void close(){
		try {
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
