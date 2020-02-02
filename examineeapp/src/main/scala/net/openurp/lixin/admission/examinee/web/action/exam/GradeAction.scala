/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2014, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.openurp.lixin.admission.examinee.web.action.exam

import java.time.Instant

import net.openurp.lixin.admission.base.model.{Batch, Examinee}
import net.openurp.lixin.admission.grade.model.{ExamGrade, SubjectGrade}
import net.openurp.lixin.admission.web.MSSUSupport
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.action.ServletSupport
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View

/**
  * @author zhouqi 2018年2月2日
  */
class GradeAction extends MSSUSupport with ServletSupport {

  protected override def indexSetting(): Unit = {
    val builder = OqlBuilder.from(classOf[Batch], "batch")
    builder.where("batch.endAt >= :now", Instant.now)
    put("batches", entityDao.search(builder))
  }

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
      put("examinee", examinee)

      val now = Instant.now()
      if (now.isBefore(examinee.batch.beginAt) || now.isAfter(examinee.batch.endAt.get)) {
        forward("error")
      } else {
        val examGrades = entityDao.search(
          OqlBuilder.from(classOf[ExamGrade], "eg")
            .where("eg.examinee=:me and eg.published=true", examinee))

        val subjectGrades = entityDao.search(
          OqlBuilder.from(classOf[SubjectGrade], "sg").where("sg.examinee=:me and sg.published=true", examinee))

        put("subjectGrades", subjectGrades)
        if (!examGrades.isEmpty)
          put("examGrade", examGrades.head);
        forward("info")
      }
    }
  }

}
