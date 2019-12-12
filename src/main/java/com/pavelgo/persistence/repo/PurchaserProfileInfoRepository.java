package com.pavelgo.persistence.repo;

import com.pavelgo.persistence.model.PurchaserProfileInfo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaserProfileInfoRepository extends CrudRepository<PurchaserProfileInfo, Long> {
}
