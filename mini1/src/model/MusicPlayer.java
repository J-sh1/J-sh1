package model;

import java.util.ArrayList;

import javazoom.jl.player.MP3Player;
public class MusicPlayer {
	private static MP3Player mp3Player;
	private static ArrayList<Music> bgmList;
	public static void main(String[] args) {
		bgmList = new ArrayList<>();
        MP3Player mp3Player = new MP3Player();

        addMusic("BGM1", "path1.mp3");
        addMusic("BGM2", "path2.mp3");
        // 브금 삽입에 필요한 갯수만큼 더 추가
        playMusic("BGM1");
        stopMusic("BGM1");
        // 브금의 시작과 끝 메소드
    }
	 public static void addMusic(String name, String path) {
	        Music music = new Music(name, path);
	        bgmList.add(music);
	    }

	    public static void playMusic(String name) {
	        for (Music music : bgmList) {
	            mp3Player.play(music.getPath());
	        }
	    }

	    public static void stopMusic(String name) {
	        mp3Player.stop();
	    }
	} // player.jar는 C:\ -> 딱 C드라이브에 아무 폴더 없이 jar파일만 그대로 두고, miniproject01을 우클릭 -> properties -> JAVA build path -> Libraries -> Add External jars로 player.jar 선택 