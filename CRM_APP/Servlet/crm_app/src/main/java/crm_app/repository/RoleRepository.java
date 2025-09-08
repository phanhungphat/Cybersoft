package crm_app.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import config.MySQLConfig;

public class RoleRepository {

	public int save(String name, String desc) {
		int rowCount = 0;

		// chuẩn bị câu truy vấn
		String query = "INSERT INTO roles(name, description ) VALUES (?,?)";

		// Mở kết nối tới cơ sở dữ liệu
		Connection connection = MySQLConfig.getConnection();

		try {
			// truyền câu truy vấn vào csdl
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, desc);

			// thực thi câu truy vấn
			rowCount = statement.executeUpdate(); // không phải câu SELECT nên không xài executeQuery()
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}

		return rowCount;
	}
}
