package com.dot.Course;





public class Courses {
	
	int cid;
	 int mid;
	  String title;
	   String description;
	   String cdate;
	   
	   //String certificate;
	   
	   
	   
	
	

	  /**
	 * @param cid
	 * @param mid
	 * @param title
	 * @param description
	 * @param cdate
	 * @param certificate
	 */
	public Courses(int cid, int mid, String title, String description,
			String cdate) {
		super();
		this.cid = cid;
		this.mid = mid;
		this.title = title;
		this.description = description;
		this.cdate = cdate;
		//this.certificate = certificate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
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

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	/*public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}*/

	
	   
	   
}
