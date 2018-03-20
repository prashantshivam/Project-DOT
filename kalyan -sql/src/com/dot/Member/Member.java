package com.dot.Member;

public class Member {
	
	 int mid;
	 String fname;
	 String lname;
	 int mobileno;
	 String dob;
	
	String facebook;
	 String linkedin;
	 String twitter;
	 String website;
	 
	 
	/**
	 * @param mid
	 * @param fname
	 * @param lname
	 * @param mobileno
	 * @param dob
	 * @param facebook
	 * @param linkedin
	 * @param twitter
	 * @param website
	 */
	 
	public Member(int mid, String fname, String lname, int mobileno,String dob, String facebook, 
			String linkedin, String twitter,String website) {
		super();
		this.mid = mid;
		this.fname = fname;
		this.lname = lname;
		this.mobileno = mobileno;
		this.dob = dob;
		this.facebook = facebook;
		this.linkedin = linkedin;
		this.twitter = twitter;
		this.website = website;
	}
	
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getMobileno() {
		return mobileno;
	}
	public void setMobileno(int mobileno) {
		this.mobileno = mobileno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getLinkedin() {
		return linkedin;
	}
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	 
	 
	 
	 
}
