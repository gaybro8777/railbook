require 'test_helper'

class SendmailJobTest < ActiveJob::TestCase

  test "enqueue_jobs" do
    assert_enqueued_jobs 0
    SendmailJob.perform_later(User.find(1))
    SendmailJob.perform_later(User.find(2))
    assert_enqueued_jobs 2
  end

=begin
  test "enqueue_jobs_block" do
    assert_enqueued_jobs 2 do
    # assert_enqueued_jobs 2, only: SendmailJob do
      SendmailJob.perform_later(User.find(1))
      SendmailJob.perform_later(User.find(2))
    end
  end
=end  

  test "enqueue_jobs_with" do
    user = User.find(2)
    assert_enqueued_with(job: SendmailJob, args: [user],
      queue: 'default', at: Date.tomorrow.noon) do
      SendmailJob.set(wait_until: Date.tomorrow.noon).perform_later(user)
    end
  end
end
