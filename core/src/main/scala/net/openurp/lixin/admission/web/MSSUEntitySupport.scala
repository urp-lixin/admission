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
package net.openurp.lixin.admission.web

import org.beangle.commons.collection.Order
import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.data.model.Entity
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.action.RestfulAction

/**
 * @author zhouqi 2018年2月2日
 *
 * @param <T>
 */
abstract class MSSUEntitySupport[T <: Entity[_]] extends RestfulAction[T] {

  override def getQueryBuilder(): OqlBuilder[T] = {
    val builder: OqlBuilder[T] = OqlBuilder.from(entityName, simpleEntityName)
    populateConditions(builder)
    extraCondition(builder)
    var orderBy: String = get(Order.OrderStr).orNull
    if (null == orderBy) {
      orderBy = ""
    }
    if (Strings.isNotBlank(orderBy)) {
      orderBy += ","
    }
    orderBy += simpleEntityName + ".id"
    builder.orderBy(orderBy).limit(getPageLimit)
  }

  protected def extraCondition(builder: OqlBuilder[T]): Unit = {}

  protected override def editSetting(entity: T): Unit = {
    indexSetting
  }

  @mapping(method = "delete")
  override def remove(): View = {
    val idclass = entityDao.domain.getEntity(entityName).get.id.clazz
    val entities = getId(simpleEntityName + ".id") match {
      case Some(entityId) => List(getModel[T](entityName, entityId))
      case None           => getModels[T](entityName, ids(simpleEntityName, idclass))
    }
    removeAndRedirect(entities)
  }
}
