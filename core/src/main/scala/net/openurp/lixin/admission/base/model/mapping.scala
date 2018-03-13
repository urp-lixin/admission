package net.openurp.lixin.admission.base.model

import org.beangle.data.orm.MappingModule

/**
 * @author zhouqi 2018年2月2日
 *
 */
class DefaultMapping extends MappingModule {

  override def binding(): Unit = {
    defaultIdGenerator("auto_increment")

    bind[Batch]

    bind[Examinee]

    bind[ExamGrade]

    bind[Major]
  }
}