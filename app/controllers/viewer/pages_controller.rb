class Viewer::PagesController < ApplicationController
  def show
    @site = Site.find_by(name: params[:site_name])
    @page = Page.find_by(name: params[:page_name],
                         site_id: @site.id)
    @theme = 'simplex'
    render :text => @page.content, :layout => 'viewer_page'
  end
end
