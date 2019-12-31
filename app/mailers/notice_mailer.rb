class NoticeMailer < ApplicationMailer
   # layout 'mail'

  default from: 'webmaster@wings.msn.to',
          cc: 'CQW15204@nifty.com'
  def sendmail_confirm(user) 
    @user = user
    # 添付ファイル付きのメールを送信
    # attachments['wings.jpg'] = 
    #   File.read(Rails.root.join('tmp/data/wings.jpg'))

    # メールインラインでの添付ファイルを生成
    # attachments.inline['wings.jpg'] = 
    #   File.read(Rails.root.join('tmp/data/wings.jpg'))
    
     mail to: user.email, 
          subject: 'ユーザー登録ありがとうございました'

    # headers[:reply_to] = 'hoge@wings.msn.to'
    # headers({ reply_to: 'hoge@wings.msn.to',  cc: 'nami@wings.msn.to'})

    # メールの出力をカスタマイズ
    # @user = user
    # mail(to: user.email, 
    #     subject: 'ユーザー登録ありがとうございました') do |format|
    #   format.text { render inline: 'HTML対応クライアントで受信ください' }
    #   format.html
    # end

  end
end
