package com.botbrain.timer.executor.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/exe01")
public class IndexControllerExe01 {

    @RequestMapping("/exe01")
    @ResponseBody
    String index() {
        return "xxl job executor01 running.";
    }

}