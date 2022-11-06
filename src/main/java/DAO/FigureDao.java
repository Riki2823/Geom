package DAO;

import model.Figure;
import model.User;

import java.util.ArrayList;
import java.util.List;

public class FigureDao {
    private static int id = 0;
    private static List<Figure> figures = new ArrayList<Figure>();

    public void insertFigure(Figure figure, User user){
        figure.setId(id);
        figure.setPropietari(user);
        figures.add(figure);
        id++;
    }

    public Figure getFigureById(int id){
        Figure figure = null;
        for(Figure f: figures){
            if (f.getId() == id){
                figure = f;
            }
        }
        return figure;
    }

    public Figure getFigureByPropietary(User user){
        Figure figure = null;
        for (Figure f: figures){
            if (f.getPropietari() == user){
                figure = f;
            }
        }
        return figure;
    }
}
