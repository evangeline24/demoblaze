package demoblaze;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class DemoblazeAPITest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:demoblaze")
                .outputCucumberJson(true)
                .reportDir("target/karate-reports")
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}