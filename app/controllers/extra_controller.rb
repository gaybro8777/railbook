class ExtraController < ApplicationController

  def sendmail
    user = User.find(6)
    @mail = NoticeMailer.sendmail_confirm(user).deliver_now
    #@mail = NoticeMailer.sendmail_confirm(user).deliver_later
    render plain: 'メールが正しく送信できました。'
  end

  def set_job
    user = User.find(6)
    SendmailJob.perform_later(user)
    #SendmailJob.perform_now(user)
    #SendmailJob.set(wait_until: Date.tomorrow.noon).perform_later(user)
    #SendmailJob.set(queue: :my_queue).perform_later(user)
    render plain: '正しく実行できました。'
  end

  def paging
    @books = Book.order('published DESC').
      paginate(page: params[:page], per_page: 5)
  end
end
