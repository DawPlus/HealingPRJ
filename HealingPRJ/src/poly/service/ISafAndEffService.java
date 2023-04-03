package poly.service;

import java.util.List;

import poly.dto.ProgramInsertDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;

public interface ISafAndEffService {

	List<SearchDTO> getProgrmaList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getProgrmaAvgList(SearchDTO sDTO) throws Exception; 
	
	List<ServiceInsertDTO> getFacilityList(ServiceInsertDTO uDTO)throws Exception;

	List<SearchDTO> getSer_Program(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_Service(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getPreventList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getHealList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getCoulselList(SearchDTO sDTO) throws Exception;

	List<ServiceInsertDTO> getAvgFacilityList(ServiceInsertDTO uDTO) throws Exception;

	List<SearchDTO> getSer_Avg_Service(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Healing(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Prevent(SearchDTO sDTO) throws Exception;


	List<SearchDTO> getHealAvgList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Avg_Healing(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Counsel(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_Avg_Prevent(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAvgPreventList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getSer_AvgProgram(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getSer_Avg_Counsel(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAvgCoulselList(SearchDTO sDTO) throws Exception;

}
