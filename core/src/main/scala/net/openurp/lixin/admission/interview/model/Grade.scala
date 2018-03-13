package net.openurp.lixin.admission.interview.model

import org.beangle.data.model.LongId
import net.openurp.lixin.admission.base.model.Examinee

class Grade extends LongId {

  var examinee: Examinee = _

  var score: Float = _

  var subject: Subject = _
}