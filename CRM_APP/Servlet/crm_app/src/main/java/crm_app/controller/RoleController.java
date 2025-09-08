package crm_app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crm_app.services.roleServices;

@WebServlet(name = "roleController", urlPatterns = { "/role-add" })
public class RoleController extends HttpServlet {

	private roleServices roleServices = new roleServices();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// trường hợp có 2 link thì xài req.getServletPath() 
		// ==> String path = req.getServletPath()
		String roleName = req.getParameter("roleName");
		String desc = req.getParameter("desc");

		// xử lý bad case - trường hợp user không nhập gì thì trong csdl sẽ set NULL =>
		// ==> phải ràng buộc không được NULL, nếu NULL thì vẫn trả ngược về trang role-add
		if (roleName != null) {
			boolean isSuccess = roleServices.insertRole(roleName, desc);
		}
		
		req.getRequestDispatcher("role-add.jsp").forward(req, resp);
	}
}
