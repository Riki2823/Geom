package services;

import DAO.UserDao;
import model.User;

public class UserService {
    static UserDao userDao = new UserDao();

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
