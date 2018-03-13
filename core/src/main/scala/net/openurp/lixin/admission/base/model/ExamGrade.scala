package net.openurp.lixin.admission.base.model

import org.beangle.data.model.LongId
import org.beangle.commons.collection.Collections
import scala.collection.mutable.Buffer

class ExamGrade extends LongId {

  var examinee: Examinee = _

  var totalScore: Float = _

  var interviewScore: Float = _

  var cultureScore: Float = _

  var rank: Int = _

}