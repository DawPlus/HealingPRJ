package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BasicInfoDTO;
import poly.dto.BasicInfoPageDTO;
import poly.dto.ExpenseDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramInOutDTO;

@Mapper("IOperateMapper")
public interface IOperateMapper {
	
	public int insertOperateResultProc(BasicInfoDTO bDTO) throws Exception;

	public int insertProgramList(ProgramInOutDTO prDTO);

	public BasicInfoPageDTO getBasicInfoPage();

	public int updatePage(BasicInfoPageDTO bDTO) throws Exception;
	
	public void deleteProgramInfo(ProgramInOutDTO prDTO) throws Exception;
	
	public void deleteIncomeInfo(BasicInfoDTO bDTO) throws Exception;
	
	public void deleteBasicInfo(BasicInfoDTO bDTO) throws Exception;
	
	public void deleteExpenseInfo(BasicInfoDTO bDTO) throws Exception;

	public int insertBasic(BasicInfoDTO bDTO) throws Exception;
	
	public int insertExpenses(BasicInfoDTO expList) throws Exception;
	
	public int insertIncomes(BasicInfoDTO incList) throws Exception;

	public List<BasicInfoDTO> getSaveList(BasicInfoDTO bDTO) throws Exception;

	public List<BasicInfoDTO> getBasicInfoSave(BasicInfoDTO basicInfoDTO) throws Exception;

	public List<ExpenseDTO> getExpenseSave(ExpenseDTO eDTO) throws Exception;

	public List<IncomeDTO> getIncomeSave(IncomeDTO iDTO) throws Exception;
	

}
