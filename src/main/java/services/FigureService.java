package services;

import DAO.FigureDao;
import model.Figure;
import model.User;

import java.util.List;

public class FigureService {
    static FigureDao figureDao = new FigureDao();

    static int variableNameId = 1;
    public static void newFigure(String title, double cordX, double cordY, double size, User user,  String type, String color){
        if (title.equals("")){
            title = type + variableNameId;
            variableNameId++;
        }

        Figure figure = new Figure(title, cordX, cordY, size, user, type, color);
        figureDao.insertFigure(figure);
    }

    public static Figure getFigureById(int id){
        return figureDao.getFigureById(id);
    }

    public static List<Figure> getFigureById(User user){
        return figureDao.getFiguresByPropietary(user);
    }
}
