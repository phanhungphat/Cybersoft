package crm_app.services;

import java.util.List;

import crm_app.repository.UserRepository;
import entity.Users;

public class UserServices {

	private UserRepository userRepository = new UserRepository();

	// tên hàm đặt nên là tên tính năng

	// Xử lý logic code cho UserController
	public List<Users> getAllUser() {
		return userRepository.findAll();
	}
}
