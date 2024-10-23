package com.TachNova.dao;

import com.TachNova.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserDao extends JpaRepository<User, Long> {
    User save(User user);
    Optional<User> findById(Long id);
    User findByLastName(String name);
    List<User> findAll();
    void deleteById(Long id);
}
