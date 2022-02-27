package modal;

public class Student {

    private int id;
    private String name;
    private int age;
    private double mark;
    private int classID;
    private String className;

    public Student() {
    }

    public Student(int id, String name, int age, double mark, int classID, String className) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.mark = mark;
        this.classID = classID;
        this.className = className;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

}
