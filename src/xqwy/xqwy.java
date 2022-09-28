package xqwy;
import java.sql.*;

public class xqwy
{ 

	String strDBDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	String strDBUrl="jdbc:sqlserver://localhost:1433;databasename=xqwy";
    private Connection conn=null;
    private Statement stmt=null; 
    ResultSet rs=null;
    public xqwy()
    {
    	try
    	{
    	    Class.forName(strDBDriver);
    	}
    	catch(java.lang.ClassNotFoundException e) 
        {
            System.err.println("xqwy():"+e.getMessage());
        }
    }
    public ResultSet executeQuery(String sql)
    {
        rs=null;
        try
        {
    	    conn=DriverManager.getConnection(strDBUrl,"sa","123456");
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
        }
        catch(SQLException ex) 
        {
    	    System.err.println("aq.executeQuery:"+ex.getMessage());
        }
        return rs;
    }
    public void executeUpdate(String sql)
    {
        stmt=null;
        rs=null;
        try
        {
    	    conn=DriverManager.getConnection(strDBUrl,"sa","123456");
    	    stmt=conn.createStatement();
    	    stmt.executeQuery(sql);
    	    stmt.close();
    	    conn.close();
        }
        catch(SQLException ex)
        {
            System.err.println("aq.executeQuery:"+ex.getMessage());
        }
    }
    public void closeStmt()
    {
        try
        {
        	stmt.close();
        }
        catch(SQLException e)
        {
    	    e.printStackTrace();
        }
    }
    public void closeConn()
    {
	    try
	    {
		    conn.close();
	    }
	    catch(SQLException e)
	    {
		    e.printStackTrace();
	    }
    }
}