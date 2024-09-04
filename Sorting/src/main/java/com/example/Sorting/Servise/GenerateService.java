package com.example.Sorting.Servise;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GenerateService {
    public List<Integer> generate(int begin, int end, int count) {
        List<Integer> randomNumbers = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            randomNumbers.add((int) (Math.random() * (end - begin) + begin));
        }
        return randomNumbers;
    }
}
