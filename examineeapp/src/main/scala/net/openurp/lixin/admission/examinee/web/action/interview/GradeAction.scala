/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2005, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.openurp.lixin.admission.examinee.web.action.interview
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.action.ServletSupport
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View

import net.openurp.lixin.admission.base.model.Examinee
import net.openurp.lixin.admission.grade.model.SubjectGrade
import net.openurp.lixin.admission.web.MSSUSupport
import net.openurp.lixin.admission.interview.model.InterviewGrade

/**
 * @author zhouqi 2018年2月2日
 */
class GradeAction extends MSSUSupport with ServletSupport {

  private def getExaminee(code: Option[String], name: Option[String],
    idNumber: Option[String]): Option[Examinee] = {
    if (code == None || name == None || idNumber == None) return None

    val builder1 = OqlBuilder.from(classOf[Examinee], "examinee")
    builder1.where("examinee.code = :code", code.get)
      .where("examinee.name = :name", name.get)
      .where("examinee.idNumber = :idNumber", idNumber.get)
    val examinees = entityDao.search(builder1)
    if (examinees.isEmpty) None else Some(examinees.head)
  }

  @mapping(value = "search", view = "list")
  def search(): View = {
    val examinees = getExaminee(get("code"), get("name"), get("idNumber"))
    if (examinees.isEmpty) {
      forward("error")
    } else {
      val examinee = examinees.head
      val examGrades = entityDao.search(
        OqlBuilder.from(classOf[InterviewGrade], "eg").where("eg.examinee=:me", examinee))

      val subjectGrades = entityDao.search(
        OqlBuilder.from(classOf[SubjectGrade], "sg").where("sg.examinee=:me", examinee))

      put("examinee", examinee)
      put("subjectGrades", subjectGrades)
      if (!examGrades.isEmpty)
        put("examGrade", examGrades.head);
      forward("info")
    }
  }

}
