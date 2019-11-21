package hu.aensys.tutorial.java.jsp.bean;

import hu.aensys.tutorial.java.jsp.model.User;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UserManager {

    @Getter
    private final List<User> users = new ArrayList<>();

    private Long lastId = 1L;

    public void add(String username, String fullName) {
        User user = new User(lastId++, username, fullName);
        users.add(user);
    }

    public void update(Long id, String username, String fullName) {
        User user = findById(id);
        user.setUsername(username);
        user.setFullName(fullName);
    }

    public User findById(Long id) {
        return users.stream()
                .filter(user -> Objects.equals(user.getId(), id))
                .findFirst()
                .orElse(null);
    }

    public void delete(Long id) {
        users.removeIf(user -> Objects.equals(user.getId(), id));
    }

}
