class IndexController < ApplicationController
  skip_before_filter :authorize

  def home
    @posts = Post.order('id desc').limit(3)
  end

  def about
  end
end
