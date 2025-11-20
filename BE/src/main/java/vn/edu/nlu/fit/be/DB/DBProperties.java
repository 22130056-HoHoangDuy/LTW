package vn.edu.nlu.fit.be.DB;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties prod= new Properties();
    static{
        try{
            prod.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        }catch(IOException e){
            throw new RuntimeException(e);
        }
    }
    public static String host(){
        return prod.get("db.host").toString();
    }

    public static int port(){
        try{
            return Integer.parseInt(prod.get("db.port").toString());
        }catch(NumberFormatException e){
            return 3306;
        }

    }
    public static String username(){
        return prod.get("db.user").toString();
    }
    public static String password(){
        return prod.get("db.password").toString();
    }
    public static String dbname(){
        return prod.get("db.dbname").toString();
    }
    public static String option(){
        return prod.get("db.option").toString();
    }
    public static void main(String[] args){
        System.out.println(DBProperties.dbname());
    }


}
