package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.HistoryDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IHistoryMapper;
import poly.service.IHistoryService;
import poly.service.comm.AbstractService;

@Service("HistoryService")
public class HistoryService  extends AbstractService implements IHistoryService{
	
	@Resource(name = "HistoryMapper")
	private IHistoryMapper historyMapper;
	
	@Override
	public int InsertHistory(HistoryDTO hDTO) throws Exception {
		log.info(this.getClass().getName() + ".InsertHistory Start !!");
		log.info(this.getClass().getName() + ".InsertHistory End !!");
		return historyMapper.insertHistory(hDTO);
	}

	@Override
	public List<HistoryDTO> getAllHistories() throws Exception {
		log.info(this.getClass().getName() + ".getHistory Start !!");
		log.info(this.getClass().getName() + ".getHistory End !!");
		return historyMapper.getAllHistories();
	}

	@Override
	public List<HistoryDTO> getHistory(HistoryDTO hDTO) throws Exception {
		log.info(this.getClass().getName() + ".getHistory Start !!");
		log.info(this.getClass().getName() + ".getHistory End !!");
		return historyMapper.getHistory(hDTO);
	}

	@Override
	public List<UserDTO> getRegUser() throws Exception {
		log.info(this.getClass().getName() + ".getRegUser Start !!");
		log.info(this.getClass().getName() + ".getRegUser End !!");
		return historyMapper.getRegUser();
	}

	
	
}
