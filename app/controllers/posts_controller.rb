# frozen_string_literal: true

# Post handling for visitors
class PostsController < ApplicationController
  # get /posts
  def index
    @collection = Post.page_for_visitors(current_page)
  end

  # get /posts/:id
  def show
    @entity = Post.find_by(id: params[:id].to_i)
    handle_http_404('Cannot find post') if @entity.nil?
  end

  private

  def component_class
    Biovision::Components::PostsComponent
  end
end
