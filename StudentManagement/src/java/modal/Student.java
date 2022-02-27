
package modal;

public class Student {
    private int id;
    private String name;
    private int age;
    private double mark;
    private int classID;

    public Student() {
    }

    
    public Student(int id, String name, int age, double mark, int classID) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.mark = mark;
        this.classID = classID;
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

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", age=" + age + ", mark=" + mark + ", classID=" + classID + '}';
    }
    
    
}
