#require 'time_constraint'

Rails.application.routes.draw do

  resources :members
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books

  # 第7章
  #resource :config

  # resources :books, constraints: { id: /[0-9]{1,2}/ }

  # constraints(id: /[0-9]{1,2}/) do
  #   resources :books
  #   resources :reviews
  # end

  # resources :books, constraints: TimeConstraint.new
  # resources :books, format: false

  # resources :users, controller: :members
  # resources :reviews, as: :comments

  # namespace :admin do
  #   resources :books
  # end

  # scope module: :admin do
  #   resources :books
  # end

  # scope :admin do
  #   resources :books
  # end

  # scope ':locale' do
  #   resources :books
  # end

  # resources :reviews do
  #   collection do
  #     get :unapproval
  #   end
  #   member do
  #     get :draft
  #   end
  # end

  # resources :reviews do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :users, except: [ :show, :destroy ]
  # resources :users, only: [ :index, :new, :create, :edit, :update ]
  # resources :reviews, path_names:  { new: :insert, edit: :revise }

  # resources :books do
  #   resources :reviews
  # end

  # resources :books do
  #   resources :reviews, shallow: true
  # end

  # resources :books do
  #   resources :reviews, only: [ :index, :new, :create ]
  # end
  # resources :reviews, except: [ :index, :new, :create ]

  # scope shallow_path: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # scope shallow_prefix: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # concern :additional do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :reviews, concerns: :additional
  # resources :users, concerns: :additional

  # match '/details(/:id)' => 'hello#index', via: [ :get, :post ]
  # get '/details(/:id)' => 'hello#index'
  # post '/details(/:id)' => 'hello#index'
  
  # get 'hello/view'
  # get 'hello/view' => 'hello#view'
  # get '/articles(/:category)' => 'articles#index', defaults: { category: 'general', format: 'xml' }
  # get 'blogs/:user_id' => 'blogs#index', constraints: { user_id: /[A-Za-z0-9]{3,7}/ }
  # get '/blogs/:user_id' => 'common/blogs#list'
  # get 'articles' => 'main#index', as: :top
  # get 'articles/*category/:id' => 'articles#category'
  # get '/books/:id' => redirect('/articles/%{id}')
  # get '/books/:id' => redirect {|p, req| "/articles/#{p[:id].to_i + 10000}" }

  # root to: 'books#index'


  # 第2章
  get 'hello/index', to: 'hello#index'
  get 'hoge/piyo', to: 'hello#index'
  get 'hello/index'
  get 'hello/view'
  get 'hello/nothing'
  get 'hello/app_var'
  get 'hello/list'

  # 第4章
  get 'view/keyword'
  post 'keyword/search'
  get 'view/form_tag'
  post 'view/create'
  get 'view/form_for'
  get 'view/field'
  get 'view/html5'
  get 'view/select'
  get 'view/col_select'
  get 'view/group_select'
  get 'view/select_tag'
  get 'view/select_tag2'
  get 'view/col_select2'
  get 'view/group_select2'
  get 'view/dat_select'
  get 'view/col_radio'
  get 'view/fields'
  get 'view/simple_format'
  get 'view/truncate'
  get 'view/excerpt'
  get 'view/highlight'
  get 'view/conc'
  get 'view/sanitize'
  get 'view/format'
  get 'view/number_to'
  get 'view/datetime'
  get 'view/link'
  get 'view/urlfor'
  get 'view/new'
  get 'members/login'
  get 'view/linkif'
  get 'login/info'
  get 'view/current'
  get 'view/detail'
  get 'view/mailto'
  get 'view/image_tag'
  get 'view/audio'
  get 'view/video'
  get 'view/path'
  get 'view/capture'
  get 'view/tag'
  get 'view/content_tag'
  get 'view/helper'
  get 'view/helper2'
  get 'view/helper3'
  get 'view/adopt'
  get 'view/provide'
  get 'view/multi'
  get 'view/relation'
  get 'view/download'
  get 'view/quest'
  get 'view/nest'
  get 'view/partial_basic'
  get 'view/partial_param'
  get 'view/partial_col'
  get 'view/partial_spacer'

  # 第5章
  get 'record/find'
  get 'record/find_by'
  get 'record/find_by2'
  get 'record/where'
  get 'record/keyword'
  post 'record/ph1'
  get 'record/not(/:id)' => 'record#not'
  get 'record/where_or'
  get 'record/order'
  get 'record/reorder'
  get 'record/select'
  get 'record/select2'
  get 'record/offset'
  get 'record/page(/:id)' => 'record#page'
  get 'record/last'
  get 'record/groupby'
  get 'record/havingby'
  get 'record/where2'
  get 'record/unscope'
  get 'record/unscope2'
  get 'record/none(/:id)' => 'record#none'
  get 'record/pluck'
  get 'record/exists'
  get 'record/scope'
  get 'record/scope2'
  get 'record/def_scope'
  get 'record/count'
  get 'record/average'
  get 'record/groupby2'
  get 'record/literal_sql'
  get 'record/update_all'
  get 'record/update_all2'
  get 'record/destroy_all'
  get 'record/transact'
  get 'record/enum_rec'
  get 'record/keywd'
  post 'record/keywd_process'
  get 'record/belongs'
  get 'record/hasmany'
  get 'record/hasone'
  get 'record/has_and_belongs'
  get 'record/has_many_through'
  get 'record/cache_counter'
  get 'record/memorize'
  get 'record/assoc_join'
  get 'record/assoc_join2'
  get 'record/assoc_join3'
  get 'record/assoc_join4'
  get 'record/assoc_includes'
  get 'record/attr'

  # 第6章
  get 'ctrl/para(/:id)' => 'ctrl#para'
  get 'ctrl/para_array'
  get 'ctrl/req_head'
  get 'ctrl/req_head2'
  get 'ctrl/upload'
  post 'ctrl/upload_process'
  get 'ctrl/updb(/:id)' => 'ctrl#updb'
  patch 'ctrl/updb_process(/:id)' => 'ctrl#updb_process'
  get 'ctrl/double_render'
  get 'ctrl/show_photo(/:id)' => 'ctrl#show_photo'
  get 'ctrl/log'
  get 'ctrl/get_xml'
  get 'ctrl/get_json'
  get 'ctrl/download'
  get 'ctrl/cookie'
  post 'ctrl/cookie_rec'
  get 'ctrl/session_show'
  post 'ctrl/session_rec'
  get 'ctrl/index'
  get 'ctrl/index2'
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get 'sample/index'
  get 'ctrl/device'

  # 第9章
  get 'ajax/index'
  get 'ajax/upanel'
  get 'ajax/search'
  post 'ajax/result'
  get 'ajax/slideshow'
  get 'ajax/keywd'
  post 'ajax/search_slide'

  # 第10章
  get 'extra/sendmail'
  get 'extra/f_cache'
  get 'extra/share1'
  get 'extra/share2'
  get 'extra/model'
  get 'extra/model2'
  get 'extra/trans'
  get 'extra/paging'
  get 'extra/set_job'
  get 'ctrl/trans'

  # ルートパラメータ経由でロケールを変更
  # scope "(:locale)", locale: /ja|en|de/ do
  #   resources :books    
  #   get 'extra/trans'   
  # end

   #match '/:locale' => 'books#index', via: [ :get ]
   #get '/:locale' => 'books#index'
   #root to: 'books#index'

end
