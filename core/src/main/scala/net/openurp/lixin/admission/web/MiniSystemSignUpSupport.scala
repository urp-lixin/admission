package net.openurp.lixin.admission.web

import org.beangle.data.dao.EntityDao
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View

abstract class MSSUSupport extends ActionSupport {

  var entityDao: EntityDao = _

  final def index(): View = {
    indexSetting
    forward()
  }

  protected def indexSetting(): Unit = {
  }
}