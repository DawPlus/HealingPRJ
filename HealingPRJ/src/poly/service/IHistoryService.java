package poly.service;

import java.util.List;

import poly.dto.HistoryDTO;
import poly.dto.UserDTO;

public interface IHistoryService {
	
	public int InsertHistory(HistoryDTO hDTO) throws Exception;
	
	public List<HistoryDTO> getAllHistories() throws Exception;
	
	public List<HistoryDTO> getHistory(HistoryDTO hDTO) throws Exception;
	
	public List<UserDTO> getRegUser() throws Exception;
}
