package com.example.Sorting.Controller;


import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class SortingMainController {
    @GetMapping()
    public ModelAndView generate(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();

//        int a =(int) request.getAttribute("num1");
//        request.getRequestDispatcher("SecondController").forward(request,res);
    mv.setViewName("uuidpage");
        return mv;
    }
}
