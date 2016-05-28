class Viewer::BinariesController < ApplicationController
  def show
    site = Site.find_by(name: params[:site_name])
    bin  = Binary.find_by(site_id: site.id, name: params[:binary_name])
    if bin
      send_data bin.data, type: bin.content_type, :disposition => "inline"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
