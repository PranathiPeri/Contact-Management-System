/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author perip
 */
import java.sql.*;
public class DBConnection {
    static Connection conn=null;
    /* this method is used to get a connection to database*/
	  public static Connection getConnection()
	  {
		  /**
	 * If this doesn't work, do the following :
          * right click on
         * project properties --> Java Build Path --> Libraries --> add Jar to your project(which you already downloaded)
         *  This is the MySQL JDBC driver. 
	 */
		  try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:Mysql://localhost:3306/contactmanager?user=root&password=mysql1");
		      } 
		  catch (Exception ex) {
		System.out.println("Error in connection: " + ex.getMessage());
		}
			
		  return conn;
	  }
          /* this method is used to close a connection to database*/
          public void closeConnection()
	  {
		 if(conn!=null)
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
    
    
}
