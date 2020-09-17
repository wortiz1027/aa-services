package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.*;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
        "header",
        "information"
})
@XmlRootElement(name = "GetAllFlightsResponse")
public class GetAllFlightsResponse implements java.io.Serializable {

    @XmlElement
    private Header header;
    @XmlElement
    private InformationFlights information;
}
