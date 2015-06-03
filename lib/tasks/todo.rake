require 'rake'

namespace :todo do
  desc "automatically deletes to-do items seven days after their creation"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now.utc - 7.days).destroy_all
  end
end
