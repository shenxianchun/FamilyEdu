package com.soft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.soft.Bean.LessionBean;
import com.soft.Bean.OrderBean;
import com.soft.Bean.TeacherBean;

public class TeacherDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	private int pageSize=4;//一页显示几条记录
	private int rowCount=0;//共有几条记录(查表)
	private int pageCount=0;//共有几页(计算)
	
	public int getPageCount(){//得到总页数
		conn=Conn.getConnect();
		String sql="select count(*) from teacher";
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
	public ArrayList getTeacherPage(int pageNow){//------分页给定页数的数据------------
		ArrayList list=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from teacher ORDER BY create_time DESC limit ?,?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,4*pageNow-4);
			ps.setInt(2,pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				TeacherBean bean=new TeacherBean();
				bean.setId(rs.getInt("id"));
				bean.setU_id(rs.getInt("u_id"));
				bean.setPid(rs.getString("pid"));
				bean.setImages(rs.getString("images"));
				bean.setT_name(rs.getString("t_name"));
				bean.setSex(rs.getString("sex"));
				bean.setAge(rs.getString("age"));
				bean.setNationality(rs.getString("nationality"));
				bean.setTell(rs.getString("tell"));
				bean.setEmail(rs.getString("email"));
				bean.setMotto(rs.getString("motto"));
				bean.setIntroduce(rs.getString("introduce"));
				bean.setGraduate_school(rs.getString("graduate_school"));
				bean.setSpecialty(rs.getString("specialty"));
				bean.setEducation(rs.getString("education"));
				bean.setAddress(rs.getString("address"));
				bean.setAuthentication(rs.getString("authentication"));
				bean.setExperience(rs.getString("experience"));
				bean.setMoney(rs.getString("money"));
				bean.setTeach_time(rs.getString("teach_time"));
				bean.setSubject(rs.getString("subject"));//得到所查询的科目
				bean.setArea(rs.getString("area"));//得到授课区域
				bean.setCreate_time(rs.getString("create_time"));
				bean.setImageC(rs.getString("imageC"));
				bean.setImageE(rs.getString("imageE"));
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
	
	//搜索教员
	public ArrayList SearchTeacher(String s_where){
		ArrayList list=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from teacher where id is not null and authentication!='0' "+s_where+" order by create_time DESC";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
				while(rs.next()){
					TeacherBean bean=new TeacherBean();
					bean.setId(rs.getInt("id"));
					bean.setU_id(rs.getInt("u_id"));
					bean.setPid(rs.getString("pid"));
					bean.setImages(rs.getString("images"));
					bean.setT_name(rs.getString("t_name"));
					bean.setSex(rs.getString("sex"));
					bean.setAge(rs.getString("age"));
					bean.setNationality(rs.getString("nationality"));
					bean.setTell(rs.getString("tell"));
					bean.setEmail(rs.getString("email"));
					bean.setMotto(rs.getString("motto"));
					bean.setIntroduce(rs.getString("introduce"));
					bean.setGraduate_school(rs.getString("graduate_school"));
					bean.setSpecialty(rs.getString("specialty"));
					bean.setEducation(rs.getString("education"));
					bean.setAddress(rs.getString("address"));
					bean.setAuthentication(rs.getString("authentication"));
					bean.setExperience(rs.getString("experience"));
					bean.setMoney(rs.getString("money"));
					bean.setTeach_time(rs.getString("teach_time"));
					bean.setSubject(rs.getString("subject"));//得到所查询的科目
					bean.setArea(rs.getString("area"));//得到授课区域
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
	
	
	
	//查询所授科目
	public String subject(String tell){
			conn=Conn.getConnect();
			String tt="";
			String sql="select grade,subject from lesson where tell=?";
			String grade="";String subject="";
			try {
				ps=conn.prepareStatement(sql);
				ps.setString(1,tell);
				rs=ps.executeQuery();
				if(rs.next()){
					while(rs.next()){
						grade=rs.getString(1);
						subject=rs.getString(2);
						tt=tt+grade+subject+"|";
					}
				}else{
					tt="暂未设置";
				}
			sql="update teacher set subject='"+tt+"' where tell="+tell;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			System.out.println(tt);
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return tt;
		}
	
	
	
	//查询教授区域和地址
	public List<String> getAddress(String tell){
		List<String> teacher = new ArrayList<String>();// 利用ArrayList类实例化List集合  
		conn=Conn.getConnect();
		System.out.println("===========查询授课区域==============");
		String sql="select area,address from teacher where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString("area"));
				String area=rs.getString("area");
				String address=rs.getString("address");
				teacher.add(area);
				teacher.add(address);
			}else{
				return null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return teacher;
	}
	//修改教授区域和地址
	public boolean UpdateAddress(String area,String address,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update teacher set area='"+area+"',address='"+address+"' where tell='"+tell+"'";
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
		}
		return tt;
	}
	
	
	//查询可授课表
	public ArrayList getLession(String tell){
		conn=Conn.getConnect();
		ArrayList lesson=new ArrayList();
		String sql="select id,grade,subject from lesson where tell='"+tell+"' ORDER BY id DESC";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				while(rs.next()){
					LessionBean lb=new LessionBean();
					lb.setId(rs.getInt(1));
					lb.setGrade(rs.getString(2));
					lb.setSubject(rs.getString(3));
					lesson.add(lb);
				}
			}else{
				return null;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return lesson;
	}
	//添加可授课表
	public boolean setLession(String tell,String grade,String subject){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="insert into lesson(tell,grade,subject)values('"+tell+"','"+grade+"','"+subject+"')";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				subject(tell);//添加成功及时插入teacher表
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	//删除授课信息
	public boolean dellLession(String id,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="delete from lesson where id="+id;
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				subject(tell);//添加成功及时插入teacher表
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
	//查询头像
	public List<String> selectImg(String tell){
		List<String> list=new ArrayList<String>();
		conn=Conn.getConnect();
		String sql="select images,imageC,imageE from teacher where tell="+tell;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				list.add(rs.getString("images"));
				list.add(rs.getString("imageC"));
				list.add(rs.getString("imageE"));
			}else{
				return null;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//更新头像------------------------------------------------------
	public boolean Updateimg(String path,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		try {
				String sql="update teacher set images='"+path+"' where tell="+tell;
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
	
	//更新身份图片------------------------------------------------------
		public boolean UpdatePidimg(String path,String tell){
			boolean tt=false;
			conn=Conn.getConnect();
			try {
					String sql="update teacher set imageC='"+path+"' where tell="+tell;
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
		//更新学历图片------------------------------------------------------
		public boolean UpdatEdueimg(String path,String tell){
			boolean tt=false;
			conn=Conn.getConnect();
			try {
					String sql="update teacher set imageE='"+path+"' where tell="+tell;
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
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * 20167-12添加start
	 * 教员个人信息（主页）
	 * */
	public TeacherBean getTeacherInfo(String u_id){
		conn=Conn.getConnect();
		//ArrayList list=new ArrayList();
		TeacherBean bean=new TeacherBean();
		String sql="select * from teacher where u_id="+u_id;
		conn=Conn.getConnect();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				bean.setId(rs.getInt("id"));
				bean.setU_id(rs.getInt("u_id"));
				bean.setPid(rs.getString("pid"));
				bean.setImages(rs.getString("images"));
				bean.setT_name(rs.getString("t_name"));
				bean.setSex(rs.getString("sex"));
				bean.setAge(rs.getString("age"));
				bean.setNationality(rs.getString("nationality"));
				bean.setTell(rs.getString("tell"));
				bean.setEmail(rs.getString("email"));
				bean.setMotto(rs.getString("motto"));
				bean.setIntroduce(rs.getString("introduce"));
				bean.setGraduate_school(rs.getString("graduate_school"));
				bean.setSpecialty(rs.getString("specialty"));
				bean.setEducation(rs.getString("education"));
				bean.setAddress(rs.getString("address"));
				bean.setAuthentication(rs.getString("authentication"));
				bean.setExperience(rs.getString("experience"));
				bean.setMoney(rs.getString("money"));
				bean.setTeach_time(rs.getString("teach_time"));
				bean.setSubject(rs.getString("subject"));//得到所查询的科目
				bean.setArea(rs.getString("area"));//得到授课区域
				bean.setCreate_time(rs.getString("create_time"));
				bean.setImageC(rs.getString("imageC"));
				bean.setImageE(rs.getString("imageE"));
				//list.add(bean);
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
	
	//更新教员信息
	public boolean UpdateTeacher(String pid,String username,String sex,String age,String nation,String email,String motto,String introduce,String graduate_school,String specialty,String education,String experience,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql = "update teacher set pid='"+pid+"',t_name='"+username+"',sex='"+sex+"',age='"+age+"',nationality='"+nation+"',email='"+email+"',motto='"+motto+"',introduce='"+introduce+"',graduate_school='"+graduate_school+"',specialty='"+specialty+"',education='"+education+"',experience='"+experience+"'  where tell='"+tell+"'";  
        //String sql="update teacher set pid='"+pid+"'where id=1";
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
	
	public List<String> Select(String tell){
	    	List<String> teacher = new ArrayList<String>();// 利用ArrayList类实例化List集合  
			conn=Conn.getConnect();
			System.out.println("查询个人信息-------------");
			String sql = "select * from teacher where tell='"+tell+"'";
			//System.out.println("21212");
	        try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				//System.out.println("fsdfsd");
				if(rs.next()){
					String username=rs.getString("t_name");
					String pid=rs.getString("pid");
					String sex=rs.getString("sex");
					String age=rs.getString("age");
					String nation=rs.getString("nationality");
					String email=rs.getString("email");
					String motto=rs.getString("motto");
					String introduce=rs.getString("introduce");
					String graduate_school=rs.getString("graduate_school");
					String specialty=rs.getString("specialty");
					String education=rs.getString("education");
					String experience=rs.getString("experience");
					teacher.add(username);
					teacher.add(pid);
					teacher.add(age);
					teacher.add(sex);
					teacher.add(nation);
					teacher.add(email);
					teacher.add(motto);
					teacher.add(introduce);
					teacher.add(graduate_school);
					teacher.add(specialty);
					teacher.add(education);
					teacher.add(experience);
					}
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return teacher;
	    }
	public boolean SetTimeMoney(String teach_time,String money,String tell){
			boolean tt=false;
			conn=Conn.getConnect();
			String sql = "update teacher set money='"+money+"',teach_time='"+teach_time+"' where tell='"+tell+"'";  
	        //String sql="update teacher set pid='"+pid+"'where id=1";
			try {
				ps=conn.prepareStatement(sql);
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

	//查询订单信息
	public ArrayList order(String tell,String role){
	   try {
	    	conn=Conn.getConnect();
	    	ArrayList order=new ArrayList();
	    	String sql="";
	    	if(role.equals("教员")){
	    		sql="select id,s_tell,subject,Rtime,address,method,money,remark,s_name from reservation where t_tell='"+tell+"'";
	    		ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					OrderBean ob=new OrderBean();
					ob.setId(rs.getInt("id"));
					ob.setS_tell(rs.getString("s_tell"));
					ob.setSubject(rs.getString("subject"));
					ob.setRtime(rs.getString("Rtime"));
					ob.setAddress(rs.getString("address"));
					ob.setMethod(rs.getString("method"));
					ob.setMoney(rs.getString("money"));
					ob.setRemark(rs.getString("remark"));
					ob.setS_name(rs.getString("s_name"));
					System.out.println(ob);
					order.add(ob);
				}
				return order;
	    	}
	    	if(role.equals("学员")){
	    		sql="select id,t_tell,subject,Rtime,address,method,money,remark,t_name from reservation where s_tell='"+tell+"'";
	    		ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					OrderBean ob=new OrderBean();
					ob.setId(rs.getInt("id"));
					ob.setT_tell(rs.getString("t_tell"));
					ob.setSubject(rs.getString("subject"));
					ob.setRtime(rs.getString("Rtime"));
					ob.setAddress(rs.getString("address"));
					ob.setMethod(rs.getString("method"));
					ob.setMoney(rs.getString("money"));
					ob.setRemark(rs.getString("remark"));
					ob.setT_name(rs.getString("t_name"));
					order.add(ob);
				}
				return order;
	    	}
				
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				this.close();
			}
	    	return null;
	    }
	    
	public boolean au_teacher(String u_id,String flag){//教员认证
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update "+flag+" set authentication='1',create_time=NOW() where u_id='"+u_id+"'";
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
		}
		return tt;
	}
	
	public boolean dell_teacher(String u_id){//删除教员
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="delete from user where id="+u_id;
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
		}
		return tt;
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

