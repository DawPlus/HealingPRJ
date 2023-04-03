package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;
import poly.service.comm.AbstractService;

@Service("UserService")
public class UserService extends AbstractService implements IUserService {

	@Resource(name = "UserMapper")
	private IUserMapper userMapper;

	@Override
	public UserDTO loginProc(UserDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".loginProc Start !!");
		log.info(this.getClass().getName() + ".loginProc End !!");
		return userMapper.loginProc(uDTO);
	}

	@Override
	public int signupProc(UserDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".signupProc start !!");
		log.info(this.getClass().getName() + ".signupProc End !!");
		return userMapper.signupProc(uDTO);
	}

	@Override
	public List<UserDTO> getUserInfo() throws Exception {
		log.info(this.getClass().getName() + ".getUserInfo Start !!");
		log.info(this.getClass().getName() + ".getUserInfo End !!");
		return userMapper.getUserInfo();
	}

	@Override
	public int approveUser(UserDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".approveUser Start !!");
		log.info(this.getClass().getName() + ".approveUser End !!");
		return userMapper.approveUser(uDTO);
	}

	@Override
	public int deleteUser(UserDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".approveUser Start !!");
		log.info(this.getClass().getName() + ".approveUser End !!");
		return userMapper.deleteUser(uDTO);
	}

}
