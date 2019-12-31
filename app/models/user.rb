class User < ApplicationRecord
  has_secure_password
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews

   validates :agreement, acceptance: true
  # validates :agreement, acceptance:{ on: :create }

  validates :email, confirmation: true

  #dm欄にチェックした場合にのみ、メールアドレスを必須

  #ifオプションの場合
  #  validates :email, presence: { if: '!dm.blank?' }

=begin
  # シンボルで指定した場合
  validates :email, presence: { unless: :sendmail? }

  def sendmail?
    dm.blank?
  end
=end  

=begin
  # Procオブジェクトで指定した場合
  validates :email,
  presence: { unless: Proc.new { |u| u.dm.blank? } }
=end

=begin
  #dm欄にチェックした場合にのみ、メールアドレス／ロール欄を必須
  with_options unless: 'dm.blank?' do |dm|
    dm.validates :email, presence: true
    dm.validates :roles, presence: true
  end
=end

end
