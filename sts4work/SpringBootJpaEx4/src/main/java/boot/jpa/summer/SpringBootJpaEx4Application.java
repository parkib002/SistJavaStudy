package boot.jpa.summer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"boot.jpa.dto","boot.jpa.repository"})
@EntityScan({"boot.jpa.dto","boot.jpa.repository"})
@EnableJpaRepositories({"boot.jpa.dto","boot.jpa.repository"})
public class SpringBootJpaEx4Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpaEx4Application.class, args);
	}

}
