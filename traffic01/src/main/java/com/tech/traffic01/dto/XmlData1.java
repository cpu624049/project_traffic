package com.tech.traffic01.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class XmlData1 {
    private String occrDate;
    private String occrTime;
    private String expClrDate;
    private String expClrTime;
    private String grs80tmX;
    private String grs80tmY;
    private String accInfo;
}
