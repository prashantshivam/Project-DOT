package com.dot.Skills;

public class Skills {

	  int sid;
	  String Skill;
	  int mid;
	  
	  
	  
	  
	  
	/**
	 * @param sid
	 * @param skill
	 */
	public Skills(int sid, String skill,int mid) {
		super();
		this.sid = sid;
		Skill = skill;
		this.mid=mid;
	}
	
	
	public int getMid() {
		return mid;
	}


	public void setMid(int mid) {
		this.mid = mid;
	}


	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSkill() {
		return Skill;
	}
	public void setSkill(String skill) {
		Skill = skill;
	}
	  
	  
}
