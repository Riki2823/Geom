package services;

import DAO.UserDAo;
import model.User;

public class UserService {
    static UserDAo userDao = new UserDAo();

    public static User getUserById(int id) {
        User user = userDao.getUserById(id);
        return user;
    }

    public User newUser(String username) {
        User user = new User(username);
        int id = userDao.insertUser(user);
        return user;
    }
}
