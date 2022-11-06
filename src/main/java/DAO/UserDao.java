package DAO;

import model.User;

import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private static int id = 0;
    private static List<User> usuarios = new ArrayList<User>();

    public int insertUser(User user){
        user.setId(id);
        usuarios.add(user);
        int retunrID = id;
        id++;
        return retunrID;
    }


    public User getUserById(int id) {
        User user = null;
        for(User u : usuarios){
            if (u.getId() == id){
                user = u;
            }
        }
        return user;
    }
}
