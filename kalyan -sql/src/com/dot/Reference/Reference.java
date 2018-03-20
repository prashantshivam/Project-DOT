package com.dot.Reference;

public class Reference {
	
 
	  int refid;
	 int tid;
	  String rlink;
	  int mid;
	  String docs;

	   String a;
	    
	
	/**
		 * @param refid
		 * @param tid
		 * @param rlink
		 * @param mid
		 * @param docs
		 */
		public Reference(int refid, int tid, String rlink, int mid,String a) {
			this.refid = refid;
			this.tid = tid;
			this.rlink = rlink;
			this.mid = mid;
			//this.docs = docs;
		this.a=a;
			
			}
		
		
	public int getRefid() {
		return refid;
	}
	public void setRefid(int refid) {
		this.refid = refid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getRlink() {
		return rlink;
	}
	public void setRlink(String rlink) {
		this.rlink = rlink;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getDocs() {
		return docs;
	}
	public void setDocs(String docs) {
		this.docs = docs;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
  
	    
	  
} 
