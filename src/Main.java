import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println("Starting...");

        String fileName = "test.pas";
        String content = new String(Files.readAllBytes(Paths.get(fileName)));
        System.out.println(content.toString());
        Sintax syntaxAnalise = new Sintax(content);
        syntaxAnalise.analyse();
    }
}