# coding: utf-8  
class UserMailer < BaseMailer  
  def welcome(user_id)
    @user = User.find_by_id(user_id)
    return false if @user.blank?
    mail(:to => @user.email, :subject => "#{t("mail.welcome_to")} #{Setting.app_name} #{t("mail.community")}")
  end
  
  class Preview < MailView
    # Pull data from existing fixtures
    def welcome
      ::UserMailer.welcome(User.last.id)
    end
  end
end
