class Editor::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  layout 'editor_site'

  def index
    @site = Site.find_by_id(params[:site_id])
    @tags = Tag.all
            .where(site_id: params[:site_id])
            .page(params[:page])
            .per(params[:per_page])
  end

  def show
  end

  def new
    @site = Site.find_by_id(params[:site_id])
    @tag  = Tag.new
  end

  def edit
  end

  def create
    @site = Site.find_by_id(params[:site_id])
    Rails.logger.info(tag_params)
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to editor_site_tags_path(@tag.site_id), notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        @errors = @tag.errors
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to edit_editor_tag_path(@tag), notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        @errors = @tag.errors
        format.html {render :edit}
        format.json {render json: @tag.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def set_tag
    @site = Site.find_by_id(params[:site_id])
    #@tag  = Tag.find_by_id(params[:id])
    @tag  = Tag.find_by(site_id: @site.id, id: params[:id])
  end
  def tag_params
    params.require(:tag).permit(:name, :site_id)
  end
end
