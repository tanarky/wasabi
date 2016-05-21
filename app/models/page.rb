class Page < ActiveRecord::Base
  validates :site_id, presence: true
  validates :path, presence: true
  validates_uniqueness_of :path, :scope => :site_id
  belongs_to :site
end
