class Site < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :tags
  has_many :pages
  has_many :binaries
end
