package net.openurp.lixin.admission.admin.web.action.interview

import net.openurp.lixin.admission.base.model.{ Batch, Major }
import net.openurp.lixin.admission.interview.model.Choice
import net.openurp.lixin.admission.web.MSSUEntitySupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class ChoiceAction extends MSSUEntitySupport[Choice] {

  protected override def indexSetting(): Unit = {
    put("majors", entityDao.getAll(classOf[Major]))
    put("batches", entityDao.getAll(classOf[Batch]))
  }
}