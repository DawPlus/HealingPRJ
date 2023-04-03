package poly.service;

import java.util.ArrayList;
import java.util.List;

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

public interface IResultService {

	 List<BasicInfoDTO> getBasiclist(BasicInfoDTO bDTO) throws Exception;

	List<BasicInfoDTO> getProgrmaList(BasicInfoDTO bDTO)throws Exception;

	List<ServiceInsertDTO> getServicelist(ServiceInsertDTO uDTO) throws Exception;

	ArrayList<String> getPre_PreList(SearchDTO sDTO)throws Exception;

	ArrayList<String> getPre_CounselList(SearchDTO sDTO)throws Exception;

	ArrayList<String> getPre_HealingList(SearchDTO sDTO) throws Exception;

	ArrayList<String> getProgramEffect(SearchDTO sDTO)throws Exception;

	Double[][] getProgramSaf(SearchDTO sDTO)throws Exception;

	int[] getOperationlist(ProgramOperationDTO poDTO)throws Exception;

	String[][] getProgramName(SearchDTO sDTO) throws Exception;

	List<IncomeDTO> getIncomeList(IncomeDTO icDTO) throws Exception;

	List<ExpenseDTO> getExpenseList(ExpenseDTO eDTO) throws Exception;

	List<BasicInfoDTO> getFirstPage() throws Exception;

	List<HrvInsertDTO> getHrvList(HrvInsertDTO hiDTO)throws Exception;




}
