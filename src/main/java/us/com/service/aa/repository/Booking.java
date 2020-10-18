package us.com.service.aa.repository;

import us.com.service.aa.domain.FlightDb;
import us.com.service.aa.domain.Result;

import java.util.List;

public interface Booking {

    List<Result> findFlightsByCity(String city);

    List<Result> findAllFlights(String available);

    List<FlightDb> finAll();

}
