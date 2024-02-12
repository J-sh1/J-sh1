package main;

import java.util.ArrayList;
import java.util.Scanner;

import controller.Controller;

import javazoom.jl.player.MP3Player;

import model.CharacterDAO;
import model.CharacterDTO;

import model.DTO;

import model.Music;
import model.MusicPlayer;
import model.Random1;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println(
				"                ` `   ```````                        ` `                               ```                          ```  `                                  \r\n"
						+ "                  ````````##                         ``##`                           ``##`                          `###``                                  \r\n"
						+ " `  ``            ###   ``##    ` ##############    ` `##`      ```  ``###`` ```     ``##`   ` `########`#########   ###`         `####################` `  \r\n"
						+ "` ###     ``##`   ###   ``##`     ##`        ```    ` `##`      ` `#####``####`      ``##`   ``````###``````###````  ### `       ``                 ### `   \r\n"
						+ "  ##`     ` ##`   ###   ``##     `##`               ` `##`   `` ``###`` `   `### ` ` ``##`      ` `##``    `##`      ###```                         ###     \r\n"
						+ "  ##` `   ` ##``  ###   ``##     `##`               ` `#######```###`         ##``   ``##`       `####   ```##`      ########                       ##`     \r\n"
						+ "  ##` `   ` ##``  ###   ``##     `##`               ` `##`   `  `##`          ###    ``##`       `####`   `####`     ###``  `                       ##`     \r\n"
						+ "  ############``  ##########     `##``` ``  ``````#######`       ### ``    `  ##`    ``##`     `###``###``### ##` `  ###                        ` ``##      \r\n"
						+ "  ##` `   ` ##``  ###`````##      #################`` `##`      ``###````` ``###     ``##`    `###``` `#####   ###`  ###      `                    ###      \r\n"
						+ "  ##` `   ` ##``  ###  ` `##    `      `` `  `   ` ` ` `        `  `########## `     ``##`    ``` ` ` ` `#    `  ``  ###     `##############################\r\n"
						+ "  ##` `   ` ##``  ###   ``##          ####################          `  ``````        ``##`          ` ``  ```````` `  `  `     `            ##``            \r\n"
						+ "  ##` `   ` ##``  ###   ``##         ``                ###          `   ` `          ``##`           ``###############   `                  ##``           `\r\n"
						+ "  ############    ###   ``##        ``                 ###     ````````  ` ``    ```` `##`          `###`    ``` ` `####`                   ##`             \r\n"
						+ "                  ###   ``##         `####################   ` `#################### ``##`          ###              `###`                  ##`             \r\n"
						+ "                  ###   ``##         `###`             `       `            `  ``    ``##`          ###`            ``##`                   ##`             \r\n"
						+ "                  ###`  ``##         `###````````````````` `                         ``##`           `####` ` `  `#####``                   ##`             \r\n"
						+ "                         `##        ` ####################                          ` `##`             ``########### `                     `##`             ");

		MusicPlayer musicPlayer = new MusicPlayer();
		CharacterDTO cDTO = new CharacterDTO(null, 0, 0, 0);
		CharacterDAO cDAO = new CharacterDAO();
		Controller controller = new Controller();
		Random1 r = new Random1();
		DTO dto = null;
		int num = 0;
		MP3Player mp3 = new MP3Player();
		ArrayList<Music> list = new ArrayList<Music>();
		Music m1 = new Music("오프닝", "C:\\music_v2\\오프닝.mp3");
		Music m2 = new Music("짱구", "C:\\music_v2\\짱구.mp3");
		Music m3 = new Music("엔딩", "C:\\music_v2\\엔딩.mp3");
		
		list.add(m1);
		list.add(m2);
		list.add(m3);
		
		while (true) {

			if(mp3.isPlaying()) {
				mp3.stop();
			}
			mp3.play(list.get(0).getPath());
			
			System.out.print("[1]회원가입  [2]로그인  [3]랭킹  [4]게임종료 >> ");
			int menu = sc.nextInt();
			if (menu == 1) { // 회원가입
				System.out.println("회원 등록");
				System.out.print("아이디 입력 : ");
				String id = sc.next();
				System.out.print("비밀번호 입력 : ");
				String pw = sc.next();
				System.out.print("닉네임 입력 : ");
				String nick = sc.next();
				dto = new DTO(id, pw, nick);
				int cnt = controller.join(dto);
				

			} else if (menu == 2) { // 로그인
				if(mp3.isPlaying()) {
					mp3.stop();
				}
				mp3.play(list.get(1).getPath());
				System.out.print("아이디 입력 : ");
				String id = sc.next();
				System.out.print("비밀번호 입력 : ");
				String pw = sc.next();

				DTO info = controller.login(id, pw);

				if (info == null) {
					System.out.println("로그인 실패");
				} else if (info != null) {
					String name = info.getNick() + "님 환영합니다.";
					for (int i = 0; i < name.length(); i++) {
						System.out.print(name.charAt(i));
						try {
							Thread.sleep(50);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						if(mp3.isPlaying()) {
							mp3.stop();
						}

					}

					int life = r.random4(10) + 11;
					CharacterDTO cInfo = cDAO.login(id, pw);
					cDTO = cInfo;
					String ya = "\n하루최대 배달 가능횟수 : " + cInfo.getLife() + "회 "
							+ "\n간단한 설명\n떡잎유치원(Easy) : 기본경험치 +1, 보너스경험치 +2\n떡잎마을(Hard) : 기본경험치 +2 보너스경험치 +4";
					for (int i = 0; i < ya.length(); i++) {
						System.out.print(ya.charAt(i));
						try {
							Thread.sleep(50);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
					System.out.println();

			
					while (cInfo.getHp() > 0 && cInfo.getLife() > 0) { // 게임진행
						
						cDAO.LevelUp(cDTO);
						
						System.out
								.print("경로선택 >> [1]떡잎마을(Hard) [2]떡잎 유치원(Easy) [3]캐릭터정보 [4]초코비먹기 [5]잠자기 [6]로비로 돌아가기>> ");
						num = sc.nextInt();

						if (num == 1) { // 떡잎마을

							cDAO.delivery1(cDTO);
							cInfo = cDAO.login(id, pw);
							System.out.println("떡잎마을 배달시작");
							System.out.println(cDAO.random3(cDTO));
							cInfo = cDAO.login(id, pw);
							System.out.println("남은 체력 : " + cInfo.getHp());
							System.out.println("남은 배달횟수 : " + cInfo.getLife());
							System.out.println("현재 경험치 : " + cInfo.getExp());
						} else if (num == 2) { // 떡잎유치원

							cDAO.delivery2(cDTO);
							cInfo = cDAO.login(id, pw);
							System.out.println(cDAO.random2(cDTO));
							cInfo = cDAO.login(id, pw);
							System.out.println("떡잎 유치원 배달시작");
							System.out.println("남은 체력 : " + cInfo.getHp());
							System.out.println("남은 배달횟수 : " + cInfo.getLife());
							System.out.println("현재 경험치 : " + cInfo.getExp());

						} else if (num == 3) { // 캐릭터정보
							cInfo = cDAO.login(id, pw);
							cDTO = cInfo;

							cInfo = cDAO.login(id, pw);
							System.out.println("레벨 : " + cInfo.getLevel());
							System.out.println("남은 체력 : " + cInfo.getHp());
							System.out.println("초코비 : " + cInfo.getCb() + "개");
							System.out.println("남은 배달횟수 : " + cInfo.getLife() + "회");
							System.out.println("현재 경험치 : " + cInfo.getExp());

						} else if (num == 4) { // 초코비 먹기

							cDTO = cInfo;
							cDAO.eat(cDTO);// 체력 3회복

							String a = "초코비를 먹어 체력과 배달횟수가 회복됩니다.";
							for (int i = 0; i < a.length(); i++) {
								System.out.print(a.charAt(i));
								try {
									Thread.sleep(50);
								} catch (InterruptedException e) {
									e.printStackTrace();
								}
							}
							System.out.println();
							System.out.println("남은 초코비 개수 : " + cInfo.getCb() + "개");
							System.out.println("체력 + 3, 배달횟수 + 1");
						} else if (num == 5) { // 잠자기
							cDAO.sleep(cDTO);
							cInfo = cDAO.login(id, pw);
							String a = "자는중....                                                                                           ";
							for (int i = 0; i < a.length(); i++) {
								System.out.print(a.charAt(i));
								try {
									Thread.sleep(100);
								} catch (InterruptedException e) {
									e.printStackTrace();
								}
							}
							System.out.println();
							System.out.println("배달 횟수가 초기화 되었습니다.");
							System.out.println("남은 배달횟수 : " + cInfo.getLife());
						} else if (num == 6) { // 뒤로가기
							String end = "로비로 돌아가는중...";
							for (int i = 0; i < end.length(); i++) {
								System.out.print(end.charAt(i));

								try {
									Thread.sleep(50);
								} catch (InterruptedException e) {
									e.printStackTrace();
								}
							}
							if(mp3.isPlaying()) {
								mp3.stop();
							}
							System.out.println();
							break;

						} else {
							System.out.println("잘못 입력하셨습니다.");
						}

					}

					if (cInfo.getLife() <= 0) {
						String end = "남은 배달 횟수를 모두 소진하여 종료합니다.";
						for (int i = 0; i < end.length(); i++) {
							System.out.print(end.charAt(i));
							try {
								Thread.sleep(50);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
						System.out.println();

					} else if (cInfo.getHp() <= 0) {
						System.out.println("" + "\r\n" + "\r\n"
								+ "     . .. .     .. .  .  .  .  .  .  .  . ~$@@$=#@#!, ..       .. .     .  .  .  .  .  .  \r\n"
								+ "        .          .        .  .  .  ,,*!,......-*#@@@#$,.     .           .           .  \r\n"
								+ "                                   -.*-............!@$*##=:,                              \r\n"
								+ "     .  . .     .. .  .  .  .  . ,-*...............-#@@*;*$*:. .. .     .  .  .  .  .  .  \r\n"
								+ "                                -:~...,~-.-;;;-...~$*!!*=!;*#!~                           \r\n"
								+ "                              .-:,....,~,.-#@*=!!!$!,..,!#*;*=#!                          \r\n"
								+ "        .          .        .,~,,.........!@;,~:::~,....,*#*;;*@! .     .  .  .  .  .  .  \r\n"
								+ "            .               ,*,.........-*:-.............,*=;;;*$!.             .         \r\n"
								+ ".  .  .  .  .  .  .     . ..=,.....$#,.-=@~...............;@*;;;!*! . ..       .. .     . \r\n"
								+ "     . .. .     .. .  .  . @.........;@@;*~................**;;;;**     .  .  .  .  .  .  \r\n"
								+ ".. .  .  .  .  .  .     . .#........,$...*~................~#!;;;** . ..       .. .     . \r\n"
								+ "   .        .  .        .  ,,......-=....!:.................*=;;;!=-.  .        . .       \r\n"
								+ "        . .      . .  .  --~!......=......*:,...............,#*;;;**.   .  .  .  .  .  .  \r\n"
								+ "                         !**;.............:#~................$#;;;!#:                     \r\n"
								+ "                         ;.................*.................~@;;;;=:                     \r\n"
								+ "     . .. .     .. .. .  ~.................-..................@$;;;=*,  .  .  .  .  .  .  \r\n"
								+ "                        ;,....................................~@;;;!$-                    \r\n"
								+ "                        =-......-!=$=:.........,!**!;..........@;;;;$~                    \r\n"
								+ "     . .. .     .. .  . =-.....;@@@@@@#!...$-.-@@@@@@#.........@;;;;$~  .  .  .  .  .  .  \r\n"
								+ ".. .     .  .  .  .     =-........$@#:@*...#@.,=@@;;@@.........@;;;;$-..       .. .     . \r\n"
								+ ".  .     .  .  .  .     =-........$@,~@=-..#@...:@:.!@.........@;;;;$-..       .. .       \r\n"
								+ "                   .    =-........$@@@@*...#@...:@!!@$.........@;;;;$~     .        .  .  \r\n"
								+ ".. .     .  .  .  .     =-........=@@@@*...#@...:@#==,.........@;;;;$-..       .. .     . \r\n"
								+ "                        =-........*@!*@$-..#@...:@!............@;;;;$~                    \r\n"
								+ "                        =-........!@.,*@;..#@...-$;............@;;;;$~                    \r\n"
								+ ".  .     .  .  .  .     =-........-@..,*!..:=....!;............@;;;;$- .        . .       \r\n"
								+ "                        ,*.........~...,,...-....,,............@!;;;$~                    \r\n"
								+ "       .. .     .. .. . ;@#....................................@!;;;$~  .  .  .  .  .  .  \r\n"
								+ ".  .     .  .  .  .     .......................................@!;;;$-..       .. .     . \r\n"
								+ "     . .. .     .  .. . .......................................@*;;=$-  .  .  .  .  .  .  \r\n"
								+ "        .          .    ......................................=@;;;=:   .  .  .  .  .  .  \r\n"
								+ ".  .     .  .  .  .     ,.....................................@@;;!$!...       .. .     . \r\n"
								+ "                        -.....................................!@;;;*#~                    \r\n"
								+ "                        ~,.....................................@=;;;$~                    \r\n"
								+ ".. .  .  .  .  .  .     ;,.....................................@#;;;$-..       .. .     . \r\n"
								+ "                        !,.....................................@#;;;$~                    \r\n"
								+ "                        =-.....................................@#;;;$-                    \r\n"
								+ ".. .  .  .  .  .  .     =-.....................................@#;;;$-..       .. .     . \r\n"
								+ "     . .. .     .. .  . =-.....................................@#;;;$~  .  .  .  .  .  .  \r\n"
								+ "       ..       .  .    =-.....................................@#;;;$~  .  .  .  .  .  .  \r\n"
								+ ".  .     .  .  .  .     =-.....................................@#;;;$- .        . .       \r\n"
								+ "     . .. .     .. .. . =-.....................................@#;;;$~  .  .  .  .  .  .  \r\n"
								+ "                        =-.....................................@#;;;$~                    \r\n"
								+ "                        =-.....................................@#;;;$-                    \r\n"
								+ "        .          .    =-.....................................@#;;;$~  .  .  .  .  .  .  \r\n"
								+ "                        =-.....................................@#;;;$-                    \r\n"
								+ ".. .  .  .  .  .  .     *-.....................................@#;;;$-..       .. .     . \r\n"
								+ "        . .     .. .  . *-.....................................@#;;;$~  .  .  .  .  .  .  \r\n"
								+ ".. .  .  .  .  .  .     !,.....................................@#;;;$-..       .. .     . \r\n"
								+ ".  .     .  .  .  .  ,-.;,............................,........@#;;!$- .        . .       \r\n"
								+ "     .  . .     .. . ~@;:,.....,,......:!.............@........@#;*#$-  .  .  .  .  .  .  \r\n"
								+ "                     ,=@$,.....;:......:!.....,......:@~,-.....@@=@#~                     \r\n"
								+ "                    .~=@@-....-=*,.....:=,....;.....:@@$**.....@@@@!.                     \r\n"
								+ "       .. .     .. .,!@@@-....:@@~.....;@:...*$.....$@@@@#*!!!*@@@#~    .  .  .  .  .  .  \r\n"
								+ "                    ,;*@@=****$@@=****=#@$***@@**!!!#@@@@@@@@@@@@@*.                      \r\n"
								+ "                    .:#@@@@@@@@@@@@@@@@@@@@@@@@$--*@@@@@@@@@@@@@@$,                       \r\n"
								+ "     . .. .     .. . .!@@@@@,~#@@@@@@#-*@@@~,,$.  .,!#-,,,!@:,@@@=.     .  .  .  .  .  .  \r\n"
								+ ".  .     .  .  .  .    *@#,.  ,*@@,.. .,*=, .  .  .  .  .  .  .##-  . ..        . .       \r\n"
								+ "");

						String end = "과로사로 인해 사망...";
						for (int i = 0; i < end.length(); i++) {
							System.out.print(end.charAt(i));
							try {
								Thread.sleep(50);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
						System.out.println();
//						break;
					}

				}
			} else if (menu == 3) { // 랭킹
				ArrayList<CharacterDTO> rank1 = cDAO.rank();
				for (int i = 0; i < rank1.size(); i++) {
					System.out.println((i + 1) + "위 : " + rank1.get(i).getNick() + " 레벨 : " + rank1.get(i).getLevel());
					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}

			} else if (menu == 4) { // 게임종료
				System.out.println(
						"\r\n" + "\r\n" + "                                ,~:!****!:~,.                         \r\n"
								+ "                             .!#@@@@@@@@@@@@@=,                       \r\n"
								+ "                           ,=@@@=;:;!*=$@@@@@@@=~                     \r\n"
								+ "                          :@@@@@@;      .,;@@@@@@=,                   \r\n"
								+ "                         !#@@@@@@@*      ;#@@@@@@@@;                  \r\n"
								+ "                        *@@@@*:#@@@-    =@@@@@@@@@@@*                 \r\n"
								+ "                       :@@@@!  -@@@@   .@@@@#;,$@@@@@=                \r\n"
								+ "                       !@@@:    -@@@   .#@@=,  .=@@@@@*               \r\n"
								+ "                      :.!=~,~~~-~;*,    .;:,~~~~:#@@!;@;              \r\n"
								+ "          ,;          ;   :-     !        ;~     =*:  !@,             \r\n"
								+ "          -.-  -      ~  :,       :      ;.       ;,  :@=             \r\n"
								+ "       .. ,,~.:~     ., ,-    ..  .-    -- ..      :  ,@@~            \r\n"
								+ "       ~-*,: !;-     .. $   -$@@@: =    ! =@@$~    ,:  @@=            \r\n"
								+ "       ~~ -, ; ,     .. ! .*@@@@@@=-    ;#@@@@@!    !  =@#.           \r\n"
								+ "        ~-   , -    .-.   *@@@#$#@@:   ,@@@##@@@-   .  ;@@:           \r\n"
								+ "      ~;:~    .,   :,    -@@@#. .@@@   *@@!..#@@$      -@@$           \r\n"
								+ "      -~~,    .-  ~      !@@@-   $@@.  @@@   ;@@@.     .@#~-:         \r\n"
								+ "         *.     ;!       *@@@-  ,@@@  .@@@  .#@@@.     .#.  .:        \r\n"
								+ "        ;.-;=,  :.       ;@@@@$$@@@=   @@@#$#@@@#      ,-    ,-       \r\n"
								+ "        ;!- ,, ,-         $@@@@@@@@,   ;@@@@@@@@~      :      ~       \r\n"
								+ "             ; ~           #@@@@@@-     *@@@@@@;              -.      \r\n"
								+ "             ~ ~            ,~~~~.       .,~~-.               .~      \r\n"
								+ "             --,                                               !      \r\n"
								+ "              $                                                *      \r\n"
								+ "              ~.                                              .~      \r\n"
								+ "              ,,                                      ,,.     -       \r\n"
								+ "               -                                   ,*!..-!~,,;,       \r\n"
								+ "               ~                                ~:;!.,:~::.,,         \r\n"
								+ "               ,~                             .!~ .......,,           \r\n"
								+ "                --                         -;~-..........,,           \r\n"
								+ "                .!-                    .,~;~..............~           \r\n"
								+ "                ~.,#.        .      .!$~,.................;           \r\n"
								+ "                !...~:!~     - .!!::-......................-          \r\n"
								+ "                .:,....-!*!*!*!~...........................~          \r\n"
								+ "                  ~~....,..................................~,         \r\n"
								+ "                   .:-.:....................................!         \r\n"
								+ "                     ,::.........................-..........-.        \r\n"
								+ "                      .;.........................~,.......,:*.        \r\n"
								+ "                      :,.........................-,....-~:*.          \r\n"
								+ "                      *..........................-,.,;*-  ;           \r\n"
								+ "                      :..........................,;:-!    ;           \r\n"
								+ "                     .-..............................~.   !           \r\n"
								+ "                     ,,..............................,-   *           \r\n"
								+ "                     -,..............................,:  .;           \r\n"
								+ "                     ;...............................-~, -,           \r\n"
								+ "                     ;...............................:.; :            \r\n"
								+ "                     ;..........................,,..,:~, ~            \r\n"
								+ "                     ;......~;!-....,!;;,....,:;;;!;!,   -.           \r\n"
								+ "                     -;::::,.  ,;;:-.   -;:;:-      .=   :            \r\n"
								+ "                     -.                   ..         ~~,~:            \r\n"
								+ "                     ~                                :.              \r\n"
								+ "                     :                                :               \r\n" + "");
				
				mp3.play(list.get(2).getPath());
				
				String ending = "다음에 또 봐요~~          ";
				for (int i = 0; i < ending.length(); i++) {
					System.out.print(ending.charAt(i));
					try {
						Thread.sleep(50);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}

				}
				
				break;

			} else {
				System.out.println("잘못 입력 하셨습니다.");
			}

		}

	}

}
