#encoding: utf-8
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "Title gets url-safe" do
    title_sample = '_-?Привет!Привет!!-_?'
    post = Post.new
    post.title = title_sample
    post.body = 'Я — проверочная запись'
    post.description = 'Проверочное описание'
    post.save

    assert_equal 'privet-privet', post.title_url
    assert_equal title_sample, post.title
  end
end
