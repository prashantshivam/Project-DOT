package com.dot.Experience;

public class Experience {



	
	  int exid;
	  int mid;
	  String title;
	  String description;
	  String sdate;
	  String edate;
	  String company;
	  String location;
	
	  String Tools;
	  
	  
	   
	    

	/**
	 * @param exid
	 * @param mid
	 * @param title
	 * @param description
	 * @param sdate
	 * @param edate
	 * @param company
	 * @param location
	 * @param tools
	 */
	public Experience(int exid, int mid, String title, String description,
			String sdate, String edate, String company, String location,
			String tools)
	{
		super();
		this.exid = exid;
		this.mid = mid;
		this.title = title;
		this.description = description;
		this.sdate = sdate;
		this.edate = edate;
		this.company = company;
		this.location = location;
		Tools = tools;
	}
	
	

	public int getExid() {
		return exid;
	}

	public void setExid(int exid) {
		this.exid = exid;
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

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTools() {
		return Tools;
	}

	public void setTools(String tools) {
		Tools = tools;
	}
	  
	    
	     
	 
}
