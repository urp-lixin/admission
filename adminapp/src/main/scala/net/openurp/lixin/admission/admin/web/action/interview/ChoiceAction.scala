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
package net.openurp.lixin.admission.admin.web.action.interview

import net.openurp.lixin.admission.base.model.{ Batch, Major }
import net.openurp.lixin.admission.interview.model.InterviewChoice
import net.openurp.lixin.admission.web.MSSUEntitySupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class ChoiceAction extends MSSUEntitySupport[InterviewChoice] {

  protected override def indexSetting(): Unit = {
    put("majors", entityDao.getAll(classOf[Major]))
    put("batches", entityDao.getAll(classOf[Batch]))
  }

}
