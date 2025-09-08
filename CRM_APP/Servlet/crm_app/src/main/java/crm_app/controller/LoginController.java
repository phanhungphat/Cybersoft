package crm_app.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.MySQLConfig;
import entity.Users;

@WebServlet(name = "LoginController", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		// chuẩn bị câu truy vấn
		String query = "SELECT *\r\n"
				+ "FROM users u \r\n"
				+ "WHERE u.email = ? AND u.password = ?";
		
		// khắc phục sql injection
		// sử dụng jdbc thì không truyền tham số, nhưng mà truyền dấu chấm hỏi
		
		// Mở kết nối CSDL
		Connection connection = MySQLConfig.getConnection();
				
		try {
			// Truyền câu truy vấn vào connection mới vừa kết nối
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			// Set tham số cho dấu chấm hỏi bên trong câu query
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			
			/**
			 * executeQuery : xài khi đó là câu SELECT
			 * executeUpdate : không phải là câu SELECT thì mình xài
			 */
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			// Tạo một danh sách rỗng để biến dữ liệu từ câu truy vấn trong result set thành mảng/danh sách 
			List<Users> listUsers = new ArrayList<Users>();
			
			while (resultSet.next()) {
				Users users = new Users();
				users.setId(resultSet.getInt("id"));
				users.setFullname(resultSet.getString("fullname"));
				
				listUsers.add(users);
			}
			
			if (listUsers.isEmpty()) {
				System.out.println("Đăng nhập thất bại");
			} else {
				System.out.println("Đăng nhập thành công");
			}
			
		} catch (Exception e) {
			System.out.println("Lỗi thực thi câu truy vấn: " + e.getMessage());
		}

		req.getRequestDispatcher("login.jsp").forward(req, resp);
		
		
	}
}
