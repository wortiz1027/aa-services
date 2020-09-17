package us.com.service.aa.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FlightDb {
    private String id;
    private String number;
    private String source;
    private String destination;
    private String date;
}
