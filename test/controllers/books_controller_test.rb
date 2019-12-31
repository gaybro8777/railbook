require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  test "diff check" do
    assert_difference 'Book.count', 1 do
      post books_url,
        params: {
          book: {
            isbn: '978-4-7741-4223-0',
            title: 'Rubyポケットリファレンス',
            price: 3000,
            publish: '技術評論社'
          }
        }
    end
  end
end
