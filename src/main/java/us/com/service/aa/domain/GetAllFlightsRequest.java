package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.*;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
        "available"
})
@XmlRootElement(name = "GetAllFlightsRequest")
public class GetAllFlightsRequest implements java.io.Serializable {

    @XmlElement(required = true)
    private String available;

}
