package us.com.service.aa.domain;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;
import java.util.List;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SeatList", propOrder = {
        "seat"
}, namespace = "http://us.aa.com/flights")
public class SeatsList implements java.io.Serializable {

    private List<Seat> seat;

}