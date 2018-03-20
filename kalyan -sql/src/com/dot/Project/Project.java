package com.dot.Project;

public class Project {
	int pid;
	String pname;
	int pstatus;
	String summary;
	String startdate;
	String enddate;
	String documentation;

	/**
	 * @param pid
	 * @param pname
	 * @param pstatus
	 * @param summary
	 * @param startdate
	 * @param enddate
	 * @param documentation
	 */
	public Project(int pid, String pname, int pstatus, String summary,
			String startdate, String enddate) {
		this.pid = pid;
		this.pname = pname;
		this.pstatus = pstatus;
		this.summary = summary;
		this.startdate = startdate;
		this.enddate = enddate;
		
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	

}
