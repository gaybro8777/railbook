require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "book save" do
    book = Book.new({
      isbn: '978-4-7741-4466-X',
      title: 'Ruby on Rails本格入門',
      price: 3100,
      publish: '技術評論社',
      published: '2017-02-14',
      dl: false
    })
    assert book.save, 'Failed to save'
  end

=begin
  test "book validate" do
    book = Book.new({
      isbn: '978-4-7741-44',
      title: 'Ruby on Rails本格入門',
      price: 3100,
      publish: '技術評論社',
      published: '2017-02-14',
      dl: false
    })
    
    assert !book.save, 'Failed to validate'
    assert_equal book.errors.size, 2, 'Failed to validate count'
    assert book.errors[:isbn].any?, 'Failed to isbn validate'
  end
=end 

=begin
  test "where method test" do
    result = Book.find_by(title: '改訂新版JavaScript本格入門')
    assert_instance_of Book, result ,'result is not instance of Book'
    assert_equal books(:modernjs).isbn, result.isbn, 'isbn column is wrong.'
    assert_equal Date.new(2016, 9, 30), result.published,
      'published column is wrong.'
  end
=end
  
=begin
   def setup
     @b = books(:modernjs)
   end

   def teardown
     @b = nil
   end

  test "where method test" do
    result = Book.find_by(title: '改訂新版JavaScript本格入門')
    assert_instance_of Book, result ,'result is not instance of Book'
    assert_equal @b.isbn, result.isbn, 'isbn column is wrong.'
    assert_equal @b.published, result.published, 'published column is wrong.'
  end
=end

end
