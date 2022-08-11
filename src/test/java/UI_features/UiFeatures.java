package UI_features;
import com.intuit.karate.junit5.Karate;

public class UiFeatures {
  @Karate.Test
  Karate testAll() {
    return Karate.run().relativeTo(getClass());
  }
  @Karate.Test
  Karate testUITags(){
    return Karate.run().tags("@TestUI").relativeTo(getClass());
  }

  @Karate.Test
  Karate testReg(){
    return Karate.run().tags("@TestReg").relativeTo(getClass());
  }
}
