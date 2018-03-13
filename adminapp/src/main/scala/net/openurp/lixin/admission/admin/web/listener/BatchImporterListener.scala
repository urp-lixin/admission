package net.openurp.lixin.admission.admin.web.listener

import org.beangle.data.dao.EntityDao
import org.beangle.data.transfer.AbstractTransferListener
import org.beangle.data.transfer.TransferResult


/**
 * @author zhouqi 2018年1月31日
 *
 */
class BatchImporterListener(entityDao: EntityDao) extends AbstractTransferListener {
  
  override def onItemStart(tr: TransferResult): Unit = {
    val name = transfer.curData("name")
    println(name)
  }
}