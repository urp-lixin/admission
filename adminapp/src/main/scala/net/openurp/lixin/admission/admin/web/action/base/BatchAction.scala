package net.openurp.lixin.admission.admin.web.action.base

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.data.transfer.TransferListener
import org.beangle.data.transfer.listener.ForeignerListener
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.{ Stream, View }
import net.openurp.lixin.admission.admin.web.listener.BatchImporterListener
import net.openurp.lixin.admission.web.MSSUEntitySupport
import net.openurp.lixin.admission.web.ImportDataSupport
import net.openurp.lixin.admission.base.model.Batch

class BatchAction extends MSSUEntitySupport[Batch] with ImportDataSupport[Batch] {

  def checkAjax(@param("id") id: String, @param("name") name: String): View = {
    val builder = OqlBuilder.from(entityName, simpleEntityName)
    Strings.isBlank(id) match {
      case true  =>
      case false => builder.where(simpleEntityName + ".id != :id", id.toLong)
    }
    builder.where(simpleEntityName + ".name = :name", name.trim)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }
  
  def importTemplate(): View = {
    Stream(getClass.getResourceAsStream("/template/excel/batchImportTemplate.xls"), "application/vnd.ms-excel", "批次导入模板.xls")
  }
  
  protected override def importerListeners(): List[_ <: TransferListener] = {
    List(new BatchImporterListener(entityDao))
  }
}