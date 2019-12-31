class CtrlController < ApplicationController

  # before／afterフィルターの登録
  # before_action :start_logger
  # after_action :end_logger

  # aroundフィルターの登録
  # around_action :around_logger

  # フィルターの適用範囲を制限
  # before_action :start_logger, only: [:index, :index2]
  # after_action :end_logger, except: :index

  # before_action :my_logging

  # my_loggingフィルターを除外
  # skip_before_action :my_logging

  # indexアクションでのみmy_loggingフィルターを除外
  # skip_before_action :my_logging, only: :index

  # 認証フィルターを登録
  # before_action :auth, only: :index

  def para
    render plain: 'idパラメータ：' + params[:id]
  end

  def para_array
    render plain: 'categoryパラメータ：' + params[:category].inspect
  end

  def req_head
    render plain: request.headers['User-Agent']
  end

  def req_head2
    @headers = request.headers
  end


  def upload_process
    file = params[:upfile]
    name = file.original_filename 
    perms = ['.jpg', '.jpeg', '.gif', '.png']
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのは画像ファイルのみです。'
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは1MBまでです。'
    else 
      File.open("public/docs/#{name}", 'wb') { |f| f.write(file.read) }
      result = "#{name}をアップロードしました。"
    end
    render plain: result
  end

  def updb
    @author = Author.find(params[:id])
  end

  def updb_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:data))
      render plain: '保存に成功しました。'
    else
      render plain: @author.errors.full_messages[0]
    end
  end

  def double_render
    @book = Book.find(6)
    if @book.reviews.empty?
      # render 'simple_info' 
      render 'simple_info' and return
    end
    render 'details_info'
  end

  def plain_render
    # render plain: '<div style="color: Red;">今日は良い天気ですね。</div>'
    # render html: '<div style="color: Red;">今日は良い天気ですね。</div>'.html_safe
    render inline: 'リクエスト情報：<%= debug request.headers %>'
  end

  def head_sample
    #head 404
    #head :not_found
    render plain: 'ファイルが見つかりませんでした。', status: :not_found
  end

  def redirect
    #redirect_to 'http://www.wings.msn.to'
    #redirect_to action: :index
    #redirect_to controller: :hello, action: :list
    #redirect_to books_path
    redirect_back fallback_location: { controller: 'hello', action: 'index' }
  end

  def file_send
    #send_file 'c:/data/sample.zip'
    #send_file 'c:/data/RIMG1125.jpg', type: 'image/jpeg', disposition: :inline
    send_file 'c:/data/doc931455.pdf', filename: 'Guideline.pdf'
  end 

  def show_photo
    id = params[:id] ? params[:id] : 1
    @author = Author.find(id)
    send_data @author.photo, type: @author.ctype, disposition: :inline
  end

  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render plain: 'ログはコンソール、またはログファイルから確認ください。'
  end

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def get_json
    @books = Book.all
    render json: @books
  end

  def download
    @books = Book.all
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email],
      expires: 3.months.from_now, http_only: true }
    
    #cookies[:email] = params[:email]

    render plain: 'クッキーを保存しました。'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render plain: 'セッションを保存しました。'
  end


  def index
    sleep 3
    render plain: 'indexアクションが実行されました。'
  end

  def index2
    sleep 3
    render plain: 'index2アクションが実行されました。'
  end

  private
    def start_logger
      logger.debug('[Start] ' + Time.now.to_s)
    end

    def end_logger
      logger.debug('[Finish] ' + Time.now.to_s)
    end

    def around_logger
      logger.debug('[Start] ' + Time.now.to_s)
      yield
      logger.debug('[Finish] ' + Time.now.to_s)
    end

    def my_logging
          logger.debug('[MyLog] ' + Time.now.to_s)
    end

    def auth
      name = 'yyamada'
      passwd = '8cb2237d0679ca88db6464eac60da96345513964'
      authenticate_or_request_with_http_basic('Railsbook') do |n, p|
        n == name &&
          Digest::SHA1.hexdigest(p) == passwd
      end
    end

    # def auth
    #   members = { 'yyamada' => '47449ae3e102927e4fab12a5549ed5d7' }
    #   authenticate_or_request_with_http_digest('railbook') do |name|
    #     members[name]
    #   end
    # end

end
