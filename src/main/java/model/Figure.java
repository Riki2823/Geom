package model;

import java.util.Date;

public class Figure {

    public enum Form{CIRCLE, SQUARE, TRIANGLE, PENTAGON, STAR7}

    private String title;
    private double cordX;
    private double cordY;
    private double size;
    private User propietari;
    private final Form form;
    private Date creationDate;

    private String color;
    private int id;

    public Figure(String title, double cordX, double cordY, double size, User propietari, String type, String color) {
        this.title = title;
        this.cordX = cordX;
        this.cordY = cordY;
        this.size = size;
        this.propietari = propietari;
        this.form = setForm(type);
        this.color = setColor(color);

    }

    public String getColor() {
        return color;
    }

    public String setColor(String color) {
        return color.toUpperCase().charAt(0) + color.substring(1, color.length()).toLowerCase();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getCordX() {
        return cordX;
    }

    public void setCordX(int cordX) {
        this.cordX = cordX;
    }

    public double getCordY() {
        return cordY;
    }

    public void setCordY(int cordY) {
        this.cordY = cordY;
    }

    public double getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public User getPropietari() {
        return propietari;
    }

    public void setPropietari(User propietari) {
        this.propietari = propietari;
    }

    public Form getForm() {
        return form;
    }

    public Form setForm(String type) {
        if ("circle".equals(type)) {
            return Form.CIRCLE;
        } else if ("square".equals(type)) {
            return Form.SQUARE;
        } else if ("triangle".equals(type)) {
            return Form.TRIANGLE;
        } else if ("pentagon".equals(type)) {
            return Form.PENTAGON;
        } else if ("star7".equals(type)) {
            return Form.STAR7;
        } else {
            System.out.println("Figure not registered");
        }
        return null;
    }

    @Override
    public String toString() {
        return "Figure{" +
                "title='" + title + '\'' +
                ", cordX=" + cordX +
                ", cordY=" + cordY +
                ", size=" + size +
                ", propietari=" + propietari +
                ", form=" + form +
                ", id=" + id +
                '}';
    }
}
