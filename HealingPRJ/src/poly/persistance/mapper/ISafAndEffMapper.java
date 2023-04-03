package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ProgramInsertDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;

@Mapper("SafAndEffMapper")

public interface ISafAndEffMapper {

	List<SearchDTO> getprogramList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getprogramAvgList(SearchDTO sDTO)throws Exception;
	
	List<ServiceInsertDTO> getFaciltyList(ServiceInsertDTO uDTO) throws Exception;

	List<SearchDTO> getSer_Program(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Service(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getPrpPreventList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getAftPreventList(SearchDTO sDTO)throws Exception;
	
	List<SearchDTO> getProHealList(SearchDTO sDTO)throws Exception;
	
	List<SearchDTO> getAftHealList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getProCounselList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getMidCounselList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAftCounselList(SearchDTO sDTO) throws Exception;

	List<ServiceInsertDTO> getAvgFacilityList(ServiceInsertDTO uDTO) throws Exception;

	List<SearchDTO> getSer_Avg_Service(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_ProHealList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_AftHealList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_ProPreList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_AftPreList(SearchDTO sDTO)throws Exception;


	List<SearchDTO> getProHealAvgList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAftHealAvgList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Avg_ProHealList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Avg_AftHealList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_Avg_ProPreList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_Avg_AftPreList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAvgProPreventList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAvgAftPreventList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getCounselSessionList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_ProCounselList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_MidCounselList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_CounselSessionList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_AftCounselList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_Avg_Program(SearchDTO sDTO) throws Exception;






	
	
}
