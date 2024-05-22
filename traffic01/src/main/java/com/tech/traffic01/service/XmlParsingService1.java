package com.tech.traffic01.service;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.tech.traffic01.dto.XmlData1;

@Service
public class XmlParsingService1 {

    public List<XmlData1> parseXmlData() {
        List<XmlData1> dataList = new ArrayList<>();
        try {
            String url = "http://openapi.seoul.go.kr:8088/4a495651707a6c653130364564575663/xml/AccInfo/1/1000/";

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("row");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    XmlData1 data = new XmlData1(
                            getTagValue("occr_date", eElement),
                            getTagValue("occr_time", eElement),
                            getTagValue("exp_clr_date", eElement),
                            getTagValue("exp_clr_time", eElement),
                            getTagValue("grs80tm_x", eElement),
                            getTagValue("grs80tm_y", eElement),
                            getTagValue("acc_info", eElement),
                            getTagValue("acc_type", eElement)
                    );
                    dataList.add(data);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

    private static String getTagValue(String tag, Element eElement) {
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        Node nValue = nlList.item(0);
        return (nValue == null) ? null : nValue.getNodeValue();
    }
}