package us.com.service.aa.repository;

import org.springframework.data.jdbc.repository.query.Query;

import java.util.List;

public interface Booking {

    @Query("SELECT * FROM Vuelos")
    List<?> findAll();

}
