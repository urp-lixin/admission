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
package net.openurp.lixin.admission.interview.model

import java.time.Instant

import org.beangle.data.model.LongId

import net.openurp.lixin.admission.base.model.{ Batch, Major }

/**
 * @author zhouqi 2018年2月2日
 *
 */
class InterviewSession extends LongId {

  var batch: Batch = _

  var major: Major = _

  var beginAt: Instant = _

  var endAt: Instant = _

  var maximum: Int = _

  var selected: Int = _
}
