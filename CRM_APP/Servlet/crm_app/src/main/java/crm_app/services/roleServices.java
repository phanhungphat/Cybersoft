package crm_app.services;

import crm_app.repository.RoleRepository;

public class roleServices {
	private RoleRepository roleRepository = new RoleRepository();

	public boolean insertRole(String name, String desc) {

		return roleRepository.save(name, desc) > 0;
	}
}
