package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BasicInfoDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.ResidenceDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.YearResultDTO;

@Mapper("ResultMapper")

public interface IResultMapper {

	List<BasicInfoDTO> getBasicInfo(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getProgramList(BasicInfoDTO bDTO) throws Exception;

	List<ResidenceDTO> getRegList_type(ResidenceDTO uDTO)throws Exception;

	List<ServiceInsertDTO> getServicelist(ServiceInsertDTO uDTO)throws Exception;

	List<SearchDTO> getPre_PreList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getPre_CounselList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAf_CounselList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getAf_PreList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getPre_HealingList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getAf_HealingList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getPart_Saf(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getLead_Saf(SearchDTO sDTO) throws Exception;

	List<ProgramOperationDTO> getoperationList(ProgramOperationDTO poDTO) throws Exception;

	List<SearchDTO> getList(SearchDTO sDTO)throws Exception;

	List<ResidenceDTO> getRegList_people(ResidenceDTO uDTO)throws Exception;

	List<IncomeDTO> getIncomeList(IncomeDTO icDTO)throws Exception;

	List<ExpenseDTO> getExpenseList(ExpenseDTO eDTO)throws Exception;

	List<BasicInfoDTO> getFirstPage() throws Exception;

	List<HrvInsertDTO> getPreHrvList(HrvInsertDTO hiDTO)throws Exception;

	List<HrvInsertDTO> getAftHrvList(HrvInsertDTO hiDTO)throws Exception;


	
}
