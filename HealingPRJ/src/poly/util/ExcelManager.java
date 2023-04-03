package poly.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import poly.dto.StudentDTO;

public class ExcelManager {
	
	 public static List<StudentDTO> getStudentList() throws EncryptedDocumentException, IOException, InvalidFormatException {
	        List<StudentDTO> studentList = new ArrayList<StudentDTO>();
	 
	        String filePath = "C:\\excel\\test01.xlsx";
	        InputStream inputStream = new FileInputStream(filePath);
	 
	        // 엑셀 로드
	        Workbook workbook = WorkbookFactory.create(inputStream);
	        // 시트 로드 0, 첫번째 시트 로드
	        Sheet sheet = workbook.getSheetAt(0);
	        Iterator<Row> rowItr = sheet.iterator();
	        
	        //석민 부분
	        int nullCnt = 0;
	        //스트링 포맷 선언
	        DataFormatter df = new DataFormatter();
	        // 행만큼 반복
	        
	        while (rowItr.hasNext()) {
	        	StudentDTO student = new StudentDTO();
	            
	            Row row = rowItr.next();
	            System.out.println(row.getRowNum() + "행");
	            // 첫 번째 행이 헤더인 경우 스킵, 2번째 행부터 data 로드
	            if (row.getRowNum() < 3) {
	                continue;
	            }
	            List<String> pList = new ArrayList<String>();
	            Iterator<Cell> cellItr = row.cellIterator();
	            // 한 행이 한열 씩 읽기 (셀 읽기)
	            while (cellItr.hasNext()) {
	                Cell cell = cellItr.next();
	                int index = cell.getColumnIndex();
	                System.out.println("열 index : " + index);
	                
	                if(index==0) {
	                	if(CmmUtil.nvl(df.formatCellValue(cell)).trim().equals("결과")){
	                		 return studentList;
	                	}
	                	student.setId(CmmUtil.nvl(df.formatCellValue(cell)));
	                	
	                }else if(index==1){
	                	student.setName(df.formatCellValue(cell));
	                	if (CmmUtil.nvl(df.formatCellValue(cell)) == null || CmmUtil.nvl(df.formatCellValue(cell)).equals("")) {
		                	nullCnt ++;
		                	System.out.println("nullCnt : " + nullCnt);
	                	}else {
	                		nullCnt = 0;
	                	}
	                	
	                }else if(index==2) {
	                	student.setSex(df.formatCellValue(cell));
	                }else if(index==3) {
	                	student.setAge(df.formatCellValue(cell));
	                }else if(index==4) {
	                	student.setResidence(df.formatCellValue(cell));
	                }else if(index==5) {
	                	student.setJob(df.formatCellValue(cell));
	                }else if(index==6) {
	                	student.setPrograms_count(df.formatCellValue(cell));
	                }else if(index==7) {
	                	student.setStress(df.formatCellValue(cell));
	                }else {
	                	pList.add(df.formatCellValue(cell));
	                	if(index == 30) {
	                		break;
	                	}
	                }
	            	student.setEval(pList);
	            }
	            if(nullCnt > 1) { 
                	break;
                }
	            pList = null;
	            studentList.add(student);
	        }
	        return studentList;
	    }
	 
	    @SuppressWarnings("unused")
		private static Object getValueFromCell(Cell cell) {
	        switch (cell.getCellType()) {
	        case STRING:
	            return cell.getStringCellValue();
	        case BOOLEAN:
	            return cell.getBooleanCellValue();
	        case NUMERIC:
	            if (DateUtil.isCellDateFormatted(cell)) {
	                return cell.getDateCellValue();
	            }
	            return cell.getNumericCellValue();
	        case FORMULA:
	            return cell.getCellFormula();
	        case BLANK:
	            return "";
	        default:
	            return "";
	        }
	    }


}
