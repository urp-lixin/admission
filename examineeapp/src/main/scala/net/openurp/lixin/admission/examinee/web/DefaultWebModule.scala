package net.openurp.lixin.admission.examinee.web

import org.beangle.cdi.bind.BindModule
import org.beangle.commons.text.i18n.DefaultTextBundleRegistry
import net.openurp.lixin.admission.examinee.web.action.interview.GradeAction
import net.openurp.lixin.admission.examinee.web.action.interview.ChoiceAction

class DefaultWebModule extends BindModule {

  protected override def binding(): Unit = {
    bind(classOf[GradeAction])
    bind(classOf[ChoiceAction])
    
    val registry = new DefaultTextBundleRegistry
    registry.addDefaults("beangle", "mssu")
    registry.reloadable = true
    bind("mvc.TextBundleRegistry.default", registry)
  }
}