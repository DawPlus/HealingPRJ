package poly.service;

import java.util.ArrayList;
import java.util.List;

import poly.dto.BasicInfoDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.ResidenceDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.YearResultDTO;

public interface IYearResultService {

	int[][] getPartList(YearResultDTO yrDTO) throws Exception;

	int[][] getIncomeList(YearResultDTO yrDTO)throws Exception;

	List<BasicInfoDTO> getRoomList(BasicInfoDTO bDTO)throws Exception;

	int[] getOp_program(ProgramOperationDTO poDTO) throws Exception;

	List<ServiceInsertDTO> getSerList(ServiceInsertDTO siDTO)throws Exception;

	int[] getBizList(YearResultDTO yrDTO)throws Exception;

	int[][] getResidenceList(ResidenceDTO uDTO)throws Exception;

	int[][] getSupportList(YearResultDTO yrDTO) throws Exception;

	int[][] getServiceType(YearResultDTO yrDTO)throws Exception;

	int[][] getPeapleCount(YearResultDTO yrDTO)throws Exception;

	ArrayList<String> getProgramEffect(SearchDTO sDTO) throws Exception;

	int[][] getAgeList(YearResultDTO yrDTO)throws Exception;

	double[][] getProgramList(SearchDTO sDTO) throws Exception;

	double[] getExpenseList(ExpenseDTO eDTO)throws Exception;

	List<BasicInfoDTO> getBasicList(BasicInfoDTO bDTO)throws Exception;

	int[] getIncomeSumList(IncomeDTO iDTO) throws Exception;

	List<HrvInsertDTO> getHrvList(HrvInsertDTO hiDTO) throws Exception;



}
