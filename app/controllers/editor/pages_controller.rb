class Editor::PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout 'editor_site'

  def index
    @pages = Page.all
            .where(site_id: params[:site_id])
            .page(params[:page])
            .per(params[:per_page])
  end

  def show
  end

  def new
    @site = Site.find_by_id(params[:site_id])
    @page = Page.new
  end

  def edit
  end

  def create
    Rails.logger.info(page_params)
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to editor_site_pages_path(@page.site_id), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        @errors = @page.errors
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to edit_editor_site_page_path(@site.id, @page.id), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        @errors = @page.errors
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_page
    @page = Page.find(params[:id])
    @site = @page.site
  end
  def page_params
    params.require(:page).permit(:name, :title, :content, :site_id)
  end
end
