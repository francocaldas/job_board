class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:notice] = "Comment was created with success!"
        else
          flash[:alert] = "Please fill in all fields to create a comment."
        end
        redirect_to @job
      end
      format.js
        @comment.save
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.job, notice: "Comment destroyed with success."
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:name, :body, :job_id)
  end
end