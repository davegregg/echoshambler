class Grunt < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates  :body, presence: true,
                    allow_blank: false,
                    length: {maximum: 160}

  def self.chamber(user)
    creeping_ids = user.creepees(User)
                       .pluck(:id)
    all_ids = creeping_ids << user.id
    Grunt.where(user_id: all_ids)
         .order('created_at DESC')
  end
end
