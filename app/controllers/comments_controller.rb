class CommentsController < ApplicationController
	def create
		@snippet = Snippet.find(params[:snippet_id])
    @comment = @snippet.comments.build(comment_params)       
    @comment.commenter = User.find(current_user).email
    if @comment.save    	
    	redirect_to @snippet, :notice => 'Your comment has successfully been added.'		
    else
    	redirect_to :back, :notice => 'There was a problem adding your comment .'
    end         
	end

	private

		def comment_params
	    params.require(:comment).permit(:commenter, :body)
	  end
end
