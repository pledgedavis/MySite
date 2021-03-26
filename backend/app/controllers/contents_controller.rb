class ContentsController < ApplicationController
  before_action :set_content, only: [ :show, :edit, :update, :destroy ]

  # GET /contents or /contents.json
  def index
    contents = Content.all
    render json: contents
  end

  # GET /contents/1 or /contents/1.json
  def show

  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents or /contents.json
  def create
    @content = Content.new(content_params)
    if @content.save
      render json: @content, status: :created, location: @content
     else
       render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
   if @content.update(content_params)
     render json: @content 
    else
     render json: @content.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:id, :name)
    end
end
