package AniverseApp.helpers;
import com.github.javafaker.Faker;

public class DataGenerator {
    private static Faker faker = new Faker();

    public static String getRandomEmail(){
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100) + "@test.com";
        return email;
    }

    public static String getRandomUserName(){
        String user = faker.name().username();
        return user;
    }
    
}
