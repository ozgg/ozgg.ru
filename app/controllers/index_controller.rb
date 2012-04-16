class IndexController < ApplicationController
  def home
    @posts = Post.order(:id => :desc).limit(3)
  end

  def about
  end
end
