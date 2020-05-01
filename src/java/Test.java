
import static Helper.JSONprocessor.objectToJson;
import java.util.ArrayList;
import java.util.List;


class Test {

    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        list.add("A.jpg");
        list.add("B.png");
        String json = objectToJson(list).toString();
        System.out.print(json);
    }
}
