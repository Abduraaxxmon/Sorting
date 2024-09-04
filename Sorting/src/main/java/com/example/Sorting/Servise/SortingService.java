package com.example.Sorting.Servise;

import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class SortingService {
    public List<Integer> sortingBig(List<Integer> list) {
        List<Integer> lastBig =list.stream().sorted(Comparator.reverseOrder())
                .limit(10)
                .toList();
        return lastBig;
    }
    public List<Integer> sortingSmall(List<Integer> list) {
        List<Integer> lastSmall=list.stream().sorted()
                .limit(10)
                .toList();
        return lastSmall;
    }
}
