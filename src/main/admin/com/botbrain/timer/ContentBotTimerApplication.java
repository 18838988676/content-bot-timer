package com.botbrain.timer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class ContentBotTimerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ContentBotTimerApplication.class, args);
    }

}
