package com.campus.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class JdbcUtils {

	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=campusDB";
	private static String name = "sa";
	private static String pwd = "root";

	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {

		try {
			return DriverManager.getConnection(url, name, pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static void close(Connection connection,
			PreparedStatement preparedStatement, ResultSet resultSet) {

		try {

			if (resultSet != null) {
				resultSet.close();

			}

			if (preparedStatement != null) {
				preparedStatement.close();

			}

			if (connection != null) {
				connection.close();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
