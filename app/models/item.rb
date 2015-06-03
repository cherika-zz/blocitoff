require 'rake'

class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    7 - (DateTime.now.utc - created_at.to_date).to_i
  end

  # def self.run_rake(delete_items)
  #   load File.join(Rails.root, 'lib', 'tasks', 'todo.rake')
  #   Rake::Task[todo:delete_items].invoke
  # end
end


# i.created_at -= 3.days