# frozen_string_literal: true

# Administrative post handling
class Admin::PostsController < AdminController
  include CreateAndModifyEntities
  include ListAndShowEntities
  include ToggleableEntity

  before_action :set_entity, except: %i[check create index new]

  private

  def component_class
    Biovision::Components::PostsComponent
  end
end
