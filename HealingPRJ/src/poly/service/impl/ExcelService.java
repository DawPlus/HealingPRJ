package poly.service.impl;

import java.io.IOException;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.VibraInsertDTO;
import poly.service.IExcelService;
import poly.service.comm.AbstractService;
import poly.util.CmmUtil;

@Service("ExcelService")
public class ExcelService extends AbstractService implements IExcelService {

	/**
	 * 서비스환경 만족도 엑셀 다운로드
	 */
	@Override
	public XSSFWorkbook excelDownload(ServiceInsertDTO serviceDtoList) throws IOException {

		log.info(log.getClass().getName() + "service excelDownload start");
		// 평균 합계
		double array = 0.0;
		double sum = 0.0;
		// 워크북 생성

		XSSFWorkbook wb = new XSSFWorkbook();

		Sheet sheet = wb.createSheet("서비스만족도");

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();
		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 평균 스타일
		CellStyle headTwoStyle = wb.createCellStyle();

		headTwoStyle.setBorderTop(BorderStyle.THIN);

		headTwoStyle.setBorderBottom(BorderStyle.THIN);

		headTwoStyle.setBorderLeft(BorderStyle.THIN);

		headTwoStyle.setBorderRight(BorderStyle.THIN);

		headTwoStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headTwoStyle.setWrapText(true);

		headTwoStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());

		headTwoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headTwoStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#0.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);
		// 셀 병합
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 8, 9));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 10, 11));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 12, 14));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 15, 17));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 18, 18));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 19, 21));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 22, 24));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 25, 25));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 26, 27));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 28, 34));
		// 헤더 생성

		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("참여프로그램");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("거주지");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("직업");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("숙소");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("식당");

		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("프로그램 장소");

		cell = row.createCell(15);
		cell.setCellStyle(headStyle);
		cell.setCellValue("숲(야외)");

		cell = row.createCell(18);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기타의견");

		cell = row.createCell(19);
		cell.setCellStyle(headStyle);
		cell.setCellValue("운영");

		cell = row.createCell(22);
		cell.setCellStyle(headStyle);
		cell.setCellValue("식사");

		cell = row.createCell(25);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기타의견");

		cell = row.createCell(26);
		cell.setCellStyle(headStyle);
		cell.setCellValue("잠재적 관광수요");

		cell = row.createCell(28);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("평균");

		// 2행 헤더
		row = sheet.createRow(rowNo++);
		int scoreCount = serviceDtoList.getServiceDtoList().get(0).getScoreList().size();
		int questionCnt = 0;

		for (int i = 0; i < 8; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
		}

		for (int i = 0; i < scoreCount; i++) {
			cell = row.createCell(i + 8);
			cell.setCellStyle(headStyle);

			if (i == 10 || i == 17) {
				cell.setCellValue("기타의견");
				questionCnt = 0;
			} else {
				cell.setCellValue("문항" + (questionCnt + 1));
				questionCnt++;
			}
		}

		cell = row.createCell(28);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("숙소 평균");

		cell = row.createCell(29);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("식당 평균");

		cell = row.createCell(30);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("프로그램장소 평균");

		cell = row.createCell(31);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("숲(야외) 평균");

		cell = row.createCell(32);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("운영 평균");

		cell = row.createCell(33);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("식사 평균");

		cell = row.createCell(34);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("잠재적 관광수요 평균");

		// 데이터 부분 생성
		int listNm = 0;

		for (ServiceInsertDTO pDTO : serviceDtoList.getServiceDtoList()) {

			row = sheet.createRow(rowNo++);

			if (pDTO.getSex().toString().equals("")) {
				log.info("pDTO.getsex == null ? : " + pDTO.getSex() == null);
				return wb;
			} else {

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(pDTO.getOpenday());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPtcProgram()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getSex()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getResidence()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getJob()));

				for (int j = 0; j < pDTO.getScoreList().size(); j++) {
					cell = row.createCell(j + 8);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(pDTO.getScoreList().get(j).toString());

					if (pDTO.getScoreList().get(j).length() == 1) {
						if (j == 10 || j == 17) {
						} else {
							if (Integer.parseInt(pDTO.getScoreList().get(j)) != 0) {
								array += Integer.parseInt(pDTO.getScoreList().get(j));
								sum++;
							}
						}
					}

					if (j == 1) {
						if (sum == 0) {
							cell = row.createCell(28);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(28);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 3) {
						if (sum == 0) {
							cell = row.createCell(29);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(29);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 6) {
						if (sum == 0) {
							cell = row.createCell(30);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(30);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 9) {
						if (sum == 0) {
							cell = row.createCell(31);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(31);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 13) {
						if (sum == 0) {
							cell = row.createCell(32);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(32);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 16) {
						if (sum == 0) {
							cell = row.createCell(33);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(33);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 19) {
						if (sum == 0) {
							cell = row.createCell(34);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(34);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					}
				}
				listNm++;
			}
		}
		log.info(log.getClass().getName() + "service excelDownload end");
		return wb;
	}

	/**
	 * 프로그램만족도 엑셀 다운로드
	 */
	@Override
	public XSSFWorkbook excelDownload(ProgramInsertDTO programDtoList) throws IOException {

		log.info(log.getClass().getName() + "program excelDownload start");
		// 평균 합계
		int array = 0;
		int sum = 0;
		// 워크북 생성

		XSSFWorkbook wb = new XSSFWorkbook();

		Sheet sheet = wb.createSheet("프로그램만족도");

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 평균 스타일
		CellStyle headTwoStyle = wb.createCellStyle();

		headTwoStyle.setBorderTop(BorderStyle.THIN);

		headTwoStyle.setBorderBottom(BorderStyle.THIN);

		headTwoStyle.setBorderLeft(BorderStyle.THIN);

		headTwoStyle.setBorderRight(BorderStyle.THIN);

		headTwoStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headTwoStyle.setWrapText(true);

		headTwoStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());

		headTwoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headTwoStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#0.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		// 셀 병합
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 9, 9));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 10, 10));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 11, 11));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 12, 14));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 15, 17));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 18, 20));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 21, 21));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 22, 24));

		// 헤더 생성
		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("참여프로그램");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("거주지");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("직업");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("프로그램명");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("강사명");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("장소");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("참여구분");

		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("강사");

		cell = row.createCell(15);
		cell.setCellStyle(headStyle);
		cell.setCellValue("구성/품질");

		cell = row.createCell(18);
		cell.setCellStyle(headStyle);
		cell.setCellValue("효과성");

		cell = row.createCell(21);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기타의견");

		cell = row.createCell(22);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("평균");

		// 2행 헤더
		row = sheet.createRow(rowNo++);

		for (int i = 0; i < 11; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
		}

		int scoreCount = programDtoList.getProgramDtoList().get(0).getScoreList().size();
		int questionCnt = 0;
		for (int i = 0; i < scoreCount; i++) {
			cell = row.createCell(i + 12);
			cell.setCellStyle(headStyle);

			if (i == 9) {
				cell.setCellValue("기타의견");
				questionCnt = 0;
			} else {
				cell.setCellValue("문항" + (questionCnt + 1));
				questionCnt++;
			}
		}

		cell = row.createCell(22);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("강사");

		cell = row.createCell(23);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("구성/품질");

		cell = row.createCell(24);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("효과성");

		// 데이터 부분 생성
		int listNm = 0;

		for (ProgramInsertDTO pDTO : programDtoList.getProgramDtoList()) {

			row = sheet.createRow(rowNo++);

			if (pDTO.getSex().toString().equals("")) {
				log.info("pDTO.getsex == null ? : " + pDTO.getSex() == null);
				return wb;
			} else {

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(pDTO.getOpenday());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPtcProgram()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getSex()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getResidence()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getJob()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getProgram_name()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getTeacher()));

				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPlace()));

				cell = row.createCell(11);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getType()));

				for (int j = 0; j < pDTO.getScoreList().size(); j++) {
					cell = row.createCell(j + 12);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(pDTO.getScoreList().get(j).toString());
					if (pDTO.getScoreList().get(j).length() == 1) {
						if (j == 9) {
						} else {
							if (Integer.parseInt(pDTO.getScoreList().get(j)) == 0) {

							} else {
								if (Integer.parseInt(pDTO.getScoreList().get(j)) != 0) {
									array += Integer.parseInt(pDTO.getScoreList().get(j));
									sum++;
								}
							}
						}
					}

					if (j == 2) {
						if (sum == 0) {
							cell = row.createCell(22);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0.0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(22);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 5) {
						if (sum == 0) {
							cell = row.createCell(23);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(23);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (j == 8) {
						if (sum == 0) {
							cell = row.createCell(24);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(24);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					}

				}

				listNm++;
			}
		}
		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	/**
	 * 상담치유 서비스 엑셀다운로드
	 */
	@Override
	public XSSFWorkbook excelDownload(CounselInsertDTO counselDtoList) throws IOException {
		log.info(log.getClass().getName() + "program excelDownload start");
		// 평균 합계
		int array = 0;
		int sum = 0;
		// 워크북 생성

		XSSFWorkbook wb = new XSSFWorkbook();

		Sheet sheet = wb.createSheet("상담치유서비스효과평가");

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 평균 스타일
		CellStyle headTwoStyle = wb.createCellStyle();

		headTwoStyle.setBorderTop(BorderStyle.THIN);

		headTwoStyle.setBorderBottom(BorderStyle.THIN);

		headTwoStyle.setBorderLeft(BorderStyle.THIN);

		headTwoStyle.setBorderRight(BorderStyle.THIN);

		headTwoStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headTwoStyle.setWrapText(true);

		headTwoStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());

		headTwoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headTwoStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#0.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);

		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 9, 9));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 10, 10));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 11, 11));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 12, 12));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 13, 13));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 14, 15));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 16, 18));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 19, 20));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 21, 23));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 24, 26));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 27, 30));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 31, 36));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 37, 39));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 40, 42));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 43, 48));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 49, 51));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 52, 55));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 56, 57));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 58, 60));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 61, 63));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 64, 67));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 68, 70));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 71, 73));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 74, 75));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 76, 94));

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성명");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("거주지");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("직업");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("과거 상담/치유 서비스 경험 유무");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("콘텐츠 종류");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("회기");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("회당시간");

		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("월사용료");

		cell = row.createCell(13);
		cell.setCellStyle(headStyle);
		cell.setCellValue("평가시점 ");

		cell = row.createCell(14);
		cell.setCellStyle(headStyle);
		cell.setCellValue("변화동기");

		cell = row.createCell(16);
		cell.setCellStyle(headStyle);
		cell.setCellValue("신뢰(라포)");

		cell = row.createCell(19);
		cell.setCellStyle(headStyle);
		cell.setCellValue("서비스이해");

		cell = row.createCell(21);
		cell.setCellStyle(headStyle);
		cell.setCellValue("조절실패");

		cell = row.createCell(24);
		cell.setCellStyle(headStyle);
		cell.setCellValue("현저성");

		cell = row.createCell(27);
		cell.setCellStyle(headStyle);
		cell.setCellValue("문제적결과");

		cell = row.createCell(31);
		cell.setCellStyle(headStyle);
		cell.setCellValue("낮은 자기조절력");

		cell = row.createCell(37);
		cell.setCellStyle(headStyle);
		cell.setCellValue("부적정서");

		cell = row.createCell(40);
		cell.setCellStyle(headStyle);
		cell.setCellValue("편향된 신념");

		cell = row.createCell(43);
		cell.setCellStyle(headStyle);
		cell.setCellValue("역기능적 자기도식");

		cell = row.createCell(49);
		cell.setCellStyle(headStyle);
		cell.setCellValue("대인관계기술부족");

		cell = row.createCell(52);
		cell.setCellStyle(headStyle);
		cell.setCellValue("대인민감성");

		cell = row.createCell(56);
		cell.setCellStyle(headStyle);
		cell.setCellValue("욕구충족");

		cell = row.createCell(58);
		cell.setCellStyle(headStyle);
		cell.setCellValue("긍정정서");

		cell = row.createCell(61);
		cell.setCellStyle(headStyle);
		cell.setCellValue("삶의민족");

		cell = row.createCell(64);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자기이해");

		cell = row.createCell(68);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자기수용");

		cell = row.createCell(71);
		cell.setCellStyle(headStyle);
		cell.setCellValue("마음관리기술/기회");

		cell = row.createCell(74);
		cell.setCellStyle(headStyle);
		cell.setCellValue("활용역량");

		cell = row.createCell(76);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("평균");

		row = sheet.createRow(rowNo++);

		for (int i = 0; i < 14; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
		}
		for (int i = 1; i < 63; i++) {
			cell = row.createCell(i + 13);
			cell.setCellStyle(headStyle);
			cell.setCellValue("문항" + i);
		}

		// 2행 평균 헤더 넣기
		cell = row.createCell(76);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("변화동기");

		cell = row.createCell(77);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("신뢰(라포)");

		cell = row.createCell(78);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("서비스이해");

		cell = row.createCell(79);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("조절실패");

		cell = row.createCell(80);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("현저성");

		cell = row.createCell(81);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("문제적결과");

		cell = row.createCell(82);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("낮은 자기조절력");

		cell = row.createCell(83);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("부적정서");

		cell = row.createCell(84);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("편향된 신념");

		cell = row.createCell(85);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("역기능적 자기도식");

		cell = row.createCell(86);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("대인관계기술부족");

		cell = row.createCell(87);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("대인민감성");

		cell = row.createCell(88);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("욕구충족");

		cell = row.createCell(89);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("긍정정서");

		cell = row.createCell(90);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("삶의민족");

		cell = row.createCell(91);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("자기이해");

		cell = row.createCell(92);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("자기수용");

		cell = row.createCell(93);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("마음관리기술/기회");

		cell = row.createCell(94);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("활용역량");

		// 데이터 부분 생성
		int listNm = 0;
		for (CounselInsertDTO rDTO : counselDtoList.getCounselDtoList()) {

			row = sheet.createRow(rowNo++);

			if (rDTO.getSex().toString().equals("")) {
				log.info("rDTO.getsex == null ? : " + rDTO.getSex() == null);
				return wb;
			} else {

				String[] sessionArr = CmmUtil.nvl(rDTO.getSession()).split("/");
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(rDTO.getOpenday());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getName()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getSex()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getResidence()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getJob()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getPast_stress_experience()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getCounsel_contents()));

				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(sessionArr[0]);

				cell = row.createCell(11);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(sessionArr[1]);

				cell = row.createCell(12);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(sessionArr[2]);

				// 데이터를 잘라서 넣어줌
				cell = row.createCell(13);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(rDTO.getPv()));

				for (int k = 1; k < 63; k++) {
					cell = row.createCell(k + 13);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(rDTO.getScoreList().get(k - 1));
					if (Integer.parseInt(rDTO.getScoreList().get(k - 1)) != 0) {
						array += Integer.parseInt(rDTO.getScoreList().get(k - 1));
						sum++;
					}

					// 평균값 바디 데이터
					if (k == 2) {
						if (sum == 0) {
							cell = row.createCell(76);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(76);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 5) {
						if (sum == 0) {
							cell = row.createCell(77);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(77);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 7) {
						if (sum == 0) {
							cell = row.createCell(78);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(78);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 10) {
						if (sum == 0) {
							cell = row.createCell(79);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(79);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 13) {
						if (sum == 0) {
							cell = row.createCell(80);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(80);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 17) {
						if (sum == 0) {
							cell = row.createCell(81);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(81);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 23) {
						if (sum == 0) {
							cell = row.createCell(82);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(82);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 26) {
						if (sum == 0) {
							cell = row.createCell(83);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(83);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 29) {
						if (sum == 0) {
							cell = row.createCell(84);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(84);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 35) {
						if (sum == 0) {
							cell = row.createCell(85);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(85);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 38) {
						if (sum == 0) {
							cell = row.createCell(86);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(86);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 42) {
						if (sum == 0) {
							cell = row.createCell(87);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(87);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 44) {
						if (sum == 0) {
							cell = row.createCell(88);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(88);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 47) {
						if (sum == 0) {
							cell = row.createCell(89);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(89);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 50) {
						if (sum == 0) {
							cell = row.createCell(90);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(90);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 54) {
						if (sum == 0) {
							cell = row.createCell(91);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(91);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 57) {
						if (sum == 0) {
							cell = row.createCell(92);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(92);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 60) {
						if (sum == 0) {
							cell = row.createCell(93);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(93);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 62) {
						if (sum == 0) {
							cell = row.createCell(94);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(94);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					}

				}

				listNm++;
			}
		}
		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	@Override
	public XSSFWorkbook excelDownload(PreventInsertDTO preventDtoList) throws IOException {
		// List 예제
		log.info("excelDown start");
		// 평균 합계
		int array = 0;
		int sum = 0;

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		XSSFSheet sheet = wb.createSheet("예방서비스효과평가"); // sheet 생성

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 평균 스타일
		CellStyle headTwoStyle = wb.createCellStyle();

		headTwoStyle.setBorderTop(BorderStyle.THIN);

		headTwoStyle.setBorderBottom(BorderStyle.THIN);

		headTwoStyle.setBorderLeft(BorderStyle.THIN);

		headTwoStyle.setBorderRight(BorderStyle.THIN);

		headTwoStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headTwoStyle.setWrapText(true);

		headTwoStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());

		headTwoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headTwoStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#0.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);

		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 9, 9));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 10, 10));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 11, 13));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 14, 16));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 17, 20));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 21, 22));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 23, 27));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 28, 30));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 31, 36));

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성명");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("거주지");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("직업");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("참여프로그램");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("과거 상담/치유 서비스 경험 유무");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("평가시점");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("중독특징이해");

		cell = row.createCell(14);
		cell.setCellStyle(headStyle);
		cell.setCellValue("핵심증상이해");

		cell = row.createCell(17);
		cell.setCellStyle(headStyle);
		cell.setCellValue("문제대응방법이해");

		cell = row.createCell(21);
		cell.setCellStyle(headStyle);
		cell.setCellValue("활용역량");

		cell = row.createCell(23);
		cell.setCellStyle(headStyle);
		cell.setCellValue("심리적면역력강화");

		cell = row.createCell(28);
		cell.setCellStyle(headStyle);
		cell.setCellValue("삶의질");

		cell = row.createCell(31);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("평균");

		for (int i = 0; i < 11; i++) // autuSizeColumn after setColumnWidth setting!!
		{
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1024); // 이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에
																		// (short)512를 추가해 주니 한결 보기 나아졌다.
		}

		row = sheet.createRow(rowNo++);

		for (int i = 0; i < 11; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
		}
		for (int i = 1; i < 21; i++) {
			cell = row.createCell(i + 10);
			cell.setCellStyle(headStyle);
			cell.setCellValue("문항" + i);
		}
		cell = row.createCell(31);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("중독특징이해");

		cell = row.createCell(32);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("핵심증상이해");

		cell = row.createCell(33);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("문제대응방법이해");

		cell = row.createCell(34);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("활용역량");

		cell = row.createCell(35);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("심리적면역력강화");

		cell = row.createCell(36);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("삶의질");

		// 데이터 부분 생성
		int listNm = 0;
		for (PreventInsertDTO pDTO : preventDtoList.getPreventDtoList()) {

			row = sheet.createRow(rowNo++);

			if (pDTO.getSex().toString().equals("")) {
				log.info("pDTO.getsex == null ? : " + pDTO.getSex() == null);
				return wb;
			} else {

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(pDTO.getOpenday());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getName()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getSex()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getResidence()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getJob()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPtcProgram()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPast_stress_experience()));

				// 데이터를 잘라서 넣어줌
				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(pDTO.getPv()));

				for (int k = 1; k < 21; k++) {
					cell = row.createCell(k + 10);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(pDTO.getScoreList().get(k - 1));
					if (Integer.parseInt(pDTO.getScoreList().get(k - 1)) != 0) {
						array += Integer.parseInt(pDTO.getScoreList().get(k - 1));
						sum++;
					}
					if (k == 3) {
						if (sum == 0) {
							cell = row.createCell(31);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(31);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 6) {
						if (sum == 0) {
							cell = row.createCell(32);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(32);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 10) {
						if (sum == 0) {
							cell = row.createCell(33);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(33);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 12) {
						if (sum == 0) {
							cell = row.createCell(34);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(34);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 17) {
						if (sum == 0) {
							cell = row.createCell(35);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(35);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 20) {
						if (sum == 0) {
							cell = row.createCell(36);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(36);
							cell.setCellStyle(averageStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					}

				}

				listNm++;
			}
		}

		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	// 힐링서비스 엑셀데이터
	@Override
	public XSSFWorkbook excelDownload(HealingInsertDTO healingDtoList) throws IOException {
		// List 예제
		log.info("excelDown start");
		// 평균 합계
		int array = 0;
		int sum = 0;

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		XSSFSheet sheet = wb.createSheet("힐링서비스효과평가"); // sheet 생성

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 평균 스타일
		CellStyle headTwoStyle = wb.createCellStyle();

		headTwoStyle.setBorderTop(BorderStyle.THIN);

		headTwoStyle.setBorderBottom(BorderStyle.THIN);

		headTwoStyle.setBorderLeft(BorderStyle.THIN);

		headTwoStyle.setBorderRight(BorderStyle.THIN);

		headTwoStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headTwoStyle.setWrapText(true);

		headTwoStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());

		headTwoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headTwoStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#0.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);

		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 9, 9));
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 10, 10));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 11, 12));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 13, 15));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 16, 19));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 20, 22));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 23, 26));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 27, 29));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 30, 32));
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 33, 39));

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성명");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("거주지");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("직업");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("참여프로그램");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("과거 상담/치유 서비스 경험 유무");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("평가시점");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("욕구충족");

		cell = row.createCell(13);
		cell.setCellStyle(headStyle);
		cell.setCellValue("긍정정서");

		cell = row.createCell(16);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자기이해");

		cell = row.createCell(20);
		cell.setCellStyle(headStyle);
		cell.setCellValue("마음관리기술/기회");

		cell = row.createCell(23);
		cell.setCellStyle(headStyle);
		cell.setCellValue("정서능력측면");

		cell = row.createCell(27);
		cell.setCellStyle(headStyle);
		cell.setCellValue("영성측면");

		cell = row.createCell(30);
		cell.setCellStyle(headStyle);
		cell.setCellValue("삶의 조망측면");

		cell = row.createCell(33);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("평균");

		for (int i = 0; i < 11; i++) // autuSizeColumn after setColumnWidth setting!!
		{
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1024); // 이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에
																		// (short)512를 추가해 주니 한결 보기 나아졌다.
		}

		// 2행 헤더
		row = sheet.createRow(rowNo++);

		for (int i = 0; i < 11; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
		}
		for (int i = 1; i < 13; i++) {
			cell = row.createCell(i + 10);
			cell.setCellStyle(headStyle);
			cell.setCellValue("문항" + i);
		}
		for (int i = 1; i < 11; i++) {
			cell = row.createCell(i + 22);
			cell.setCellStyle(headStyle);
			cell.setCellValue("문항" + i);
		}
		cell = row.createCell(33);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("욕구충족");

		cell = row.createCell(34);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("긍정정서");

		cell = row.createCell(35);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("자기이해");

		cell = row.createCell(36);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("마음관리기술/기회");

		cell = row.createCell(37);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("정서능력측면");

		cell = row.createCell(38);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("영성측면");

		cell = row.createCell(39);
		cell.setCellStyle(headTwoStyle);
		cell.setCellValue("삶의 조망측면");

		// 데이터 부분 생성
		int listNm = 0;
		for (HealingInsertDTO hDTO : healingDtoList.getHealingDtoList()) {

			row = sheet.createRow(rowNo++);

			if (hDTO.getSex().toString().equals("")) {
				log.info("hDTO.getsex == null ? : " + hDTO.getSex() == null);
				return wb;
			} else {

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(hDTO.getOpenday());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getName()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getSex()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getResidence()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getJob()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getPtcProgram()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getPast_stress_experience()));

				// 데이터를 잘라서 넣어줌
				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getPv()));

				for (int k = 1; k < hDTO.getScoreList().size() + 1; k++) {
					cell = row.createCell(k + 10);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(hDTO.getScoreList().get(k - 1));
					if (Integer.parseInt(hDTO.getScoreList().get(k - 1)) != 0) {
						array += Integer.parseInt(hDTO.getScoreList().get(k - 1));
						sum++;
					}
					if (k == 2) {
						if (sum == 0) {
							cell = row.createCell(33);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(33);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 5) {
						if (sum == 0) {
							cell = row.createCell(34);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(34);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 9) {
						if (sum == 0) {
							cell = row.createCell(35);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(35);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 12) {
						if (sum == 0) {
							cell = row.createCell(36);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(36);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 16) {
						if (sum == 0) {
							cell = row.createCell(37);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(37);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 19) {
						if (sum == 0) {
							cell = row.createCell(38);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(38);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					} else if (k == 22) {
						if (sum == 0) {
							cell = row.createCell(39);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((int) 0);
							array = 0;
							sum = 0;
						} else {
							cell = row.createCell(39);
							cell.setCellStyle(bodyStyle);
							cell.setCellValue((double) array / sum);
							array = 0;
							sum = 0;
						}
					}
				}
				listNm++;
			}
		}

		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	// hrv 엑셀데이터
	@Override
	public XSSFWorkbook excelDownload(HrvInsertDTO hrvDtoList) throws IOException {
		// List 예제
		log.info("excelDown start");
		// 평균 합계

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		XSSFSheet sheet = wb.createSheet("hrv측정 검사"); // sheet 생성

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		/*
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 10, 10));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 11, 11));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 12, 12));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 13, 13));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 14, 14));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 15, 15));
		 * sheet.addMergedRegion(new CellRangeAddress(0, 0, 16, 16));
		 */
		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("ID");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주민등록번호");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시점");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("측정센서");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자율신경 활성도");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자율신경 균형도");

		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("스트레스 저항도");

		cell = row.createCell(13);
		cell.setCellStyle(headStyle);
		cell.setCellValue("스트레스 지수");

		cell = row.createCell(14);
		cell.setCellStyle(headStyle);
		cell.setCellValue("피로도 지수");

		cell = row.createCell(15);
		cell.setCellStyle(headStyle);
		cell.setCellValue("평균 심박동수");

		cell = row.createCell(16);
		cell.setCellStyle(headStyle);
		cell.setCellValue("심장 안정도 ");

		cell = row.createCell(17);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이상 심박동수");

		for (int i = 0; i < 11; i++) // autuSizeColumn after setColumnWidth setting!!
		{
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1024); // 이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에
																		// (short)512를 추가해 주니 한결 보기 나아졌다.
		}

		// 데이터 부분 생성
		int listNm = 0;
		for (HrvInsertDTO hDTO : hrvDtoList.getHrvDtoList()) {

			row = sheet.createRow(rowNo++);

			if (hDTO.getSex().toString().equals("")) {
				log.info("hDTO.getsex == null ? : " + hDTO.getSex() == null);
				return wb;
			} else {
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(hDTO.getId());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getName()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getJumin()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getSex()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getDate()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getPv()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(hDTO.getEquipment()));
				int index = 0;
				for (int k = 1; k < hDTO.getScoreList().size() * 2 + 1; k++) {
					log.info("size : " + hDTO.getScoreList().size());
					log.info("k : " + k);
					log.info("index : " + index);
					if (index == 7) {
						cell = row.createCell(k + 9);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(hDTO.getNum8());
						break;
					}
					String numAndState = hDTO.getScoreList().get(index);
					cell = row.createCell(k + 9);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(numAndState);
					index++;
				}
				listNm++;
			}
		}

		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	// 바이브라 엑셀데이터
	@Override
	public XSSFWorkbook excelDownload(VibraInsertDTO vibraDtoList) throws IOException {
		// List 예제
		log.info("excelDown start");
		// 평균 합계

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		XSSFSheet sheet = wb.createSheet("바이브라측정 검사"); // sheet 생성

		Row row = null;
		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		headStyle.setWrapText(true);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		XSSFDataFormat format = (XSSFDataFormat) wb.createDataFormat();

		bodyStyle.setDataFormat(format.getFormat("@"));
		// 평균 소숫점 스타일
		CellStyle averageStyle = wb.createCellStyle();

		averageStyle.setDataFormat(format.getFormat("#.#0"));

		averageStyle.setBorderTop(BorderStyle.THIN);

		averageStyle.setBorderBottom(BorderStyle.THIN);

		averageStyle.setBorderLeft(BorderStyle.THIN);

		averageStyle.setBorderRight(BorderStyle.THIN);

		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기관명");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("ID");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주민등록번호");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연령");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성별");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실시일자");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시점");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("측정센서");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("적극|공격성");

		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("스트레스");

		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("불안");

		cell = row.createCell(13);
		cell.setCellStyle(headStyle);
		cell.setCellValue("의심");

		cell = row.createCell(14);
		cell.setCellStyle(headStyle);
		cell.setCellValue("밸런스");

		cell = row.createCell(15);
		cell.setCellStyle(headStyle);
		cell.setCellValue("카리스마");

		cell = row.createCell(16);
		cell.setCellStyle(headStyle);
		cell.setCellValue("에너지");

		cell = row.createCell(17);
		cell.setCellStyle(headStyle);
		cell.setCellValue("자기조절");

		cell = row.createCell(18);
		cell.setCellStyle(headStyle);
		cell.setCellValue("억제");

		cell = row.createCell(19);
		cell.setCellStyle(headStyle);
		cell.setCellValue("신경증");

		for (int i = 0; i < 10; i++) // autuSizeColumn after setColumnWidth setting!!
		{
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 1024); // 이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에
																		// (short)512를 추가해 주니 한결 보기 나아졌다.
		}

		// 데이터 부분 생성
		int listNm = 0;
		for (VibraInsertDTO vDTO : vibraDtoList.getVibraDtoList()) {

			row = sheet.createRow(rowNo++);

			if (vDTO.getSex().toString().equals("")) {
				log.info("vDTO.getsex == null ? : " + vDTO.getSex() == null);
				return wb;
			} else {
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(listNm);

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getAgency()));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(vDTO.getId());

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getName()));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getJumin()));

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getAge()));

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getSex()));

				cell = row.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getDate()));

				cell = row.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getPv()));

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(CmmUtil.nvl(vDTO.getEquipment()));
				int index = 0;
				for (int k = 1; k < vDTO.getScoreList().size() + 1; k++) {
					String numAndState = vDTO.getScoreList().get(index);
					cell = row.createCell(k + 9);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(numAndState);
					index++;
				}
				listNm++;
			}
		}

		log.info(log.getClass().getName() + "program excelDownload end");
		return wb;
	}

	/**
	 * 예방 서비스 엑셀다운로드
	 */

}
