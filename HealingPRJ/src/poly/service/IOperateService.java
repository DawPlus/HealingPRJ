package poly.service;

import java.util.List;

import poly.dto.BasicInfoDTO;
import poly.dto.BasicInfoPageDTO;
import poly.dto.ExpenseDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramInOutDTO;

public interface IOperateService {
	
	public int insertOperateResultProc(BasicInfoDTO bDTO) throws Exception;

	public int insertProgramList(ProgramInOutDTO prDTO) throws Exception;

	public BasicInfoPageDTO getBasicInfoPage() throws Exception;

	public int updatePage(BasicInfoPageDTO bDTO) throws Exception;

	public int insertTest(BasicInfoDTO bDTO) throws Exception;
	
	public List<BasicInfoDTO> getSaveList(BasicInfoDTO bDTO) throws Exception;

	public List<BasicInfoDTO> getBasicInfoSave(BasicInfoDTO basicInfoDTO) throws Exception;

	public List<ExpenseDTO> getExpenseSave(ExpenseDTO eDTO) throws Exception;

	public List<IncomeDTO> getImcomeSave(IncomeDTO iDTO) throws Exception;

	public int insertBasic(BasicInfoDTO bDTO) throws Exception;
	
	public int insertExpenses(BasicInfoDTO expList) throws Exception;
	
	public int insertIncomes(BasicInfoDTO incList) throws Exception;

}
