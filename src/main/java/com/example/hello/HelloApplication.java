package com.example.hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// JSP + (tomcat(WAS) + Servlet)
// Spring Model(Data) - View(template(Thymeleaf, Jinja...))

@SpringBootApplication
public class HelloApplication {

    public static void main(String[] args) {

        SpringApplication.run(HelloApplication.class, args);
    }
}
