import com.thoughtworks.gauge.Step;

public class StepImplementation {

    public StepImplementation() {
        super();
    }

    @Step("Addition <number1> and <number2>")
    public void AdditionTwoNumber(int number1, int number2) {
        int total=number1+number2;
        System.out.println("Total :" + total);
    }

}
