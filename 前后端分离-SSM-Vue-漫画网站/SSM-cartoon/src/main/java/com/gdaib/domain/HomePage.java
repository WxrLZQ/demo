package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter@Getter
public class HomePage {
    //推荐
    private List<Cartoon> recommed;
    //上排行榜
    private List<Cartoon> T_Ranking;
    //下排行榜
    private List<Cartoon> B_Ranking;
    //榜单
    private List<Cartoon> billboard;

    @Override
    public String toString() {
        return "HomePage{" +
                "recommed=" + recommed +
                ", T_Ranking=" + T_Ranking +
                ", B_Ranking=" + B_Ranking +
                ", billboard=" + billboard +
                '}';
    }
}
