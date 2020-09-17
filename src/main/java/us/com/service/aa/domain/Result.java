package us.com.service.aa.domain;

import lombok.Data;

@Data
public class Result implements java.io.Serializable {

    private String id;
    private String numberFlight;
    private String source;
    private String destiny;
    private String date;
    private String numberSeat;
    private String available;

}
