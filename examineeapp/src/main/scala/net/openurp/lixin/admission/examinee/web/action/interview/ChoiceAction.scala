package net.openurp.lixin.admission.examinee.web.action.interview

import java.time.Instant

import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.action.ServletSupport
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View

import net.openurp.lixin.admission.base.model.Examinee
import net.openurp.lixin.admission.interview.model.{ Choice, Session }
import net.openurp.lixin.admission.web.MSSUSupport

/**
 * @author zhouqi 2018年2月2日
 *
 */
class ChoiceAction extends MSSUSupport with ServletSupport {

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

  private def getChoice(examinee: Examinee): Option[Choice] = {
    val choices = entityDao.findBy(classOf[Choice], "examinee", List(examinee))
    if (choices.isEmpty) None else Some(choices.head)
  }

  @mapping(value = "search", view = "list")
  def search(): View = {
    val examinees = getExaminee(get("code"), get("name"), get("idNumber"))
    if (examinees.isEmpty) {
      forward("error");
    } else {
      val examinee = examinees.head
      put("examinee", examinee)
      getChoice(examinee) match {
        case None =>
          val now = Instant.now()
          if (now.isBefore(examinee.batch.beginAt) || now.isAfter(examinee.batch.endAt.get)) {
            put("examinee", examinee)
            forward("error")
          } else {
            val builder2 = OqlBuilder.from(classOf[Session], "Session")
            builder2.where("Session.batch = :batch", examinee.batch)
            builder2.where("Session.major = :major", examinee.major)
            builder2.where("Session.selected < Session.maximum")
            builder2.where("Session.beginAt >= :now", Instant.now)
            builder2.orderBy("Session.beginAt");
            put("sessions", entityDao.search(builder2))
            forward("list")
          }
        case Some(choice) =>
          put("choice", choice)
          forward("info")
      }
    }
  }

  def save(): View = {
    val examinees = getExaminee(get("code"), get("name"), get("idNumber"))
    if (examinees.isEmpty) {
      return forward("error")
    }
    val examinee = examinees.head
    getChoice(examinee) match {
      case None =>
        val sessionId = getLong("sessionId").get
        val rs = entityDao.executeUpdate("update " + classOf[Session].getName +
          " set selected = selected +1 where selected < maximum and id = ?1 ", sessionId)
        var msg: String = "";
        if (rs > 0) {
          val choice = new Choice
          choice.examinee = examinee
          choice.session = entityDao.get(classOf[Session], sessionId)
          choice.updatedAt = Instant.now
          entityDao.saveOrUpdate(choice)
          msg = "signup.ok"
        } else {
          msg = "超过最大人数"
        }
        redirect("search", "&code=" + examinee.code + "&name=" + examinee.name + "&idNumber=" + examinee.idNumber, msg)
      case Some(choice) =>
        put("choice", choice)
        forward("info")
    }
  }
}