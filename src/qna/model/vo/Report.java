package qna.model.vo;

import java.util.Date;

public class Report {
	private int report_no;					// 신고번호
	private String report_content;			// 신고사유
	private Date report_date;				// 신고날짜
	private int user_no;					// 신고자 회원번호
	private String nickname;				// 신고자 회원닉네임
	private int ruser_no;					// 신고당한 회원번호
	private String rnickname;				// 신고당한 회원닉네임
	private String subject;					// 분류
	private int br_no;						// board_no, reply_no
	private int board_no;					// 게시글 번호,댓글의 게시글번호
	private String board_title;				// 게시글제목
	private int rcount;						// 게시글,댓글의 누적 신고 count
	private int allcount;					// 회원의 누적 신고 count

	
	public Report() {}

	
	
	public Report(int user_no) {
		super();
		this.user_no = user_no;
	}



	public Report(String report_content, int user_no, int board_no) {
		super();
		this.report_content = report_content;
		this.user_no = user_no;
		this.board_no = board_no;
	}

	public Report(int report_no, String report_content, Date report_date, int user_no) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.user_no = user_no;
	}

	// --------------------
	

	public Report(int report_no, String report_content, Date report_date, int user_no, String nickname,
			String board_title) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.user_no = user_no;
		this.nickname = nickname;
		this.board_title = board_title;
	}



	public Report(int report_no, String report_content, Date report_date, int user_no, String nickname, String subject,
			String board_title) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.user_no = user_no;
		this.nickname = nickname;
		this.subject = subject;
		this.board_title = board_title;
	}



	public Report(int report_no, Date report_date, int user_no, int ruser_no, String rnickname, String subject,
			int br_no, int board_no, int rcount, int allcount) {
		super();
		this.report_no = report_no;
		this.report_date = report_date;
		this.user_no = user_no;
		this.ruser_no = ruser_no;
		this.rnickname = rnickname;
		this.subject = subject;
		this.br_no = br_no;
		this.board_no = board_no;
		this.rcount = rcount;
		this.allcount = allcount;
	}



	public int getReport_no() {
		return report_no;
	}



	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
//---------------------------------------------------
	




	public String getBoard_title() {
		return board_title;
	}



	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}



	public int getRuser_no() {
		return ruser_no;
	}



	public void setRuser_no(int ruser_no) {
		this.ruser_no = ruser_no;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getRnickname() {
		return rnickname;
	}



	public void setRnickname(String rnickname) {
		this.rnickname = rnickname;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public int getBr_no() {
		return br_no;
	}



	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}



	public int getBoard_no() {
		return board_no;
	}



	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}



	public int getRcount() {
		return rcount;
	}



	public void setRcount(int rcount) {
		this.rcount = rcount;
	}



	public int getAllcount() {
		return allcount;
	}



	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}



	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", report_content=" + report_content + ", report_date=" + report_date
				+ ", user_no=" + user_no + ", ruser_no=" + ruser_no + ", nickname=" + nickname + ", rnickname="
				+ rnickname + ", subject=" + subject + ", br_no=" + br_no + ", board_no=" + board_no + ", board_title="
				+ board_title + ", rcount=" + rcount + ", allcount=" + allcount + "]";
	}



	


	

}
