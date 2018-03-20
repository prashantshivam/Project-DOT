package com.dot.Education;

public class Education {

	
	int eid;
	int mid;
	 String degree;
	 float grade;
	 String institute;
	 String startdate;
	 String enddate;
	 String stream;
	 /**
		 * @param eid
		 * @param mid
		 * @param degree
		 * @param grade
		 * @param institute
		 * @param startdate
		 * @param enddate
		 * @param stream
		 */
		public Education(int eid, int mid, String degree, float grade,
				String institute, String startdate, String enddate, String stream) {
			super();
			this.eid = eid;
			this.mid = mid;
			this.degree = degree;
			this.grade = grade;
			this.institute = institute;
			this.startdate = startdate;
			this.enddate = enddate;
			this.stream = stream;
		}
		
		
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
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
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	 
}
