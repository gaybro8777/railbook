class SendmailJob < ApplicationJob
  queue_as :default

  # キュー名を変更
  # queue_as do
  #   if Rails.env.production?
  #     :default
  #   else
  #     :dev
  #   end
  # end

  # ログを出力する例
  before_enqueue do |job|
    logger.info('before_enqueue' +  job.inspect)
  end
 
  after_enqueue do |job|
    logger.info('after_enqueue' +  job.inspect)
  end

  around_perform do |job, block|
    logger.info('before_perform' +  job.inspect)
    block.call
    logger.info('after_perform' +  job.inspect)
  end

  def perform(user)
    NoticeMailer.sendmail_confirm(user).deliver_now
  end
end
