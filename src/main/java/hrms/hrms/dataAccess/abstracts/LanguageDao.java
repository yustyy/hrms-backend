package hrms.hrms.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import hrms.hrms.entities.concretes.Language;

public interface LanguageDao extends JpaRepository<Language, Integer> {

}
