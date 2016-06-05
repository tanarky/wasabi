module WasabiSiteScoop
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def show
      site = WasabiSiteScoop.site_class.find_by(name: 'scoop')
      render :text => "hello, #{site.name}. ID = #{site.id}"
    end
  end
end
