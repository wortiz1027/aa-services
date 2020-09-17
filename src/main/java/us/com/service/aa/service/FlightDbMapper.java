package us.com.service.aa.service;

import org.springframework.jdbc.core.RowMapper;
import us.com.service.aa.domain.FlightDb;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FlightDbMapper implements RowMapper<FlightDb> {

    @Override
    public FlightDb mapRow(ResultSet rs, int rowNum) throws SQLException {
        FlightDb db = new FlightDb();
        db.setId(rs.getString("id_number"));
        db.setNumber(rs.getString("flight_number"));
        db.setSource(rs.getString("source"));
        db.setDestination(rs.getString("destiny"));
        db.setDate(rs.getString("date"));

        return db;
    }
}