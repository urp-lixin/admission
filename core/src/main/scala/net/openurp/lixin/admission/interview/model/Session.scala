package net.openurp.lixin.admission.interview.model

import java.time.Instant
import org.beangle.data.model.LongId
import net.openurp.lixin.admission.base.model.Major
import net.openurp.lixin.admission.base.model.Batch

/**
 * @author zhouqi 2018年2月2日
 *
 */
class Session extends LongId {

  var batch: Batch = _

  var major: Major = _

  var beginAt: Instant = _

  var endAt: Instant = _

  var maximum: Int = _

  var selected: Int = _
}