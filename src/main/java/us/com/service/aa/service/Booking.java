package us.com.service.aa.service;

import us.com.service.aa.domain.GetAllFlightsResponse;
import us.com.service.aa.domain.GetFlightsResponse;

public interface Booking {

    GetFlightsResponse flightsAvailablesByCity(String city);

    GetAllFlightsResponse getAllflightsAvailables(String available);

}
