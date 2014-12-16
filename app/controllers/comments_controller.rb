class CommentsController < ApplicationController
	def create
		@snippet = Snippet.find(params[:snippet_id])
    @comment = @snippet.comments.create(comment_params)
    @comment.save
    redirect_to article_path(@snippet)		
	end

	def show
		@snippet = Snippet.find(params[:snippet_id])
    @comment = @snippet.comments.create(comment_params)    
    #redirect_to article_path(@article)		
	end

	private

		def comment_params
	    params.require(:comment).permit(:commenter, :body)
	  end
end
