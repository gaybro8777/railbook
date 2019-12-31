xml.books do
  @books.each do |b|
    xml.book(isbn: b.isbn) do
      xml.title(b.title)
      xml.price(b.price)
      xml.publish(b.publish)
      xml.published(b.published)
      xml.dl(b.dl)
    end
  end
end
