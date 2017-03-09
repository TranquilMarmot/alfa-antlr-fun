package is.ragan.xacml

import cats.data.NonEmptyList

sealed trait XacmlRootObject
case class Policy(
  id: String
) extends XacmlRootObject
case class PolicySet() extends XacmlRootObject

case class Xacml(rootObjects: NonEmptyList[XacmlRootObject])
