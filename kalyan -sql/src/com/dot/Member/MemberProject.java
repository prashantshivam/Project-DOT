package com.dot.Member;

public class MemberProject {
    
	  int mid;
	   int pid;
	   int isadmin;
	   String pname;
	   int pstatus;
	   String fname;
	   String lname;
	   
	/**
	 * @param mid
	 * @param pid
	 * @param isadmin
	 * @param pname
	 * @param pstatus
	 */
	public MemberProject(int mid, int pid, int isadmin, String pname,
			int pstatus) {
		super();
		this.mid = mid;
		this.pid = pid;
		this.isadmin = isadmin;
		this.pname = pname;
		this.pstatus = pstatus;
	}
	
	/**
	 * @param mid
	 * @param pid
	 * @param isadmin
	 * @param pname
	 * @param pstatus
	 * @param fname
	 * @param lname
	 */
	public MemberProject(int mid,  String fname, String lname) {
		this.mid = mid;
		this.fname = fname;
		this.lname = lname;
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

	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPstatus() {
		return pstatus;
	}
	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
	}
	   
	   
	    
	

}
