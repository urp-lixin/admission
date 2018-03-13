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