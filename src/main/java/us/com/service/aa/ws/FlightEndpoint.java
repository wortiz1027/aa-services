package us.com.service.aa.ws;

import lombok.RequiredArgsConstructor;

import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;
import us.com.service.aa.domain.GetAllFlightsRequest;
import us.com.service.aa.domain.GetAllFlightsResponse;
import us.com.service.aa.domain.GetFlightsRequest;
import us.com.service.aa.domain.GetFlightsResponse;
import us.com.service.aa.service.Booking;

@Endpoint
@RequiredArgsConstructor
public class FlightEndpoint {

    private final Booking service;

    @PayloadRoot(namespace = "http://us.aa.com/flights", localPart = "GetFlightsRequest")
    @ResponsePayload
    public GetFlightsResponse getFlights(@RequestPayload GetFlightsRequest request) {
        return service.flightsAvailablesByCity(request.getCity());
    }

    @PayloadRoot(namespace = "http://us.aa.com/flights", localPart = "GetAllFlightsRequest")
    @ResponsePayload
    public GetAllFlightsResponse getAllFlights(@RequestPayload GetAllFlightsRequest request) {
        return service.getAllflightsAvailables(request.getAvailable());
    }

}
