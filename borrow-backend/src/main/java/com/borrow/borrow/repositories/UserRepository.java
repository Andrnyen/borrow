package com.borrow.borrow.repositories;

import com.borrow.borrow.models.User;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends MongoRepository<User, ObjectId> {

    @Query("{lastName:'?0'}")
    List<User> findByLastName(String name);

}
