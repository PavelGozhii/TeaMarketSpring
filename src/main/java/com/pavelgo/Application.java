package com.pavelgo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan("com.pavelgo.persistence.model")
@EnableJpaRepositories("com.pavelgo.persistence.repo")
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}