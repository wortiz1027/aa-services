package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.*;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
        "header",
        "information"
})
@XmlRootElement(name = "GetFlightsResponse")
public class GetFlightsResponse implements java.io.Serializable {

    @XmlElement
    private Header header;
    @XmlElement
    private Information information;

}
