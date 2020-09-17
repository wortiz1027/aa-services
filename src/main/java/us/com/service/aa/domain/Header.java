package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Header", propOrder = {
        "code",
        "description"
}, namespace = "http://us.aa.com/flights")
public class Header implements java.io.Serializable {

    @XmlElement
    private String code;
    @XmlElement
    private String description;

}
