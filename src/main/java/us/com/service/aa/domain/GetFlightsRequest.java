package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.*;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
        "city"
})
@XmlRootElement(name = "GetFlightsRequest")
public class GetFlightsRequest implements java.io.Serializable {

    @XmlElement(required = true)
    private String city;

}
