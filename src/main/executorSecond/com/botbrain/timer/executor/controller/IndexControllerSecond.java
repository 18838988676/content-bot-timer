package com.botbrain.timer.executor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/exe02")
public class IndexControllerSecond {

    @RequestMapping("/exe02")
    @ResponseBody
    String index() {
        return "xxl job executor02 running.";
    }

}