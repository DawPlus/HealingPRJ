package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.HistoryDTO;
import poly.dto.UserDTO;

@Mapper("HistoryMapper")
public interface IHistoryMapper {
	
	public int insertHistory(HistoryDTO hDTO) throws Exception;
	
	public List<HistoryDTO> getAllHistories() throws Exception;
	
	public List<HistoryDTO> getHistory(HistoryDTO hDTO) throws Exception;
	
	public List<UserDTO> getRegUser() throws Exception;

}
