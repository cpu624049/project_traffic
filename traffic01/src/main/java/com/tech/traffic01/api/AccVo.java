package com.tech.traffic01.api;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AccVo {

  public static void main(String argv[]) {

    try {

	File fXmlFile = new File("http://openapi.seoul.go.kr:8088/4a495651707a6c653130364564575663/xml/AccInfo/1/1000/");
	PrintWriter fout =new PrintWriter(new FileWriter("csv.txt"));
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(fXmlFile);
	doc.getDocumentElement().normalize();
	NodeList nList = doc.getElementsByTagName("sentence");
	for (int temp = 0; temp < nList.getLength(); temp++) {
		Node nNode = nList.item(temp);
		if (nNode.getNodeType() == Node.ELEMENT_NODE) {
			Element eElement = (Element) nNode;
		//	Pattern p = Pattern.compile("\\b(i|me|my|myself|we|our|ours|ourselves|you|your|yours|yourself|yourselves|he|him|his|himself|she|her|hers|herself|it|its|itself|they|them|their|their|themselves|what|which|who|whom|this|that|these|those|am|is|are|was|were|be|been|being|have|has|had|having|do|does|did|doing|would|should|could|ought|i'm|you're|he's|she's|it's|we're|they've|i've|you've|we've|they've|i'd|you'd|he'd|she'd|they'd|i'll|you'll|he'll|she'll|we'll|they'll|isn't|aren't|wasn't|weren't|hasn't|haven't|hadn't|doesn't|don't|didn't|won't|wouldn't|shan't|shouldn't|can't|cannot|couldn't|mustn't|let's|that's|who's|what's|here's|there's|when's|where's|why's|how's|a|an|the|and|but|if|or|because|as|until|while|of|at|by|for|with|about|against|between|into|through|during|before|after|above|below|to|from|up|down|in|out|on|off|over|under|again|further|then|once|here|there|when|where|why|how|all|any|both|each|few|more|most|other|some|such|no|nor|not|only|own|same|so|than|too|very|it|to|but|be|which|with|they|were|and|did|you|up|an|go|our|ie|or|out|from|a|and|on|by|isn|all|mr|who|as|he|she|ll|are|for|in|we|am|in|of|here|while|st|my|us|ve|the|is|so|if|then|was|that|has|have|had|this.....)\\b\\s?");
		//	 Matcher m = p.matcher((eElement.getAttribute("id")+""+ eElement.getElementsByTagName("text").item(0).getTextContent()).replaceAll("\\W", " ")
		//	 .replaceAll("\\d","").replaceAll("\\b[A-z]\\b{1}","").toLowerCase());
        //    String s = m.replaceAll("");
           //  fout.write(s);
			//fout.write((p.matcher(eElement.getAttribute("id")+"" + eElement.getElementsByTagName("text").item(0).getTextContent()).replaceAll("\\W", " ")
				//.replaceAll("\\d","").replaceAll("\\b[A-z]\\b{1}","").toLowerCase()).replaceAll(""));
			fout.write(System.getProperty("line.separator"));
			
			//Matcher m = p.matcher(" ");
			//String s = m.replaceAll("");
 
			fout.write(eElement.getAttribute("id")+" , " + eElement.getElementsByTagName("text").item(0).getTextContent()+System.getProperty("line.separator"));
			
		}
	}
    } catch (Exception e) {
	e.printStackTrace();
    }

  }

}