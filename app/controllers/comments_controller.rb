class CommentsController < ApplicationController
  before_action :set_project_item_comment, only: [:show, :edit, :update, :destroy]

  # GET /comment
  # GET /comment.json
  def index
    @comment = Comment.all
  end

  # GET /comment/1
  # GET /comment/1.json
  def show
  end

  # GET /comment/new
  def new
    @comment = Comment.new
  end

  # GET /comment/1/edit
  def edit
  end

  # POST /comment
  # POST /comment.json
  def create
    current_user ||=User.find(params[:comment][:user_id])
    comment = Comment.new
    comment.content = params[:comment][:content]
    comment.user_id = params[:comment][:user_id]
    comment.project = params[:comment][:project]

    if comment.save
      ps = PointSource.new
      ps.user_id = current_user.id
      ps.project_id = comment.project_item.project.id
      ps.source = "comment"
      ps.points = 3
      ps.save

      current_user.total_points = current_user.total_points + 3
      current_user.save
    end

    respond_to do |format|
      if comment.save
        format.html { redirect_to '/project/index', notice: 'Project item comment was successfully created.' }
        format.json { render :show, status: :created, location: comment }
      else
        format.html { render :new }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment/1
  # PATCH/PUT /comment/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Project item comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment/1
  # DELETE /comment/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comment_url, notice: 'Project item comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params[:comment]
    end
end
