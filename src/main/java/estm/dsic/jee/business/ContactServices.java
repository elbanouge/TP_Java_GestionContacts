package estm.dsic.jee.business;

import java.sql.Connection;
import java.util.ArrayList;
import estm.dsic.jee.dal.Contact;
import estm.dsic.jee.dal.ContactDao;

public class ContactServices implements IContactServices {

	private ContactDao contactDao;

	public ContactServices() {
		Connection connection = null;
		contactDao = new ContactDao(connection);
	}

	@Override
	public boolean add(Contact contact) {
		// TODO Auto-generated method stub
		return contactDao.addCon(contact);
	}

	@Override
	public ArrayList<Contact> getAll(String req) {
		// TODO Auto-generated method stub
		return contactDao.getContacts(req);
	}

	@Override
	public Contact getContactByID(int id) {
		// TODO Auto-generated method stub
		return contactDao.getContactByID(id);
	}

	@Override
	public boolean edit(Contact contact) {
		// TODO Auto-generated method stub
		return contactDao.modCon(contact);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return contactDao.delCon(id);
	}
}
