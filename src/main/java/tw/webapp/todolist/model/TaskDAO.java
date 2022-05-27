package tw.webapp.todolist.model;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
@Transactional
public class TaskDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Long getUndoTaskCount(){
		Session session = sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("select count(*) from Task where taskStatus =: status", Long.class);
		query.setParameter("status", TaskStatus.Undo);
		return query.getSingleResult();
	}
	
	public List<Task> findAllByStatus(TaskStatus taskStatus){
		Session session = sessionFactory.getCurrentSession();
		StringBuilder sqlBuilder = new StringBuilder("from Task where taskStatus =: status");
		if (taskStatus.equals(TaskStatus.Finished)) {
			sqlBuilder.append(" order by finishedTime desc");
		}
		Query<Task> query = session.createQuery(sqlBuilder.toString(), Task.class);
		query.setParameter("status", taskStatus);
		return query.list();
	}
	
	public boolean insert(Task task) {
		Session session = sessionFactory.getCurrentSession();
		if (task.getContent() != null) {
			session.save(task);
			return true;
		}return false;
	}
	
	public void updateStatus(int id) {
		Session session = sessionFactory.getCurrentSession();
		Task task = session.get(Task.class, id);
		if (task != null) {
			task.setFinishedTime(new Date());
			task.setTaskStatus(TaskStatus.Finished);
			session.update(task);
		}
	}
	
	public void deleteTask(int id) {
		Session session = sessionFactory.getCurrentSession();
		Task task = session.get(Task.class, id);
		if (task != null) {
			session.delete(task);
		}
	}
	
}
