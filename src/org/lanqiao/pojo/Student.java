package org.lanqiao.pojo;

public class Student {
    private String sname;
    private Integer sage;
    private School school;

    public Student(String sname, Integer sage, School school) {
        this.sname = sname;
        this.sage = sage;
        this.school = school;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Integer getSage() {
        return sage;
    }

    public void setSage(Integer sage) {
        this.sage = sage;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

}
