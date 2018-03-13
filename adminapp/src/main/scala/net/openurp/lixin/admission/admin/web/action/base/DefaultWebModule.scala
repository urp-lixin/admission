package net.openurp.lixin.admission.admin.web.action.base

import org.beangle.cdi.bind.BindModule

class DefaultWebModule extends BindModule {

  override def binding(): Unit = {
    bind(classOf[IndexAction])
    bind(classOf[BatchAction])
    bind(classOf[MajorAction])
    bind(classOf[ExamineeAction])
  }
}