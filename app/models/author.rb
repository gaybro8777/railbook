class Author < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books
  has_many :comments, -> { where(deleted: false) }, class_name: 'FanComment',
    foreign_key: 'author_no'

  has_many :memos, as: :memoable

  validate :file_invalid?

  def data=(data)
    self.ctype = data.content_type
    self.photo = data.read
  end

  private 
    def file_invalid?
      ps = ['image/jpeg', 'image/gif', 'image/png']
      errors.add(:photo, 'は画像ファイルではありません。') if !ps.include?(self.ctype)
      errors.add(:photo, 'のサイズが1MBを超えています。') if self.photo.length > 1.megabyte
    end
end