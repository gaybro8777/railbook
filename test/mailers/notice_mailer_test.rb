require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_confirm" do
    user = User.find(6)
    mail = NoticeMailer.sendmail_confirm(user).deliver_now
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal "ユーザー登録ありがとうございました", mail.subject
    assert_equal "nami-piano@nifty.com", mail.to[0]
    assert_equal "webmaster@wings.msn.to", mail.from[0]
    assert_equal read_fixture('sendmail_confirm').join, mail.body.to_s
  end
end
