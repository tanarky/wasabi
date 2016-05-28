class Page < ActiveRecord::Base
  validates :site_id, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, :scope => :site_id
  belongs_to :site
end
