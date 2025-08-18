package crm_app.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.MySQLConfig;
import entity.Users;

public class UserRepository {

	/**
	 * Cách đặt tên hàm trong repo để gợi nhớ tới câu truy vấn
	 * 
	 * Ví dụ: SELECT * --> đặt tên là findAll() FROM users u WHERE u.email = '' AND
	 * u.password = ''
	 * 
	 * SELECT Đặt là "find" WHERE Đặt là "By" Các điều kiện trong câu truy vấn thì
	 * sẽ tương ứng đặt vào --> ví dụ như trong câu trên có AND thì đặt And giữa 2
	 * điều kiện muốn tìm kiếm
	 * 
	 * Ví dụ tìm kiếm Email và Password thì sẽ là findByEmailAndPassword Trường hợp
	 * có thêm điều kiện như "OR" thì sẽ là findByEmailAndPasswordOR...
	 * 
	 * JOIN 2 bảng thì không có nguyên tắc đặt tên
	 * 
	 * ví dụ: SELECT * FROM roles WHERE name='' OR id='' ===> tên hàm sẽ là
	 * findNameOrId()
	 *
	 */

	public List<Users> findAll() {
		List<Users> listUsers = new ArrayList<Users>();

		// TODO: chuẩn bị câu truy vấn
		String query = "SELECT *\r\n" + "FROM users u;";

		// TODO: mở kết nối csdl
		Connection connection = MySQLConfig.getConnection();

		try {
			// TODO: truyền câu truy vấn vào csdl
			PreparedStatement statement = connection.prepareStatement(query);

			// TODO: thực hiện câu truy vấn
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Users users = new Users();
				users.setFullname(resultSet.getString("fullname"));
				users.setEmail(resultSet.getString("email"));
				users.setId(resultSet.getInt("id"));

				listUsers.add(users);
			}
		} catch (Exception e) {
			System.out.println("findAll User " + e.getMessage());
		}
		return listUsers;
	}

	public int deleteById(int id) {
		int rowCount = 0;

		// chuẩn bị câu truy vấn
		String query = "DELETE FROM users u WHERE u.id = ?";

		// Mở kết nối tới cơ sở dữ liệu
		Connection connection = MySQLConfig.getConnection();

		try {
			// truyền câu truy vấn vào csdl
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);

			// thực thi câu truy vấn
			rowCount = statement.executeUpdate(); // không phải câu SELECT nên không xài executeQuery()
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}

		return rowCount;
	}
}
