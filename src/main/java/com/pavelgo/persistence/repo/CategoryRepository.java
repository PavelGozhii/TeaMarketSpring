package com.pavelgo.persistence.repo;

import com.pavelgo.persistence.model.Category;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {

}
