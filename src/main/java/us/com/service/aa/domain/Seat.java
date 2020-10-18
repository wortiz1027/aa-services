package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Seat", propOrder = {
        "number",
        "available",
}, namespace = "http://us.aa.com/flights")
public class Seat implements java.io.Serializable {
    @XmlElement
    private String number;
    @XmlElement
    private String available;

}
