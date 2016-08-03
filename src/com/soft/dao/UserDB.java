package com.soft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	public boolean regester(String tell){//判断注册用户是否已注册
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="select tell from user where tell="+tell;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
		 	while(rs.next()){
		   		//说明用户名存在
		   		if(rs.getString(1).equals(tell)){
		   			//注册失败
		   			tt=true;
		   			return tt;
		   		}
		 	}
		 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return tt;
	}
	
	//注册成功写入数据库
	public boolean InsertUser(String tell,String password,String role){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="insert into user(tell,password,role)values('"+tell+"','"+password+"','"+role+"')";
		try {
			ps=conn.prepareStatement(sql);
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
	//查询user表中对应电话的id号
	public String Uid(String tell){
		conn=Conn.getConnect();
		String uid="";
		String sql="select id from user where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				uid=rs.getInt(1)+"";
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uid;
	}
	
	
	//注册成功同时写入相应的教员/学员表
	public boolean Insert(String u_id,String tell,String role){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="";
		if(role.equals("教员")){
			sql="insert into teacher(u_id,tell,authentication,create_time)values('"+u_id+"','"+tell+"','0',NOW())";
		}
		if(role.equals("学员")){
			sql="insert into student(u_id,tell,authentication,create_time)values('"+u_id+"','"+tell+"','0',NOW())";
		}
		if(!sql.equals("")){
			try {
				ps=conn.prepareStatement(sql);
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
			
		}
		return tt;
	}
	
	
	
	
	
	
	
	
	
	//修改密码
	public boolean UpdatePW(String tell,String password){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update user set password='"+password+"' where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	
	//用户登陆
	public List<String> login(String usertell,String password){
		List<String> user = new ArrayList<String>();// 利用ArrayList类实例化List集合  
		conn=Conn.getConnect();
		System.out.println("=========================");
		String sql="select id,tell,password,role from user where tell='"+usertell+"'";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				System.out.println();
				int id=rs.getInt("id");
				String tell=rs.getString("tell");
				String upassword=rs.getString("password");
				String rolt=rs.getString("role");
				user.add(id+"");
				user.add(tell);
				user.add(upassword);
				user.add(rolt);
				
				if(tell.equals(usertell)&&upassword.equals(password)){
					return user;
				}else{
					return null;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return null;
	}
	
	//根据注册的角色查询不同表
	public String username(String id,String role){	
		conn=Conn.getConnect();
		String s_sql="";
		String name=null;
		if(role.equals("student")){
			s_sql="select s_name from student where u_id='"+id+"'";
		}
		else if(role.equals("teacher")){
			s_sql="select t_name from teacher where u_id='"+id+"'";
		}else if(role.equals("manager")){
			s_sql="select m_name from manager where u_id='"+id+"'";
		}
		try {
			ps=conn.prepareStatement(s_sql);
			rs=ps.executeQuery();
			if(rs.next()){
				name=rs.getString(1);
			}else{
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return name;
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