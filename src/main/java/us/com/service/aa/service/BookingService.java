package us.com.service.aa.service;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import us.com.service.aa.domain.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BookingService implements Booking {

    private static final Logger LOG = LoggerFactory.getLogger(BookingService.class);

    private final us.com.service.aa.repository.Booking repository;

    @Override
    public GetFlightsResponse flightsAvailablesByCity(String city) {
        Header header = new Header();
        GetFlightsResponse response = new GetFlightsResponse();

        if (city == null || city.isEmpty()) {
            header.setCode("101");
            header.setDescription("Error! request parameter is empty or null");

            response.setHeader(header);
            return response;
        }

        List<Result> results = repository.findFlightsByCity(city);

        if (results == null) {
            header.setCode("102");
            header.setDescription("Error perform flights query");

            response.setHeader(header);
            return response;
        }

        if (results.size() == 0) {
            header.setCode("103");
            header.setDescription("Error! no information available for city: " + city);

            response.setHeader(header);
            return response;
        }

        Information information = new Information();
        Flight flight = new Flight();
        List<Seat> seats = new ArrayList<>();
        SeatsList seatsList = new SeatsList();

        flight.setNumber(results.get(0).getNumberFlight());
        flight.setSource(results.get(0).getSource());
        flight.setDestination(results.get(0).getDestiny());
        flight.setDate(results.get(0).getDate());

        for (Result r : results) {
            Seat seat = new Seat();
            seat.setNumber(r.getNumberSeat());
            seat.setAvailable(r.getAvailable());
            seats.add(seat);
        }

        seatsList.setSeat(seats);
        flight.setSeats(seatsList);
        information.setFlight(flight);
        response.setInformation(information);

        header.setCode("000");
        header.setDescription("Success!");

        response.setHeader(header);
        return response;
    }

    @Override
    public GetAllFlightsResponse getAllflightsAvailables(String available) {
        try {
            Header header = new Header();
            GetAllFlightsResponse response = new GetAllFlightsResponse();

            if (available == null || available.isEmpty()) {
                header.setCode("101");
                header.setDescription("Error! request parameter is empty or null");

                response.setHeader(header);
                return response;
            }

            List<Result> results = repository.findAllFlights(available);

            if (results == null) {
                header.setCode("102");
                header.setDescription("Error perform flights query");

                response.setHeader(header);
                return response;
            }

            if (results.size() == 0) {
                header.setCode("103");
                header.setDescription("Error! no information available seats: " + available);

                response.setHeader(header);
                return response;
            }
            InformationFlights information = new InformationFlights();
            Flights flights = new Flights();
            List<Flight> listaFlights = new ArrayList<>();

            SeatsList seatsList = new SeatsList();

            List<FlightDb> list = repository.finAll();

            for (FlightDb f : list) {
                List<Seat> seats = new ArrayList<>();
                Flight flight = new Flight();

                flight.setNumber(f.getNumber());
                flight.setSource(f.getSource());
                flight.setDestination(f.getDestination());
                flight.setDate(f.getDate());

                List<Result> tmp = results.stream().filter(x -> f.getId().equalsIgnoreCase(x.getId())).collect(Collectors.toList());

                for (Result r : tmp) {
                    Seat seat = new Seat();
                    seat.setNumber(r.getNumberSeat());
                    seat.setAvailable(r.getAvailable());
                    seats.add(seat);
                }
                seatsList.setSeat(seats);
                flight.setSeats(seatsList);
                listaFlights.add(flight);
            }

            flights.setFlight(listaFlights);
            information.setFlights(flights);

            header.setCode("000");
            header.setDescription("Success!");
            response.setHeader(header);
            response.setInformation(information);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
