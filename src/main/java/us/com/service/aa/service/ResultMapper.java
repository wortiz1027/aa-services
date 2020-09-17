package us.com.service.aa.service;

import us.com.service.aa.domain.Result;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ResultMapper implements RowMapper<Result> {

    @Override
    public Result mapRow(ResultSet rs, int rowNum) throws SQLException {
        Result result = new Result();
        result.setId(rs.getString("flight_id"));
        result.setNumberFlight(rs.getString("flight_number"));
        result.setSource(rs.getString("source"));
        result.setDestiny(rs.getString("destiny"));
        result.setDate(rs.getString("date"));
        result.setNumberSeat(rs.getString("seat_number"));
        result.setAvailable(rs.getString("available"));

        return result;
    }
}
