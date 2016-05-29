require "wasabi_site_scoop/engine"

module WasabiSiteScoop
  mattr_accessor :site_class
  mattr_accessor :page_class
  mattr_accessor :tag_class
  mattr_accessor :binary_class

  def self.site_class
    @@site_class.constantize
  end
  def self.page_class
    @@page_class.constantize
  end
  def self.tag_class
    @@tag_class.constantize
  end
  def self.binary_class
    @@binary_class.constantize
  end
end
