package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BasicInfoDTO;
import poly.dto.BasicInfoPageDTO;
import poly.dto.ExpenseDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramInOutDTO;
import poly.persistance.mapper.IOperateMapper;
import poly.service.IOperateService;
import poly.service.comm.AbstractService;

@Service("OperateService")
public class OperateService extends AbstractService implements IOperateService {

	@Resource(name = "IOperateMapper")
	private IOperateMapper operateMapper;

	@Override
	public int insertOperateResultProc(BasicInfoDTO bDTO) throws Exception {
		log.info(this.getClass() + "------in");

		// 인서트 하기 전 중복값 삭제를 위한 전체 삭제
		operateMapper.deleteExpenseInfo(bDTO);
		operateMapper.deleteIncomeInfo(bDTO);
		operateMapper.deleteBasicInfo(bDTO);

		int basic = operateMapper.insertBasic(bDTO);
		if (basic == 0)
			return 0;
		log.info(bDTO.getReg_id());
		log.info("basic " + basic + " out");
		// basic_info를 insert한 뒤에 수입지출을 insert할 때 서브쿼리를 이용해서 basic_info_seq를 외래키로 넣는다.
		bDTO.setBasic_info_seq("" + basic);

		// 수입지출금액이 입력되지 않더라도 기본생성자에서 초기화 되기 때문에 널 겂 에러 안남
		int expense = (bDTO.getExpList().size() > 0) ? operateMapper.insertExpenses(bDTO) : 0;
		log.info("expense " + bDTO.getExpList().size() + " out");

		int income = (bDTO.getIncList().size() > 0) ? operateMapper.insertIncomes(bDTO) : 0;
		log.info("income " + bDTO.getIncList().size() + " out");

		log.info(this.getClass().getName() + ".insertOperateResultProc End");
		return basic + expense + income;

	}

	// PROGRAM_INFO 테이블 만들면 프로그램저장 _210720 이재훈
	@Override
	public int insertProgramList(ProgramInOutDTO prDTO) throws Exception {
		// 프로그램 리스트 넣기 전 삭제
		operateMapper.deleteProgramInfo(prDTO);
		return operateMapper.insertProgramList(prDTO);
	}

	@Override
	public BasicInfoPageDTO getBasicInfoPage() throws Exception {
		log.info(this.getClass().getName() + ".basicInfoPage Start !!");
		log.info(this.getClass().getName() + ".basicInfoPage End !!");
		return operateMapper.getBasicInfoPage();
	}

	@Override
	public int updatePage(BasicInfoPageDTO bDTO) throws Exception {
		log.info(this.getClass().getName() + ".updatePage Start !!");
		log.info(this.getClass().getName() + ".updatePage End !!");
		return operateMapper.updatePage(bDTO);
	}

	// 수입지출금액 또는 중간저장 insert 테스트
	@Override
	public int insertTest(BasicInfoDTO bDTO) throws Exception {
		log.info(this.getClass().getName() + ".insertTest Start");
		/////////// 테스트 데이터 insert//////////
		/*
		 * List<ExpenseDTO> expList = new ArrayList<ExpenseDTO>(); List<IncomeDTO>
		 * incList = new ArrayList<IncomeDTO>(); bDTO.setExpList(expList);
		 * bDTO.setIncList(incList);
		 */
		/////////// 테스트 데이터 insert//////////
		int basic = operateMapper.insertBasic(bDTO);
		if (basic == 0)
			return 0;
		log.info(bDTO.getReg_id());
		log.info("basic " + basic + " out");
		// basic_info를 insert한 뒤에 수입지출을 insert할 때 서브쿼리를 이용해서 basic_info_seq를 외래키로 넣는다.
		bDTO.setBasic_info_seq("" + basic);

		// 수입지출금액이 입력되지 않더라도 기본생성자에서 초기화 되기 때문에 널 겂 에러 안남
		int expense = (bDTO.getExpList().size() > 0) ? operateMapper.insertExpenses(bDTO) : 0;
		log.info("expense " + bDTO.getExpList().size() + " out");

		int income = (bDTO.getIncList().size() > 0) ? operateMapper.insertIncomes(bDTO) : 0;
		log.info("income " + bDTO.getIncList().size() + " out");

		log.info(this.getClass().getName() + ".insertTest End");
		return basic + expense + income;
	}

	// 프로그램 운영결과 insert
	@Override
	public int insertBasic(BasicInfoDTO bDTO) throws Exception {
		return operateMapper.insertBasic(bDTO);
	}

	// 지출금액 insert
	@Override
	public int insertExpenses(BasicInfoDTO expList) throws Exception {
		return operateMapper.insertExpenses(expList);
	}

	// 수입금액 insert
	@Override
	public int insertIncomes(BasicInfoDTO incList) throws Exception {
		return operateMapper.insertIncomes(incList);
	}

	@Override
	public List<BasicInfoDTO> getSaveList(BasicInfoDTO bDTO) throws Exception {
		log.info(this.getClass().getName() + ".getSaveList Start !!");
		log.info(this.getClass().getName() + ".getSaveList End !!");
		return operateMapper.getSaveList(bDTO);
	}

	@Override
	public List<BasicInfoDTO> getBasicInfoSave(BasicInfoDTO basicInfoDTO) throws Exception {
		log.info(this.getClass().getName() + "getBasicInfoSave Start !!");
		log.info(this.getClass().getName() + "getBasicInfoSave End !!");
		return operateMapper.getBasicInfoSave(basicInfoDTO);
	}

	@Override
	public List<ExpenseDTO> getExpenseSave(ExpenseDTO eDTO) throws Exception {
		log.info(this.getClass().getName() + "getExpenseSave Start !!");
		log.info(this.getClass().getName() + "getExpenseSave End !!");
		return operateMapper.getExpenseSave(eDTO);
	}

	@Override
	public List<IncomeDTO> getImcomeSave(IncomeDTO iDTO) throws Exception {
		log.info(this.getClass().getName() + "getIncomeSave Start !!");
		log.info(this.getClass().getName() + "getIncomeSave End !!");
		return operateMapper.getIncomeSave(iDTO);
	}

}
