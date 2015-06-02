class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    7 - (DateTime.now.utc - created_at.to_date).to_i
  end
end


# i.created_at -= 3.days