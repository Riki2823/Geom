package services;

import DAO.UserDao;
import model.User;

public class UserService {
    static UserDao userDao = new UserDao();

    public static User getUserById(int id) {
        return userDao.getUserById(id);
    }

    public User newUser(String username) {
        User user = new User(username);
        userDao.insertUser(user);
        return user;
    }

}
