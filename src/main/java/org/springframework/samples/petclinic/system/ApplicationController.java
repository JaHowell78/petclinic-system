package org.springframework.samples.petclinic.system;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
class ApplicationController {

    @RequestMapping("/")
    public String home() {
        return "Welcome to PetClinic, Meow!!";
    }

    private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

}
