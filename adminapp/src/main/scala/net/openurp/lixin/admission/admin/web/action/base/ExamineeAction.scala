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
package net.openurp.lixin.admission.admin.web.action.base

import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View

import net.openurp.lixin.admission.base.model.{ Batch, Examinee, Major }
import net.openurp.lixin.admission.web.MSSUEntitySupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class ExamineeAction extends MSSUEntitySupport[Examinee] {

  protected override def indexSetting(): Unit = {
    put("majors", entityDao.getAll(classOf[Major]))
    put("batches", entityDao.getAll(classOf[Batch]))
  }

  def checkAjax(@param("id") id: String, @param("idNumber") idNumber: String): View = {
    val builder = OqlBuilder.from(entityType, simpleEntityName)
    Strings.isBlank(id) match {
      case true =>
      case false => builder.where(simpleEntityName + ".id != id", id.toLong)
    }
    builder.where(simpleEntityName + ".idNumber = :idNumber", idNumber)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }
}
