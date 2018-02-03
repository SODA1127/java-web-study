package guest.test;

import java.util.ArrayList;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;

public class GuestDaoTestMain {
	public static void main(String[] args)throws Exception {
		GuestDao guestDao=new GuestDao();
		System.out.println("---------selectAll---------");
		ArrayList<Guest> guestList=guestDao.selectAll();
		for (int i = 0; i < guestList.size(); i++) {
			System.out.println(guestList.get(i).guest_no);
		}
		System.out.println("---------selectByNo---------");
		Guest guest=guestDao.selectByNo(3);
		System.out.println(guest.guest_no);
		System.out.println("---------insertGuest---------");
		Guest insertGuest=new Guest(-999, "guest_name", null, "guest_email", "guest_homepage", "guest_title", "guest_content");
		boolean insertSuccess=guestDao.insertGuest(insertGuest);
		System.out.println(insertSuccess);
	}

}








