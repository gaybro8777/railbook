require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railbook
  class Application < Rails::Application
    config.active_job.queue_adapter = :delayed_job
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.i18n.default_locale = :en
    # config.i18n.default_locale = :ja
    # config.i18n.default_locale = :de

    # コントローラー／モデル単位に辞書ファイルを用意する場合
    #config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    #config.i18n.default_locale = :ja

    #config.action_controller.include_all_helpers = false

    # queue_name_prefixパラメーターで接頭辞を宣言
    #config.active_job.queue_name_prefix = Rails.env
  end
end
