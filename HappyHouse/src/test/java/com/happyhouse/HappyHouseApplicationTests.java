package com.happyhouse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.happyhouse.domain.Dust;

@SpringBootTest
class HappyHouseApplicationTests {

	@Test
	void 서울권_구별_미세먼지_데이터_가져오기() {
		List<Dust> list = new ArrayList<>();
		try {
			BufferedReader br = null;
	        //DocumentBuilderFactory 생성
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        factory.setNamespaceAware(true);
	        DocumentBuilder builder;
	        Document doc = null;
			StringBuilder urlBuilder = new StringBuilder("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst"); /*																									 */
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=3mx51SIhdHttjv2rQ%2FfJO6G6IPC1FXvr%2BklhfK9%2Bm0C3DWr%2FVz2yFyWyGI8AnveL2RFtQe%2Feo7FZaB%2B8OsQIEA%3D%3D"); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /* 측정소 이름 */
			urlBuilder.append("&" + URLEncoder.encode("searchCondition", "UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8")); /* 요청 데이터기간 (하루 : DAILY, 한달 : MONTH, 3달 : 3MONTH) */
			urlBuilder.append("&" + URLEncoder.encode("ver", "UTF-8") + "=" + URLEncoder.encode("1.3", "UTF-8")); /* 버전별 상세 결과 참고문서 참조 */
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String result = "";
            String line;
			while ((line = rd.readLine()) != null) {
				result = result + line.trim();

			}
			// xml 파싱하기
            InputSource is = new InputSource(new StringReader(result));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            XPathFactory xpathFactory = XPathFactory.newInstance();
            XPath xpath = xpathFactory.newXPath();
            // XPathExpression expr = xpath.compile("/response/body/items/item");
            XPathExpression expr = xpath.compile("//items/item");
            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < nodeList.getLength(); i++) {
                NodeList child = nodeList.item(i).getChildNodes();
                Dust dust = new Dust();
                String value = "";
                for (int j = 0; j < child.getLength(); j++) {
                    Node node = child.item(j);
                    value = node.getTextContent();
                    switch(node.getNodeName()) {
                    case "dataTime":
//                    	dust.setDataTime(value);
                    	break;
                    case "cityName":
//                    	dust.setCityName(value);
                    	break;
                    case "pm10Value":
                    	System.out.println(i+1 + " : ");
                    	if(value.charAt(0) == '-') {
                    		System.out.println("d여");
                    		value = "0";
                    	}
                    		
                        System.out.println("+" + value+ "+");
                        
//                    	dust.setPm10Value(Integer.parseInt(value));
                    	break;
                    case "pm25Value":
//                    	dust.setPm25Value(Integer.parseInt(value));
                    	break;
                    }
                }
                list.add(dust);
            }
		} catch (Exception e) {
			System.out.println("error");
		}
		System.out.println(list.size());
		
	}
	
	@Test
	public void getDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(new Date());
		System.out.println(to);
	}
}
