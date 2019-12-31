class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    #before_action :check_logined
    before_action :detect_device

    # ロケールを動的に変更
    # before_action :detect_locale

    # rescue_from ActiveRecord::RecordNotFound, with: :id_invalid

    # info キーを登録
    # add_flash_types :info

    # 現在のロケール設定でlocaleオプションをデフォルト設定
    # def default_url_options(options = {})
    #   { locale: I18n.locale }
    # end

    private
      def detect_device
        case params[:type]
          when 'mobile'
            request.variant = :mobile
          when 'tablet'
          request.variant = :tablet
      end
        
      def check_logined
        if session[:usr] then
          begin
            @usr = User.find(session[:usr])
          rescue ActiveRecord::RecordNotFound
            reset_session
          end
        end
        unless @usr
          flash[:referer] = request.fullpath
          redirect_to controller: :login, action: :index
        end
      end

      def id_invalid(e)
        render 'shared/record_not_found', status: 404
      end

      def detect_locale
        # ブラウザの言語設定に応じてロケールを変更
        # I18n.locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first

        # クエリ情報によってロケールを変更
        I18n.locale = params[:locale]
      end
    end
end
