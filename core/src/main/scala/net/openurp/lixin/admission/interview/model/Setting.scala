package net.openurp.lixin.admission.interview.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Named
import org.beangle.data.model.pojo.TemporalAt
import net.openurp.lixin.admission.base.model.Batch

class Setting extends LongId with Named with TemporalAt {

  var batch: Batch = _
}