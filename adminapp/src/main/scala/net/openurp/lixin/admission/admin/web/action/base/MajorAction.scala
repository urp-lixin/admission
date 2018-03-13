package net.openurp.lixin.admission.admin.web.action.base

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View

import net.openurp.lixin.admission.web.MSSUEntitySupport
import net.openurp.lixin.admission.base.model.Major

class MajorAction extends MSSUEntitySupport[Major] {

  def checkAjax(@param("id") id: String, @param("code") code: String): View = {
    val builder = OqlBuilder.from(entityName, simpleEntityName)
    Strings.isBlank(id) match {
      case true =>
      case false => builder.where(simpleEntityName + ".id != :id", id.toLong)
    }
    builder.where(simpleEntityName + ".code = :code", code)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }
}