package net.openurp.lixin.admission.interview.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Updated

import net.openurp.lixin.admission.base.model.Examinee

/**
 * 面试选择
 * @author zhouqi 2018年2月2日
 */
class Choice extends LongId with Updated {

  var session: Session = _

  var examinee: Examinee = _
}