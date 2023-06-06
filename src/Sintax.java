import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java.util.List;

public class Sintax {
    private String fileContent;
    public Sintax(String content) {
        this.fileContent = content;
    }

    public void analyse(){
        CharStream input = CharStreams.fromString(this.fileContent);
        GrammarLexer lexer = new GrammarLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();
        List<Token> tokenList = tokens.getTokens();
        for (Token token : tokenList) {
            int tokenType = token.getType();
            String tokenName = lexer.getVocabulary().getSymbolicName(tokenType);
            String tokenText = token.getText();
            int line = token.getLine();
            int column = token.getCharPositionInLine();
            System.out.println("Token: " + tokenName + " | Texto: " + tokenText + " | Linha: " + line + " | Coluna: " + column);
        }
        GrammarParser parser = new GrammarParser(tokens);
        ParseTree tree = parser.program();
    }
}
