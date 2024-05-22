package com.tech.traffic01.xmlparsing;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParsing2 {
    // tag값의 정보를 가져오는 메소드
    private static String getTagValue(String tag, Element eElement) {
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        Node nValue = (Node) nlList.item(0);
        if (nValue == null)
            return null;
        return nValue.getNodeValue();
    }

    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Oracle 데이터베이스 연결
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // 호스트, 포트, SID는 실제 환경에 맞게 변경
            String dbUser = "traffic"; // yourusername을 실제 사용자 이름으로 변경
            String dbPassword = "123456"; // yourpassword를 실제 비밀번호로 변경
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 현재 날짜에서 5일 전 날짜 계산
            LocalDate date = LocalDate.now().minusDays(5);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            String formattedDate = date.format(formatter);

            // parsing할 URL 지정(API 키 포함해서)
            String url = "http://openapi.seoul.go.kr:8088/4a495651707a6c653130364564575663/xml/CardSubwayStatsNew/1/1000/" + formattedDate;

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // root tag
            doc.getDocumentElement().normalize();
            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("row");
            System.out.println("파싱할 리스트 수 : " + nList.getLength());

            // SQL 쿼리 준비
            String sql = "INSERT INTO subway_stat (use_date, line_num, station_num, ride_passenger_num, alight_passenger_num) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;

                    // 각 태그의 값을 가져와서 SQL 쿼리에 설정
                    pstmt.setString(1, getTagValue("USE_DT", eElement));
                    pstmt.setString(2, getTagValue("LINE_NUM", eElement));
                    pstmt.setString(3, getTagValue("SUB_STA_NM", eElement));
                    pstmt.setDouble(4, Integer.parseInt(getTagValue("RIDE_PASGR_NUM", eElement)));
                    pstmt.setDouble(5, Integer.parseInt(getTagValue("ALIGHT_PASGR_NUM", eElement)));
                    pstmt.addBatch();
                }
            }
            pstmt.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
