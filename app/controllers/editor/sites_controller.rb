class Editor::SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all.page(params[:page]).per(params[:per_page])
    render :layout => 'base'
  end

  def show
    @pages = Page.all.where(site_id: @site.id)
    @tags  = Tag.all.where(site_id: @site.id)
  end

  # GET /sites/new
  def new
    @site = Site.new
    render :layout => 'base'
  end

  # GET /sites/1/edit
  def edit
    render :layout => 'base'
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to editor_sites_path, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        @errors = @site.errors
        format.html { render :new, :layout => 'base' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to edit_editor_site_path(@site), notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        @errors = @site.errors
        format.html { render :edit, :layout => 'base' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name)
    end
end
