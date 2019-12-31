json.extract! book, :id, :isbn, :title, :price, :publish, :published, :dl, :created_at, :updated_at

# 入れ子のキーを生成
# a = book.authors[0]
# json.author do
#   json.name a.name
#   json.birth a.birth
# end

# 個別に書き替えた場合
# json.isbn book.isbn
# json.title book.title
# json.price book.price
# json.publish book.publish
# json.published book.published
# json.dl book.dl
# json.created_at book.created_at
# json.updated_at book.updated_at

#省略形
#json.(book, :isbn, :title, :price, :publish, :published, :dl, :created_at, :updated_at)

json.url book_url(book, format: :json)
