class Contact < ActiveRecord::Base
  validates :name,:email,:description,:presence => true
end
