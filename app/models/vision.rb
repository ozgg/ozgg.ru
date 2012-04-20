class Vision < ActiveRecord::Base
  def neighbours
    {
        prev: Vision.where("id < #{id}").order('id desc').first,
        next: Vision.where("id > #{id}").order('id asc').first,
    }
  end
end
