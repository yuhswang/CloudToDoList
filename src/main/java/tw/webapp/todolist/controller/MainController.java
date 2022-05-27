package tw.webapp.todolist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.webapp.todolist.model.Task;
import tw.webapp.todolist.model.TaskService;
import tw.webapp.todolist.model.TaskStatus;

@Controller
@RequestMapping(path = "/myTasks")
public class MainController {
	
	@Autowired
	private TaskService taskService;
	
	@GetMapping
	public String mainPageEntry(Model model) {
		model.addAttribute("undoList", taskService.findAllByStatus(TaskStatus.Undo));
		model.addAttribute("finishedList", taskService.findAllByStatus(TaskStatus.Finished));
		model.addAttribute("taskNum", taskService.getUndoTaskCount());
		return "main";
	}
	
	@GetMapping("/finish/{id}")
	public String finishTask(@PathVariable("id") int id) {
		taskService.updateStatus(id);
		return "redirect:/myTasks";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteTask(@PathVariable("id") int id) {
		taskService.deleteTask(id);
		return "redirect:/myTasks";
	}
	
	@PostMapping("/insertTask")
	@ResponseBody
	public Task insertTask(@RequestBody Task task) {
        task.setTaskStatus(TaskStatus.Undo);
		if (taskService.insert(task)) {
			return task;
		}else {
			return null;
		}
	}
}
