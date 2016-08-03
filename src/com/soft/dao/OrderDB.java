package com.soft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.soft.Bean.OrderBean;
import com.soft.Bean.StudentBean;

public class OrderDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	private int pageSize=4;//一页显示几条记录
	private int rowCount=0;//共有几条记录(查表)
	private int pageCount=0;//共有几页(计算)
	
	public int getPageCount(){//得到总页数
		conn=Conn.getConnect();
		String sql="select count(*) from reservation";
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
		ArrayList order=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from reservation ORDER BY create_time DESC limit ?,?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,4*pageNow-4);
			ps.setInt(2,pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				OrderBean ob=new OrderBean();
				ob.setId(rs.getInt("id"));
				ob.setT_name(rs.getString("t_name"));
				ob.setT_tell(rs.getString("t_tell"));
				ob.setS_name(rs.getString("s_name"));
				ob.setS_tell(rs.getString("s_tell"));
				ob.setSubject(rs.getString("subject"));
				ob.setRtime(rs.getString("Rtime"));
				ob.setRstatu(rs.getString("Rstatu"));
				ob.setAddress(rs.getString("address"));
				ob.setMethod(rs.getString("method"));
				ob.setMoney(rs.getString("money"));
				ob.setRemark(rs.getString("remark"));
				ob.setCreate_time(rs.getString("create_time"));
				order.add(ob);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return order;
	}
	
	public boolean UpdateOrder(String flag,String id,String t_tell,String s_tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update reservation set Rstatu='"+flag+"' where id="+id;
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				String sql1="update teacher set authentication='"+flag+"' where tell='"+t_tell+"'";
				String sql2="update student set authentication='"+flag+"' where tell='"+s_tell+"'";
				ps=conn.prepareStatement(sql1);
				ps.executeUpdate();
				ps=conn.prepareStatement(sql2);
				ps.executeUpdate();
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
	public boolean dellOrder(String id){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="delete from reservation where id="+id;
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
