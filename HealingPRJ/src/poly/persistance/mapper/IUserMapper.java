package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	public UserDTO loginProc(UserDTO uDTO) throws Exception;
	
	public int signupProc(UserDTO uDTO) throws Exception;

	public List<UserDTO> getUserInfo() throws Exception;

	public int approveUser(UserDTO uDTO) throws Exception;

	public int deleteUser(UserDTO uDTO) throws Exception;
}
