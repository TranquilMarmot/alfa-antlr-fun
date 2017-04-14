import is.ragan.{ALFALexer, ALFAParser}
import org.antlr.v4.runtime.tree.ParseTreeWalker
import org.antlr.v4.runtime.{ANTLRFileStream, CommonTokenStream}

object AlfaFun extends App {
  val tokens = new ANTLRFileStream("src/main/resources/test.alfa")
  val lexer = new ALFALexer(tokens)
  val stream = new CommonTokenStream(lexer)
  val parser = new ALFAParser(stream)
  val walker = new ParseTreeWalker()
  walker.walk(new ALFAListener, parser.r())
}
