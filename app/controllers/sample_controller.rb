class SampleController < ApplicationController
  include FormAuth
  def index
    render plain: 'こんにちは、世界！'
  end
end
