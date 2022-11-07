package DAO;

import model.Figure;
import model.User;

import java.util.ArrayList;
import java.util.List;

public class FigureDao {
    private static int id = 0;
    private static final List<Figure> figures = new ArrayList<Figure>();

    public void insertFigure(Figure figure){
        figure.setId(id);
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

    public List<Figure> getFiguresByPropietary(User user){
        List<Figure> figuresUser = new ArrayList<Figure>();
        for(Figure f: figures){
            if (f.getPropietari() == user){
                figuresUser.add(f);
            }
        }
        return figuresUser;
    }


}
