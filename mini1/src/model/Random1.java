package model;

import java.util.Random;

public class Random1 {
	String na = "";
	Random ran = new Random();

	public String random2(int a) {
		a = ran.nextInt(100) + 1;
		// 떡잎 유치원

		if (a >= 1 && a <= 20) {
			na = "유리";
			
		} else if (a >= 21 && a <= 40) {
			na = "훈발놈";
			
		} else if (a >= 41 && a <= 60) {
			na = "철수";
			
		} else if (a >= 61 && a <= 80) {
			na = "맹구";
			
		} else if (a >= 81 && a <= 84) {
			na = "원장님";
			
		} else if (a == 85) {
			na = "원장님, 초코비 획득!!";
			
		} else if (a >= 86 && a <= 100) {
			na = "치타";
			
		}

		return na;
	}

	// 떡잎마을
	public String random3(int a) {
		na = "";
		a = ran.nextInt(100) + 1;

		if (a >= 1 && a <= 9) {
			na = "이슬이누나";
			
		} else if (a == 10) {
			na = "이슬이누나, 초코비획득!!";
			
		} else if (a >= 11 && a <= 30) {
			na = "미소이모";
			
		} else if (a >= 31 && a <= 50) {
			na = "옆집아줌마";
			
		} else if (a >= 51 && a <= 70) {
			na = "닭살커플";
			
		} else if (a >= 71 && a <= 85) {
			na = "광자누나";
			
		} else if (a >= 86 && a <= 100) {
			na = "오수형";
			
		}

		return na;
	}

	// 배달 횟수 랜덤
	public int random4(int a) {

		a = ran.nextInt(10) + 11;

		return a;
	}
}
