class Book < ApplicationRecord
  # 型変換
  #attribute :price, :float

  scope :gihyo, -> { where(publish: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :whats_new, ->(pub) {
    where(publish: pub).order(published: :desc).limit(5)
  }

  has_many :reviews
  has_and_belongs_to_many :authors
  has_many :users, through: :reviews
  has_many :memos, as: :memoable

=begin
  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/ }
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }
  validates :price,
    numericality: { only_integer: true, less_than: 10000 }
  validates :publish,
    inclusion:{ in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム'] }
=end

=begin
  #uniqueness 検証 - 一意性検証
  validates :title, uniqueness: { scope: :publish },
  presence: true,
    length: { minimum: 1, maximum: 100 }
    validates :price,
    numericality: { only_integer: true, less_than: 10000 }
    validates :publish,
    inclusion:{ in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム'] }
=end

=begin
  #空白時に検証をスキップする
  validates :isbn,
    presence: true,
    uniqueness: { allow_blank: true },
    length: { is: 17 , allow_blank: true },
    format: { with: /¥A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}¥z/, allow_blank: true }
=end

=begin
  #エラーメッセージを日本語化
  validates :isbn,
    presence: { message: 'は必須です'},
    uniqueness: { allow_blank: true,
      message: '%{value}は一意でなければなりません' },
    length: { is: 17 , allow_blank: true,
      message: '%{value}は%{count}桁でなければなりません' },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/,
      allow_blank: true, message: '%{value}は正しい形式ではありません'}
=end


=begin
  #IsbnValidatorクラスによる検証
  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    isbn: true
=end


=begin
  #IsbnValidatorクラスによる検証（allow_oldパラメーター）
  validates :isbn,
    presence: true,
    uniqueness: true,
    isbn: { allow_old: true }
=end

  # プライベートメソッドによる検証
  # validate :isbn_valid?

  #コールバックメソッド
  #after_destroy :history_book

  # 条件付きでコールバックを適用
  # after_destroy :history_book,
  #   unless: Proc.new { |b| b.publish == "unknown" }

  # コールバックメソッドをブロック形式で定義
  # after_destroy do |b|
  #   logger.info('deleted: ' + b.inspect)
  # end

  # コールバッククラスとして定義
  # after_destroy BookCallbacks.new

  private
    def history_book
      logger.info('deleted: ' + self.inspect)
    end

    def isbn_valid?
      errors.add(:isbn, 'は正しい形式ではありません。')unless isbn =~ /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/
    end
end
