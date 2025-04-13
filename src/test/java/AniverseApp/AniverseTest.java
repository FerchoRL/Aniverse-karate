package AniverseApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class AniverseTest {

    @Test
    void testParallel() {
        //Path where test cases are located
        Results results = Runner.path("classpath:AniverseApp").karateEnv("qa")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    //Otra forma de ejecutar
    // @Karate.Test
    // Karate testTags() {
    //     return Karate.run().tags("@login").relativeTo(getClass());
    // }
    //En el run puedo ponerle: "feature/RegisterUser"
    //command to run: mvn test -Dtest=SampleTest#testTags

}
