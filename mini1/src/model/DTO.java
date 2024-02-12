package model;

public class DTO {


		// 필드
		private String id;
		private String pw;
		private String nick;


		// 생성자 메소드
		public DTO(String id, String pw, String nick) {
			super();
			this.id = id;
			this.pw = pw;
			this.nick = nick;
		
		}

		// getter 메소드
		public String getId() {
			return id;
		}

		public String getPw() {
			return pw;
		}

		public String getNick() {
			return nick;
		}

	}

