package net.openurp.lixin.admission.admin.web.action.interview

import org.beangle.cdi.bind.BindModule

class DefaultWebModule extends BindModule {

  protected override def binding(): Unit = {
    bind(classOf[IndexAction])

    bind(classOf[SettingAction], classOf[SessionAction],
      classOf[ChoiceAction])
  }
}