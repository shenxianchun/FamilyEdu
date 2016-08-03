package com.soft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class RgsDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public ArrayList getRegion(){//得到所有地区
		conn=Conn.getConnect();
		ArrayList al=new ArrayList();
		String sql="select r_name from region";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				al.add(rs.getString(1));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	public ArrayList getGrade(){//得到所有年级
		conn=Conn.getConnect();
		ArrayList al=new ArrayList();
		String sql="select g_name from grade";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				al.add(rs.getString(1));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	public ArrayList getSubject(){//得到所有科目
		conn=Conn.getConnect();
		ArrayList al=new ArrayList();
		String sql="select s_name from subject";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				al.add(rs.getString(1));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	public ArrayList getSchool(){//得到所有科目
		conn=Conn.getConnect();
		ArrayList al=new ArrayList();
		String sql="select graduate_school from teacher GROUP BY graduate_school";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				al.add(rs.getString(1));
			}
				
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	//关闭资源
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
