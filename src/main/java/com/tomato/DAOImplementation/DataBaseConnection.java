package com.tomato.DAOImplementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
	static String username="root";
	static String password="root";
	static String url="jdbc:mysql://localhost:3306/foodapp";
		static Connection con;
		
		public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,username,password);
			return con;
			} 
		catch (ClassNotFoundException e ) {
				e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
		}
	
}

