package com.example.Polilla.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ejemplo")
public class Controller {

    @GetMapping("/holamundo")

    public String holaMunddo(){
        return "Hola Mundo!";
    }

}
