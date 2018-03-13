package net.openurp.lixin.admission.admin.web.action.interview

import net.openurp.lixin.admission.base.model.{ Batch, Major }
import net.openurp.lixin.admission.interview.model.Session
import net.openurp.lixin.admission.web.MSSUEntitySupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class SessionAction extends MSSUEntitySupport[Session] {

  protected override def indexSetting(): Unit = {
    put("majors", entityDao.getAll(classOf[Major]))
    put("batches", entityDao.getAll(classOf[Batch]))
  }
  
}