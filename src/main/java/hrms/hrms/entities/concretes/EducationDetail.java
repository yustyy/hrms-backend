package hrms.hrms.entities.concretes;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "education_details")
public class EducationDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@NotNull
	@Column(name = "start_date")
	private Date startDate;
	
	@Column(name = "end_date")
	private Date endDate;
	
	@NotNull
	@Column(name = "is_graduated", columnDefinition = "boolean default false")
	private boolean isGraduated = false;
	
	@NotNull
	@OneToOne(optional = true)
	@JoinColumn(name = "user_id")
	private User user;
	
	@NotNull
	@OneToOne(optional = true)
	@JoinColumn(name = "school_id")
	private School school;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "educationDetails")
	private List<Cv> cv;
	
}
