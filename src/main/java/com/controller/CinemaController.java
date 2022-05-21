package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.entity.*;
import com.github.pagehelper.PageInfo;
import com.service.IHallService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.service.ICinemaService;


@Controller
@RequestMapping("/cinema")
public class CinemaController {
    @Resource
    private ICinemaService cinemaService;
    @Resource
    private IHallService hallService;

    @RequestMapping("findAllCinemas")
    @ResponseBody
    public JSONObject findAllCinemas() {
        JSONObject obj = new JSONObject();
        List<Cinema> list = cinemaService.findAllCinemas();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", list.size());
        obj.put("data", list);
        return obj;
    }

    @RequestMapping("findCinemasLikeName")
    @ResponseBody
    public JSONObject findCinemasLikeName(@RequestParam("cinema_name")String cinema_name) {
        JSONObject obj = new JSONObject();
        List<Cinema> list = cinemaService.findCinemasLikeName(cinema_name);
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",list.size());
        obj.put("data", list);
        return obj;
    }

    @RequestMapping("updateCinema")
    @ResponseBody
    public JSONObject updateCinema(@RequestParam("cinema_id")long cinema_id,@RequestParam("cinema_name")String cinema_name,@RequestParam("cinema_address")String cinema_address) {
        JSONObject obj = new JSONObject();
        Cinema cinema = this.cinemaService.findCinemaById(cinema_id);
        cinema.setCinema_name(cinema_name);
        cinema.setCinema_address(cinema_address);
        Integer rs = cinemaService.updateCinema(cinema);
        if(rs > 0) {
            obj.put("code", 0);
            obj.put("mgs", "修改成功");
        }else {
            obj.put("code", 200);
            obj.put("mgs", "修改失败");
        }
        return obj;
    }

    @RequestMapping("addCinema")
    @ResponseBody
    public JSONObject addCinema(@RequestParam("cinema_name")String cinema_name,@RequestParam("cinema_address")String cinema_address) {
        JSONObject obj = new JSONObject();
        Cinema cinema = new Cinema();
        cinema.setCinema_name(cinema_name);
        cinema.setCinema_address(cinema_address);
        Integer rs = this.cinemaService.addCinema(cinema);
        if(rs > 0) {
            obj.put("code", 0);
            obj.put("mgs", "修改成功");
        }else {
            obj.put("code", 200);
            obj.put("mgs", "修改失败");
        }
        return obj;
    }

}