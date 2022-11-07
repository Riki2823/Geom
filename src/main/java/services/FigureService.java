package services;

import DAO.FigureDao;
import model.Figure;
import model.User;

public class FigureService {
    static FigureDao figureDao = new FigureDao();

    static int variableNameId = 1;
    public static void newFigure(String title, int cordX, int cordY, int size, User user, int id, String type){
        if (title == null){
            title = type + variableNameId;
            variableNameId++;
        }

        Figure figure = new Figure(title, cordX, cordY, size, user, id);
        figureDao.insertFigure(figure);
    }

    public static Figure getFigureById(int id){
        return figureDao.getFigureById(id);
    }

    public static Figure getFigureById(User user){
        return figureDao.getFigureByPropietary(user);
    }
}
