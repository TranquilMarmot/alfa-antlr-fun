import is.ragan.ALFABaseListener
import is.ragan.ALFAParser

class ALFAListener extends ALFABaseListener {
  override def enterR(ctx: ALFAParser.RContext): Unit = {
    println(s"enterR ${ctx.getText}")
  }

  override def exitR(ctx: ALFAParser.RContext): Unit = {
    println(s"exitR")
  }

  override def enterPolicyset(ctx: ALFAParser.PolicysetContext): Unit = {
    println(s"enterPolicySet ${ctx.getText}")
  }

  override def exitPolicyset(ctx: ALFAParser.PolicysetContext): Unit = {
    println(s"exitPolicySet")
  }
}
