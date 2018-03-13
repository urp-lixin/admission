package net.openurp.lixin.admission.base.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Coded, Named }

/**
 * @author zhouqi 2018年2月2日
 *
 */
class Examinee extends LongId with Coded with Named {

  /** 身份证号 */
  var idNumber: String = _

  var major: Major = _

  var batch: Batch = _
}