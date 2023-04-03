package poly.service;

import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {
	
	public UserDTO loginProc(UserDTO uDTO) throws Exception;
	
	public int signupProc(UserDTO uDTO) throws Exception;
	
	public List<UserDTO> getUserInfo() throws Exception;

	public int approveUser(UserDTO uDTO) throws Exception;

	public int deleteUser(UserDTO uDTO) throws Exception;

}
