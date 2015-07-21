class ProjectItemCommentController < ApplicationController
  before_action :set_project_item_comment, only: [:show, :edit, :update, :destroy]

  # GET /project_item_comments
  # GET /project_item_comments.json
  def index
    @project_item_comments = ProjectItemComment.all
  end

  # GET /project_item_comments/1
  # GET /project_item_comments/1.json
  def show
  end

  # GET /project_item_comments/new
  def new
    @project_item_comment = ProjectItemComment.new
  end

  # GET /project_item_comments/1/edit
  def edit
  end

  # POST /project_item_comments
  # POST /project_item_comments.json
  def create
    current_user ||=User.find(params[:project_item_comment][:user_id])
    project_item_comment = ProjectItemComment.new
    project_item_comment.content = params[:project_item_comment][:content]
    project_item_comment.user_id = params[:project_item_comment][:user_id]
    project_item_comment.project_item_id = params[:project_item_comment][:project_item_id]

    if project_item_comment.save
      ps = PointSource.new
      ps.user_id = current_user.id
      ps.project_id = project_item_comment.project_item.project.id
      ps.source = "comment"
      ps.points = 3
      ps.save

      current_user.total_points += 3
      current_user.save
    end

    respond_to do |format|
      if project_item_comment.save
        format.html { redirect_to '/project/index', notice: 'Project item comment was successfully created.' }
        format.json { render :show, status: :created, location: project_item_comment }
      else
        format.html { render :new }
        format.json { render json: project_item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_item_comments/1
  # PATCH/PUT /project_item_comments/1.json
  def update
    respond_to do |format|
      if @project_item_comment.update(project_item_comment_params)
        format.html { redirect_to @project_item_comment, notice: 'Project item comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item_comment }
      else
        format.html { render :edit }
        format.json { render json: @project_item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_item_comments/1
  # DELETE /project_item_comments/1.json
  def destroy
    @project_item_comment.destroy
    respond_to do |format|
      format.html { redirect_to project_item_comments_url, notice: 'Project item comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_item_comment
      @project_item_comment = ProjectItemComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_item_comment_params
      params[:project_item_comment]
    end
end
