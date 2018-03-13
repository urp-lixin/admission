package net.openurp.lixin.admission.admin.web.action.base

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View

import net.openurp.lixin.admission.base.model.{ Batch, Examinee, Major }
import net.openurp.lixin.admission.web.MSSUEntitySupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class ExamineeAction extends MSSUEntitySupport[Examinee] {

  protected override def indexSetting(): Unit = {
    put("majors", entityDao.getAll(classOf[Major]))
    put("batches", entityDao.getAll(classOf[Batch]))
  }

  def checkAjax(@param("id") id: String, @param("idNumber") idNumber: String): View = {
    val builder = OqlBuilder.from(entityType, simpleEntityName)
    Strings.isBlank(id) match {
      case true =>
      case false => builder.where(simpleEntityName + ".id != id", id.toLong)
    }
    builder.where(simpleEntityName + ".idNumber = :idNumber", idNumber)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }
}