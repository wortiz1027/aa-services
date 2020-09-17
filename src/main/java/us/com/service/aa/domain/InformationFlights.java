package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import java.util.List;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "InformationFlights", propOrder = {
        "flights"
}, namespace = "http://us.aa.com/flights")
public class InformationFlights implements java.io.Serializable {

    @XmlElement
    private Flights flights;

}
