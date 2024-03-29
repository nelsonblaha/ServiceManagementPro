class Ticket < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :notes
  default_scope { order('updated_at DESC') }
  self.per_page = 7
end
