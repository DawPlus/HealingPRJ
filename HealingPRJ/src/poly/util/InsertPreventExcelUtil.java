/*package poly.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import poly.dto.PreventSerivceDTO;

public class InsertPreventExcelUtil {
	
	public List<PreventSerivceDTO> getPreventExcelData() throws EncryptedDocumentException, IOException {
		List<PreventSerivceDTO> excelList = new ArrayList<PreventSerivceDTO>();

		
		//엑셀 경로 받기
		String filePath = "C:\\excel\\preventService.xlsx";
		InputStream inputStream = new FileInputStream(filePath);
		Workbook workbook = WorkbookFactory.create(inputStream);
		
		//시트로드
		Sheet sheet = workbook.getSheetAt(0);
		Iterator<Row> rowItr = sheet.iterator();
		
		//스트링 포맷 선언
		DataFormatter df = new DataFormatter();
		
		int hang=0;
		
		//석민 부분
		int nullCnt = 0;
		
		//행만큼 반복
		while(rowItr.hasNext()) { 
			
			//한 행씩 데이터를 받기 위해 DTO선언
			PreventSerivceDTO pDTO = new PreventSerivceDTO();
			//Iterator로 한 행씩 받아 row변수에 저장 ( = 행 지정)
			Row row = rowItr.next();
			
			String abc = "  ";
			if(hang == 44) {
				abc=CmmUtil.nvl(row.getCell(0).toString());
			}
			
			hang++;
			//예방서비스 효과평가는 3행까지가 헤더라서 뛰어넘기 위한 구문
			if(row.getRowNum() < 3) {
				continue;
			}
			
			//한 행의 들어있는 각 셀을 받기 위해 선언
			Iterator<Cell> cellItr = row.cellIterator();
			
			while(cellItr.hasNext()) {
				//Iterator로 한 행의 한 센씩 받아 cell변수에 저장
				Cell cell = cellItr.next();
				
				//셀을 지정하기 위해 index변수 선언 ( = 열 지정)
				int index = cell.getColumnIndex();

				if(index > 28) {
					break;
				}
				switch (index) {
	                case 0: // 번호
	                	
	                	pDTO.setId(CmmUtil.nvl(df.formatCellValue(cell)));
	                    break;
	                case 1: // 성명
	                	if (CmmUtil.nvl(df.formatCellValue(cell)) == null || CmmUtil.nvl(df.formatCellValue(cell)).equals("")) {
	                         nullCnt ++;
	                         System.out.println("nullCnt : " + nullCnt);
	                         break;
	                      }else {
	                         nullCnt = 0;
	                      }

	                	pDTO.setName(CmmUtil.nvl(df.formatCellValue(cell)));
	                    break;
	                case 2: // 성별
	                	pDTO.setSex(CmmUtil.nvl(df.formatCellValue(cell)));
	                    break;
	                case 3: // 연령
	                	pDTO.setAge(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 4: // 거주지
	                	pDTO.setResidence(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 5: // 직업
	                	pDTO.setJob(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 6: // 참여프로그램
	                	pDTO.setPtcProgram(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 7: // 과거스트레스 해소 및 힐링
	                	pDTO.setPastStress(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 8: // 과거스트레스 해소 및 힐링
	                	pDTO.setEvalPoint(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 9: // 중독 문항 1
	                	pDTO.setOdQst1(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 10: // 중독 문항 2
	                	pDTO.setOdQst2(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 11: // 중독 문항 3
	                	pDTO.setOdQst3(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 12: // 핵심 문항 4
	                	pDTO.setSypQst4(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 13: // 핵심 문항 5
	                	pDTO.setSypQst5(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 14: // 핵심 문항 6
	                	pDTO.setSypQst6(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 15: // 문제대응 문항 7
	                	pDTO.setPrbQst7(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 16: // 문제대응 문항 8
	                	pDTO.setPrbQst8(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 17: // 문제대응 문항 9
	                	pDTO.setPrbQst9(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 18: // 문제대응 문항 10
	                	pDTO.setPrbQst10(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 19: // 활용 문항 11
	                	pDTO.setUseQst11(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 20: // 활용 문항 12
	                	pDTO.setUseQst12(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 21: // 심리 문항 13
	                	pDTO.setPsyQst13(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 22: // 심리 문항 14
	                	pDTO.setPsyQst14(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 23: // 심리 문항 15
	                	pDTO.setPsyQst15(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 24: // 심리 문항 16
	                	pDTO.setPsyQst16(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 25: // 심리 문항 17
	                	pDTO.setPsyQst17(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 26: // 삶의 질 문항 18
	                	pDTO.setQulQst18(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 27: // 삶의 질 문항 19
	                	pDTO.setQulQst19(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                case 28: // 삶의 질 문항 20
	                	pDTO.setQulQst20(CmmUtil.nvl(df.formatCellValue(cell)));
	                	break;
	                
	                	
				 }
				if (nullCnt > 1) {
					return excelList;
				}

			}
		excelList.add(pDTO);
		}
		
		return excelList;
	}

}
*/