package com.pavelgo.persistence.repo;

import com.pavelgo.persistence.model.Order;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Order, Long> {
}
