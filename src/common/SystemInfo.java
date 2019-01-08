/**
 * 
 */
package common;

/**
 * @author Rico Sancho Abarro
 * @since Aug 31, 2016
 */

public class SystemInfo {
	
	private static DbWrapper db;
	
	static{
		db = new DbWrapper();
	}
	
	public static DbWrapper getDb(){
		return db;
	}

}
