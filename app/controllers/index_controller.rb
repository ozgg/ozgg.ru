# frozen_string_literal: true

# Frontpage
class IndexController < ApplicationController
  # get /
  def index
    @collection = Post.page_for_visitors
  end
end
