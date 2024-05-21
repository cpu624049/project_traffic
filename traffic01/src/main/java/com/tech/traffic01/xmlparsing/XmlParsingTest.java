package com.tech.traffic01.xmlparsing;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParsingTest {
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	public static void main(String[] args) {
		int page = 1; // 페이지 초기값
		try {
			while (true) {
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://openapi.seoul.go.kr:8088/4a495651707a6c653130364564575663/xml/AccInfo/1/1000/";

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag
				doc.getDocumentElement().normalize();
//				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("row");
//				System.out.println("파싱할 리스트 수 : "+ nList.getLength());

				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;
						System.out.println("######################");
						System.out.println("발생 일자  : " + getTagValue("occr_date", eElement));
						System.out.println("발생 시각  : " + getTagValue("occr_time", eElement));
						System.out.println("종료 예정 일자 : " + getTagValue("exp_clr_date", eElement));
						System.out.println("종료 예정 시각  : " + getTagValue("exp_clr_time", eElement));
						System.out.println("TM X 좌표  : " + getTagValue("grs80tm_x", eElement));
						System.out.println("TM Y 좌표  : " + getTagValue("grs80tm_y", eElement));
						System.out.println("돌발 내용  : " + getTagValue("acc_info", eElement));
					} // for end
				} // if end
			} // while end

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end
	} // main end
}
