import java.util.ArrayList;
import java.util.List;

void main() {
    System.out.println("Hello Java!");
    sysout();
}

public void sysout() {
    System.out.println("sysoutメソッド");
    List<Integer> list = new ArrayList<>(List.of(1, 2, 3));
    System.out.println(list);
}
