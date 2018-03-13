package net.openurp.lixin.admission.interview.model

import org.beangle.data.orm.MappingModule

/**
 * @author zhouqi 2018年2月2日
 *
 */
class DefaultMapping extends MappingModule {

  override def binding(): Unit = {
    defaultIdGenerator("auto_increment")

    bind[Session]

    bind[Choice]

    bind[Grade]

    bind[Subject]

    bind[Setting]
  }
}