package model;

public class Figure {

    public enum Form{CIRCLE, SQUARE, TRIANGLE, PENTAGON, STAR7}

    private String title;
    private int cordX;
    private int cordY;
    private int size;
    private User propietari;
    private Form form;

    private int id;

    public Figure(String title, int cordX, int cordY, int size, User propietari, int id) {
        this.title = title;
        this.cordX = cordX;
        this.cordY = cordY;
        this.size = size;
        this.propietari = propietari;
        this.id = id;
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

    public int getCordX() {
        return cordX;
    }

    public void setCordX(int cordX) {
        this.cordX = cordX;
    }

    public int getCordY() {
        return cordY;
    }

    public void setCordY(int cordY) {
        this.cordY = cordY;
    }

    public int getSize() {
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

    public void setForm(Form form) {
        this.form = form;
    }
}
