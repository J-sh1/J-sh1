package model;

public class CharacterDTO {

	private static final int MAX_LEVEL = 5; // 최종 레벨

	private String id;
	private String pw;
	private String Nick;
	private int Level = 1; // 레벨
	private int Exp; // 경험치
	private int Hp; // 체력
	private int Cb;
	private int Life;
	private int Yg; // 요구르트개수

	public CharacterDTO(String nick, int level, int exp, int hp) {
		super();
		this.Nick = nick;
		Level = level;
		Exp = exp;
		Hp = hp;

	}

	public CharacterDTO(String nick2, int lv) {
		
		this.Nick = nick2;
		Level = lv;
	}

	
	public CharacterDTO(String id, String pw, String nick, int level, int hp, int exp, int cb, int life) {
		super();
		this.id = id;
		this.pw = pw;
		Nick = nick;
		Level = level;
		Exp = exp;
		Hp = hp;
		Cb = cb;
		Life = life;

	}


	public static int getMaxLevel() {
		return MAX_LEVEL;
	}


	public int getCb() {
		return Cb;
	}


	public int getLife() {
		return Life;
	}


	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}
	
	public String getNick() {
		return Nick;
	}
	//Health -> Hp로 변경하였음
	public int getHp() {
		return Hp;
	}

	public int getLevel() {
		return Level;
	}

	public int getExp() {
		return Exp;
	}

	public void setHp(int Hp) {
		this.Hp = Hp;
	}

	public void setLevel(int Level) {
		this.Level = Level;
	}

	public void setExp(int Exp) {
		this.Exp = Exp;
	}
	
	
}
