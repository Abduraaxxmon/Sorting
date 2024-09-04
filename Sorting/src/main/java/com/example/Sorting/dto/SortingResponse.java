package com.example.Sorting.dto;

import java.util.List;

public class SortingResponse {
    private  List<Integer> big;
    private List<Integer> small;
    public SortingResponse(List<Integer> big, List<Integer> small) {
        this.big = big;
        this.small = small;
    }


    public List<Integer> getBig() {
        return big;
    }

    public void setBig(List<Integer> big) {
        this.big = big;
    }

    public List<Integer> getSmall() {
        return small;
    }

    public void setSmall(List<Integer> small) {
        this.small = small;
    }
}

