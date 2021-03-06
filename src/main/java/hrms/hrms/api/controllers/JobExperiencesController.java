package hrms.hrms.api.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hrms.hrms.business.abstracts.JobExperienceService;
import hrms.hrms.core.utilities.results.DataResult;
import hrms.hrms.core.utilities.results.Result;
import hrms.hrms.entities.concretes.JobExperience;

@RestController
@RequestMapping("/api/jobexperiences")
public class JobExperiencesController {
	
	private JobExperienceService jobExperienceService;

	@Autowired
	public JobExperiencesController(JobExperienceService jobExperienceService) {
		super();
		this.jobExperienceService = jobExperienceService;
	}
	
	@PostMapping("/add")
	public Result add(@Valid @RequestBody JobExperience jobExperience) {
		return jobExperienceService.add(jobExperience);
	}
	
	@GetMapping("/getbyid")
	public DataResult<JobExperience> getById(@RequestParam int id){
		return jobExperienceService.getById(id);
	}
	
	@GetMapping("/getall")
	public DataResult<List<JobExperience>> getAll(){
		return jobExperienceService.getAll();
	}

}
