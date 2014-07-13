class TaskMailer < ActionMailer::Base
  default from: "servicemanagementpro@robertlavery.com"
  def notify(task)
    @user = task.user.netid
    @ticket = task.ticket.id
    @notification = task.notification
    mail(to: "neo.homsar@gmail.com", subject: "You got mail!")
  end
end
