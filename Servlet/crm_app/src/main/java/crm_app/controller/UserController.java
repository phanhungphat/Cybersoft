package crm_app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crm_app.services.UserServices;
import entity.Users;

@WebServlet(name = "userController", urlPatterns = { "/user" })
public class UserController extends HttpServlet {

	private UserServices userServices = new UserServices();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// NOTE: phải đổi sang jsp chứ ko sử dụng html, html ko xử lý logic code được

		List<Users> listUsers = userServices.getAllUser();
		System.out.println("Danh sach " + listUsers.size());

		req.getRequestDispatcher("user-table.jsp").forward(req, resp);
	}
}
