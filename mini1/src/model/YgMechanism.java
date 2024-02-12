package model;

import java.util.Random;

public class YgMechanism {

	public static void main(String[] args) {
		Yg yg = new Yg();
		yg.setExp(0);
		yg.setLv1Yg("야쿠르트");
        int Exp = 0;

        if (Exp >= 100) {
            // 레벨 2로 업그레이드(if(yg.getLv2Yg() == null)인 이유는 경험치는 다 찼고 Lv2Yg값이 지정되지 않아 Null값이면 새롭게
            // Lv2Yg라는 값이 들어감
            if (yg.getLv2Yg() == null) {
                yg.setLv2Yg("메치니코프");
            }
            Exp = 0;
        }

        if (Exp >= 100 && yg.getLv2Yg() != null) {
            // 레벨 3으로 업그레이드
            if (yg.getLv3Yg() == null) {
                yg.setLv3Yg("윌");
            }
            Exp = 0;
        }

        if (Exp >= 100 && yg.getLv3Yg() != null) {
            // 레벨 4로 업그레이드
            if (yg.getLv4Yg() == null) {
                yg.setLv4Yg("하루야채");
            }
            Exp = 0;
        }

        if (Exp >= 100 && yg.getLv4Yg() != null) {
            // 레벨 5로 업그레이드
            if (yg.getLv5Yg() == null) {
                yg.setLv5Yg("쉼");
            }
            Exp = 0;

        }
    }
}