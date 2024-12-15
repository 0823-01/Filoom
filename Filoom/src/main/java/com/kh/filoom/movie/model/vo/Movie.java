package com.kh.filoom.movie.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Movie {
//	MOVIE_NO	NUMBER
	private int movieNo;
//	MOVIE_TITLE	VARCHAR2(200 BYTE)
	private String movieTitle;
//	PREMIERE	CHAR(1 BYTE)
	private String premiere;
//	OPEN_DATE	DATE
	private String openDate;
//	DIRECTOR	VARCHAR2(50 BYTE)
	private String director;
//	GENRE	VARCHAR2(200 BYTE)
	private String genre;
//	RUNTIME	NUMBER
	private int runtime;
//	SCREEN_TYPE	VARCHAR2(200 BYTE)
	private String screenType;
//	FILM_RATE	NUMBER
	private int filmRate;
//	DESCRIPTION	VARCHAR2(2000 BYTE)
	private String description;
//	STARRING	VARCHAR2(500 BYTE)
	private String starring;
//	STATUS	CHAR(1 BYTE)
	private String status;
	private String trailer;

	
	
	//db에는 없는 추가된 필드명
	
	
	//영화이미지
	private String imagePath;
	private String fileCodename;
    
	
    //상영정보(형문)
    private int playingNo;
    private Date playTime;
    private String screenName;
    private String screenInfo;
    
}
