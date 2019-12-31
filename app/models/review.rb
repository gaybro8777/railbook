class Review < ApplicationRecord
  enum status: { draft:0, published:1, deleted:2 }
  #enum status: [:draft, :published, :deleted]

  belongs_to :book

  # キャッシュの依存性を設定
  #belongs_to :book, touch: true

  belongs_to :user

  # カウンターキャッシュを有効化
  belongs_to :user, counter_cache: true


  # 投稿日降順というデフォルトスコープ
  # default_scope { order(updated_at: :desc) }
end
