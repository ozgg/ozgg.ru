class Vision < ActiveRecord::Base
  validates_presence_of :title, :body

  def neighbours
    {
        prev: Vision.where("id < #{id}").order('id desc').first,
        next: Vision.where("id > #{id}").order('id asc').first,
    }
  end
end
