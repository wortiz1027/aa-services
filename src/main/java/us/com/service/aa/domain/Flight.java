package us.com.service.aa.domain;

import lombok.Data;
import us.com.service.aa.ws.config.LocalDateAdapter;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.time.LocalDateTime;
import java.util.List;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Flight", propOrder = {
        "number",
        "source",
        "destination",
        "date",
        "seats"
}, namespace = "http://us.aa.com/flights")
public class Flight  implements java.io.Serializable {

   @XmlElement
    private String number;
    @XmlElement
    private String source;
    @XmlElement
    private String destination;
    @XmlElement
    @XmlJavaTypeAdapter(value = LocalDateAdapter.class)
    private LocalDateTime date;
    @XmlElement
    private SeatsList seats;

}
