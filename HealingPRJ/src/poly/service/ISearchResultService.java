package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.BasicInfoDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;

public interface ISearchResultService {

	HashMap<String, String> getResidenceCountMap(BasicInfoDTO bDTO) throws Exception;

	HashMap<String, String> getResidenceSumMap(BasicInfoDTO bDTO) throws Exception;
	
	HashMap<String, String> getPartCountMap(BasicInfoDTO bDTO)throws Exception;

	HashMap<String, String> getPartSumMap(BasicInfoDTO bDTO) throws Exception;

	HashMap<String, String> getBizCountMap(BasicInfoDTO bDTO) throws Exception;

	HashMap<String, String> getBizSumMap(BasicInfoDTO bDTO) throws Exception;


	HashMap<String, List> getProAvgMap(BasicInfoDTO bDTO) throws Exception;

	String[] getProCountMap(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getSerEnvList(BasicInfoDTO bDTO)throws Exception;

	HashMap<String, String> getEffectMap(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getBasicList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getHrvList(BasicInfoDTO bDTO) throws Exception;


}
