class CommentsController < ApplicationController
  def create
    @movier = Movier.find(params[:movier_id])
    @comment = @movier.comments.create(params[:comment].permit(:body))
    @comment.save
    if
      @comment.save
      redirect_to movier_path(@movier)
    else
      render 'new'
    end
  end
  def edit
    @movier = Movier.find(params[:movier_id])
    @comment = @movier.comments.find(params[:id])
  end

  def update
    @movier = Movier.find(params[:movier_id])
    @comment = @movier.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:comment))
      redirect_to movier_path(@movier)
    else
      render 'edit'
    end
  end
  def destroy
    @movier = Movier.find(params[:movier_id])
    @comment = @movier.comments.find(params[:id])
    @comment.destroy
    redirect_to movier_path(@movier)
  end
end
