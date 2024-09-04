package com.example.Sorting.Controller;

import com.example.Sorting.dto.SortingResponse;
import com.example.Sorting.Servise.GenerateService;
import com.example.Sorting.Servise.SortingService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/calculate")
public class NewController {

    private final GenerateService generateService;
    private final SortingService sortingService;

    @PostMapping
    public SortingResponse get(HttpServletRequest request){
        int start = Integer.parseInt(request.getParameter("num1"));
        int end = Integer.parseInt(request.getParameter("num2"));

        List<Integer> result = generateService.generate(start,end,100);

        List<Integer> big= sortingService.sortingBig(result);
        List<Integer> small= sortingService.sortingSmall(result);

        return new SortingResponse(big,small);
    }
}
