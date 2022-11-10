package services;

import DAO.FigureDao;
import model.Figure;
import model.User;

import java.util.List;

public class FigureService {
    static FigureDao figureDao = new FigureDao();

    public static void newFigure(String title, double cordX, double cordY, double size, User user,  String type, String color){
        if (title.equals("")){
            title = type + (int)((Math.random() * 100 + 1) + 1);
        }

        Figure figure = new Figure(title, cordX, cordY, size, user, type, color);
        figureDao.insertFigure(figure);
    }

    public static Figure getFigureById(int id){
        return figureDao.getFigureById(id);
    }

    public static List<Figure> getFiguresByPropietary(User user){
        return figureDao.getFiguresByPropietary(user);
    }

    public static List<Figure> getAllFigures(){
        return figureDao.getAllFigures();
    }

    public static void removeFigure(int id){
        FigureDao.removeFigure(id);

    }
}
