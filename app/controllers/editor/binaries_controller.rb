class Editor::BinariesController < ApplicationController
  #before_action :set_binary, only: [:show]
  layout 'editor_site'

  def index
    @site = Site.find_by_id(params[:site_id])
    @binaries = Binary.all
                .where(site_id: params[:site_id])
                .order('id desc')
                .page(params[:page])
                .per(params[:per_binary])
  end

  def new
    @site   = Site.find_by_id(params[:site_id])
    @binary = Binary.new
  end

  def show
    site = Site.find_by_id(params[:site_id])
    bin  = Binary.find_by(site_id: site.id, name: params[:name])
    if bin
      send_data bin.data, type: bin.content_type, :disposition => "inline"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def create
    upload_file = binary_params[:upload_file]
    bin  = {}
    name = ''
    allow_update = 'hoge'
    if upload_file != nil
      name = upload_file.original_filename.downcase.sub(/\.jpeg/, '.jpg')
      bin[:site_id]      = binary_params[:site_id]
      bin[:data]         = upload_file.read
      bin[:name]         = name
      bin[:content_type] = upload_file.content_type
    end
    if params[:allow_update][:binary] == 'true'
      old = Binary.find_by(:site_id => binary_params[:site_id], :name => name)
      if old != nil
        @binary = old
      else
        @binary = Binary.new(bin)
      end
    else
      @binary = Binary.new(bin)
    end
    respond_to do |format|
      if @binary.save
        format.html { redirect_to editor_site_binaries_path(@binary.site_id), notice: 'Upload success.' }
        format.json { render action: 'show', status: :created, location: @binary }
      else
        @site = Site.find_by_id(params[:site_id])
        @errors = @binary.errors
        format.html { render :new }
        format.json { render json: @binary.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_binary
      @binary = Binary.find(params[:id])
      @site = @binary.site
    end
    def binary_params
      params.require(:binary).permit(:upload_file, :site_id)
    end
end
