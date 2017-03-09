name := "alfa-antlr-fun"

version := "1.0"

scalaVersion := "2.11.8"

libraryDependencies += "org.typelevel" %% "cats" % "0.9.0"

antlr4Settings

antlr4GenListener in Antlr4 := true

antlr4GenVisitor in Antlr4 := true

antlr4Dependency in Antlr4 := "org.antlr" % "antlr4" % "4.5"

antlr4PackageName in Antlr4 := Some("is.ragan")
