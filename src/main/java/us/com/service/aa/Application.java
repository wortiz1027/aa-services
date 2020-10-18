package us.com.service.aa;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import us.com.service.aa.service.Booking;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

	/*@Bean
	public CommandLineRunner demo(Booking service) {
		return (args) -> {
			service.getAllflightsAvailables("S");
		};
	}*/

}
