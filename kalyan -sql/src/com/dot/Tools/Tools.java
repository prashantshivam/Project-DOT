package com.dot.Tools;

public class Tools {
	
	  int tid ;
	   String tname;
	   int pid;
	   
	   
		/**
	 * @param tid
	 * @param tname
	 * @param pid
	 */
	public Tools(int tid, String tname, int pid) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.pid = pid;
	}
		public int getTid() {
			return tid;
		}
		public void setTid(int tid) {
			this.tid = tid;
		}
		public String getTname() {
			return tname;
		}
		public void setTname(String tname) {
			this.tname = tname;
		}
		public int getPid() {
			return pid;
		}
		public void setPid(int pid) {
			this.pid = pid;
		}
		   
	   

}
