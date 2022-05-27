package tw.webapp.todolist.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TaskService {
	
	@Autowired
	private TaskDAO taskDAO;
	
	public Long getUndoTaskCount(){
		return taskDAO.getUndoTaskCount();
	}
	
	public List<Task> findAllByStatus(TaskStatus status){
		return taskDAO.findAllByStatus(status);
	}
	
	public boolean insert(Task task) {
		return taskDAO.insert(task);
	}
	
	public void updateStatus(int id) {
		taskDAO.updateStatus(id);
	}
	
	public void deleteTask(int id) {
		taskDAO.deleteTask(id);
	}
}
