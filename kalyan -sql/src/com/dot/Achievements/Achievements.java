package com.dot.Achievements;


public class Achievements {
	
	 int aid;
	 int mid;
	 String title;
	 String description;
	 String issuer;
	 String date;
	/**
	 * @param aid
	 * @param mid
	 * @param title
	 * @param description
	 * @param issuer
	 * @param date
	 */
	public Achievements(int aid, int mid, String title, String description,
			String issuer, String date) {
		super();
		this.aid = aid;
		this.mid = mid;
		this.title = title;
		this.description = description;
		this.issuer = issuer;
		this.date = date;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	 
	 
	 
}

