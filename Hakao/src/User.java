/**
 * Created by Md Shadman Hasan on 03-May-17.
 */
public class User {
    String[] UserID, Name, Profession;
    int age;

    public String[] getUserID() {
        return UserID;
    }

    public void setUserID(String[] userID) {
        UserID = userID;
    }

    public String[] getName() {
        return Name;
    }

    public void setName(String[] name) {
        Name = name;
    }

    public String[] getProfession() {
        return Profession;
    }

    public void setProfession(String[] profession) {
        Profession = profession;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
