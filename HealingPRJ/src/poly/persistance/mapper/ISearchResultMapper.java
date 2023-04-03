package poly.persistance.mapper;

import java.util.List;
import config.Mapper;
import poly.dto.BasicInfoDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;

@Mapper("SearchResultMapper")

public interface ISearchResultMapper {

	List<BasicInfoDTO> getResidenceCountList(BasicInfoDTO bDTO)throws Exception;

	List<BasicInfoDTO> getResidenceSumList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getAgeCountList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getAgeSumList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getPartCountList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getPartSumList(BasicInfoDTO bDTO)throws Exception;

	List<BasicInfoDTO> getBizCountList(BasicInfoDTO bDTO)throws Exception;

	List<BasicInfoDTO> getIncomeCountList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getBizSumList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getIncomeSumList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getProAvgList(BasicInfoDTO bDTO) throws Exception;
	List<SearchDTO> getProAvgList_p(BasicInfoDTO bDTO) throws Exception;
	List<SearchDTO> getProAvgList_l(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getBunyaTeacherList(SearchDTO sDTO) throws Exception;

	List<ProgramOperationDTO> getProCountList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getSerEnvList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getProhealingList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getAfthealingList(BasicInfoDTO bDTO)throws Exception;

	List<SearchDTO> getProCounselList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getAftCounselList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getProPreventList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getAftPreventList(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getBasicList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getPreHrvList(BasicInfoDTO bDTO) throws Exception;

	List<SearchDTO> getAftHrvList(BasicInfoDTO bDTO) throws Exception;
	
}
