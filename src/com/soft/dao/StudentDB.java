package com.soft.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soft.Bean.StudentBean;
import com.soft.Bean.TeacherBean;

public class StudentDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	private int pageSize=4;//一页显示几条记录
	private int rowCount=0;//共有几条记录(查表)
	private int pageCount=0;//共有几页(计算)
	
	public int getPageCount(){//得到总页数
		conn=Conn.getConnect();
		String sql="select count(*) from student";
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
	
	
	public ArrayList getTeacherPage(int pageNow){//------学生分页给定页数的数据------------
		ArrayList list=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from student ORDER BY create_time DESC limit ?,?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,4*pageNow-4);
			ps.setInt(2,pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				StudentBean bean=new StudentBean();
				bean.setId(rs.getInt("id"));
				bean.setU_id(rs.getInt("u_id"));
				bean.setS_name(rs.getString("s_name"));
				bean.setSex(rs.getString("sex"));
				bean.setAge(rs.getString("age"));
				bean.setTell(rs.getString("tell"));
				bean.setTime(rs.getString("time"));
				bean.setArea(rs.getString("area"));
				bean.setAddress(rs.getString("address"));
				bean.setGrade(rs.getString("grade"));
				bean.setStatus(rs.getString("status"));
				bean.setRequestSex(rs.getString("requestSex"));
				bean.setRequestMoney(rs.getString("requestMoney"));
				bean.setPid(rs.getString("pid"));
				bean.setAuthentication(rs.getString("authentication"));
				bean.setCreate_time(rs.getString("create_time"));
				list.add(bean);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return list;
	}
	
	//查询单个学生的信息
	public StudentBean getStudentInfo(String u_id){
		conn=Conn.getConnect();
		StudentBean bean=new StudentBean();
		String sql="select * from student where u_id="+u_id;
		conn=Conn.getConnect();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				bean.setId(rs.getInt("id"));
				bean.setU_id(rs.getInt("u_id"));
				bean.setS_name(rs.getString("s_name"));
				bean.setSex(rs.getString("sex"));
				bean.setAge(rs.getString("age"));
				bean.setTell(rs.getString("tell"));
				bean.setTime(rs.getString("time"));
				bean.setArea(rs.getString("area"));
				bean.setAddress(rs.getString("address"));
				bean.setGrade(rs.getString("grade"));
				bean.setStatus(rs.getString("status"));
				bean.setRequestSex(rs.getString("requestSex"));
				bean.setRequestMoney(rs.getString("requestMoney"));
				bean.setPid(rs.getString("pid"));
				bean.setAuthentication(rs.getString("authentication"));
				bean.setCreate_time(rs.getString("create_time"));
				
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		/*
		 * 20167-12添加end
		 * 
		 * */
		
		return bean;
	}
	
	
	
		public boolean UpdateStudent(String name,String pid,String age,String sex,String time,String grade,String requestSex,String address,String status,String requestMoney,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql = "update student set s_name='"+name+"',sex='"+sex+"',age='"+age+"',pid='"+pid+"',time='"+time+"',grade='"+grade+"',requestSex='"+requestSex+"',address='"+address+"',requestMoney='"+requestMoney+"',status='"+status+"',authentication='1"+"',create_time=NOW()"+"  where tell='"+tell+"'";  
        //String sql="update teacher set pid='"+pid+"'where id=1";
		//System.out.println("bb");
		try {
			ps=conn.prepareStatement(sql);
			//System.out.println(tt);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				System.out.print(tt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	    public List<String> Select(String tell){
	    	List<String> student = new ArrayList<String>();// 利用ArrayList类实例化List集合  
			conn=Conn.getConnect();
			String sql = "select * from student where tell='"+tell+"'";
			//System.out.println("21212");
	        try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				//System.out.println("fsdfsd");
				while(rs.next()){
					//System.out.println("bb");
					String name=rs.getString("s_name");
					String pid=rs.getString("pid");
					String sex=rs.getString("sex");
					String age=rs.getString("age");
					String time=rs.getString("time");
					String grade=rs.getString("grade");
					String requestSex=rs.getString("requestSex");
					String address=rs.getString("address");
					String status=rs.getString("status");
					String requestMoney=rs.getString("requestMoney");
					//System.out.println(username);
					student.add(name);
					student.add(pid);
					student.add(age);
					student.add(sex);
					student.add(time);
					student.add(grade);
					student.add(requestSex);
					student.add(address);
					student.add(status);
					student.add(requestMoney);
					}
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return student;
	    }
	    public boolean addOrder(String s_name,String t_name,String s_tell,String subject,String Rtime,String address,String method,String remark,String ttell,String money){
			boolean tt=false;
			conn=Conn.getConnect();
			String sql = "insert into reservation(s_name, t_name, s_tell, subject, Rtime, address, method, remark,t_tell,money)values('"+s_name+"','"+t_name+"','"+s_tell+"','"+subject+"','"+Rtime+"','"+address+"','"+method+"','"+remark+"','"+ttell+"','"+money+"')";  
	        //String sql="update teacher set pid='"+pid+"'where id=1";
			//System.out.println("bb");
			
			try {
				ps=conn.prepareStatement(sql);
				//System.out.println(tt);
				int i=ps.executeUpdate();
				if(i>0){
					tt=true;
					System.out.print(tt);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
