package DBConnect;
import java.util.Date;  
import java.sql.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class dbconnect {
	
	public String  query = "select * from fertilizer";
	public Connection con;
	public Statement st;
	public ResultSet rs;
	public PreparedStatement stm;
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
    Date date= new Date();
    String presentDate =  formatter.format(date).toString();

	
	public Connection connect() throws ClassNotFoundException, SQLException 
	{
		String url = "jdbc:mysql://localhost:3306/ramanafertilizer";
		String user = "root";
		String password ="Divya@24";
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url,user,password);
		return con;
	}
	public ResultSet getFertilizers() throws ClassNotFoundException, SQLException 
	{
		con = connect();
		st = con.createStatement();
		rs = st.executeQuery(query);
		return rs;
	}
	
	//Add Stock
	public void addStock(String fert,String comp,double price, int qty)throws ClassNotFoundException, SQLException 
	{
		con = connect();
		stm = con.prepareStatement("update fertilizer set price=?,qty=qty+? where name=?");
		stm.setDouble(1, price);
		stm.setInt(2, qty);
		stm.setString(3, fert);
		int f = stm.executeUpdate();	
		System.out.println(f);
		if(f==0)
		{
			stm = con.prepareStatement("insert into fertilizer values(?,?,?,?)");
			stm.setString(1, fert);
			stm.setDouble(2, price);
			stm.setInt(3, qty);
			stm.setString(4, comp);
			stm.execute();
		}
	}
	
	//Add sells
	public void addSells(String fert,int qty, float price )throws ClassNotFoundException, SQLException 
	{
		con = connect();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
//	    Date date = new Date();
	    stm = con.prepareStatement("insert into sell values(?,?,?,?)");
	    stm.setString(1, fert);
	    stm.setString(2, presentDate);
	    stm.setInt(3, qty);
	    stm.setFloat(4, price);
	    stm.execute();
	    stm = con.prepareStatement("update fertilizer set qty = qty-? where name=?");
	    stm.setInt(1, qty);
	    stm.setString(2, fert);
	    stm.execute();
	    
	}
	
	//Add transaction
	public ResultSet addTransaction(String c_name, float total)throws ClassNotFoundException, SQLException 
	{
		con = connect();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
//	    Date date = new Date();
	    total += total*0.12;
	    stm = con.prepareStatement("insert into transaction(c_name,t_date,total) values(?,?,?)");
	    stm.setString(1, c_name);
	    stm.setString(2, presentDate);
	    stm.setFloat(3, total);
	    stm.execute();	
	    st = con.createStatement();
	    rs = st.executeQuery("select tid from transaction order by tid desc limit 1");
	    return rs;
	}

	//Recent sales
	public ResultSet recentSales()throws ClassNotFoundException, SQLException 
	{
		con = connect();
	    st = con.createStatement();
	    rs = st.executeQuery("select * from transaction order by t_date desc limit 10");
	    return rs;
	}
	
	
	//Top Fertilizers
	public ResultSet topItems()throws ClassNotFoundException, SQLException 
	{
		con = connect();
	    st = con.createStatement();
	    rs = st.executeQuery("select fertilizer,sum(qty) as Quantity from sell group by fertilizer order by Quantity desc limit 10");
	    return rs;
	}
	
	//Generate reports product wise
	public ResultSet productWise(String from, String to)throws ClassNotFoundException, SQLException 
	{
		con = connect();
	    stm = con.prepareStatement("select * from sell where s_date between ? and ?");
	    stm.setString(1,from);
	    stm.setString(2, to);
	    rs = stm.executeQuery();
	    return rs;
	}
	
	//Generate reports customer wise
	public ResultSet customerWise(String from, String to)throws ClassNotFoundException, SQLException 
	{
		con = connect();
	    stm = con.prepareStatement("select * from transaction where t_date between ? and ?");
	    stm.setString(1,from+" 00:00:00");
	    stm.setString(2, to+" 23:59:59");
	    rs = stm.executeQuery();
	    return rs;
	}
	
	//Register new admin
	public void Register(String username,String email,String license,String password) throws ClassNotFoundException, SQLException
	{
		con = connect();
		stm = con.prepareStatement("insert into admin values(?,?,?,?)");
		stm.setString(1,username);
		stm.setString(2,license);
		stm.setString(3,email);
		stm.setString(4,password);
		stm.execute();		
	}
	
	//Return list of admins
	public ResultSet getAdmins() throws ClassNotFoundException, SQLException
	{
		con = connect();
	    stm = con.prepareStatement("select username,license,password from admin");
	    rs = stm.executeQuery();
	    return rs;
	}
	
	//Register Employee
	public void RegisterEmployee(String emp_name,String gender,String dob,String phone,String address,String bank,String branch,String ifsc,String ac_number,String pan, String aadhar, String role) throws ClassNotFoundException, SQLException
	{
		con = connect();
		stm = con.prepareStatement("insert into employee(emp_name,gender,date_of_birth,phone_number,address,bank,branch,ifsc,account_number,pan_number,aadhar_number,role,doj) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		stm.setString(1, emp_name);
		stm.setString(2, gender);
		stm.setString(3, dob);
		stm.setString(4, phone);
		stm.setString(5, address);
		stm.setString(6, bank);
		stm.setString(7, branch);
		stm.setString(8, ifsc);
		stm.setString(9, ac_number);
		stm.setString(10, pan);
		stm.setString(11, aadhar);
		stm.setString(12, role);
		stm.setString(13, presentDate);		
		stm.execute();		
	}
	
	//Fetch Staff Ids
	public ResultSet getStaffIds() throws ClassNotFoundException, SQLException
	{
		con = connect();
	    stm = con.prepareStatement("select empid from employee");
	    rs = stm.executeQuery();
	    return rs;
	}
	
	//Fetch Staff Details
	public ResultSet getStaffInfo(String emp_id) throws ClassNotFoundException, SQLException
	{
		con = connect();
	    stm = con.prepareStatement("select * from employee where empid=?");
	    stm.setString(1,emp_id);
	    rs = stm.executeQuery();
	    return rs;
	}
	public static void main(String args[])
	{
		dbconnect db = new dbconnect();
		System.out.println(db);
	
	}
}
