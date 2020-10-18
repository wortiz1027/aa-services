package us.com.service.aa.repository;

import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import us.com.service.aa.domain.FlightDb;
import us.com.service.aa.domain.Result;
import us.com.service.aa.service.FlightDbMapper;
import us.com.service.aa.service.ResultMapper;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BookingRepository implements Booking {

    private final NamedParameterJdbcTemplate template;

    @Override
    public List<Result> findFlightsByCity(String city) {
        String query = "SELECT v.id flight_id, v.numero flight_number, v.origen source, v.destino destiny, v.fecha date, s.numero seat_number, s.disponible available " +
                "FROM Vuelos v INNER JOIN Sillas s ON v.id = s.id_vuelo " +
                "WHERE s.disponible = 'S' " +
                "AND v.origen = :city";

        SqlParameterSource parameters = new MapSqlParameterSource("city", city);

        return template.query(query, parameters, new ResultMapper());
    }

    @Override
    public List<Result> findAllFlights(String available) {
        String query = "SELECT v.id flight_id, v.numero flight_number, v.origen source, v.destino destiny, v.fecha date, s.numero seat_number, s.disponible available " +
                "FROM Vuelos v INNER JOIN Sillas s ON v.id = s.id_vuelo " +
                "WHERE s.disponible = :available";

        SqlParameterSource parameters = new MapSqlParameterSource("available", available);

        return template.query(query, parameters, new ResultMapper());
    }

    @Override
    public List<FlightDb> finAll() {
        String query = "SELECT v.id id_number, v.numero flight_number, v.origen source, v.destino destiny, v.fecha date " +
                "FROM Vuelos v";

        SqlParameterSource parameters = new MapSqlParameterSource("available", "");

        return template.query(query, parameters, new FlightDbMapper());
    }
}
