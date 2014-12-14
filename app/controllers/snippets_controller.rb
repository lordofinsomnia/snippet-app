class SnippetsController < ApplicationController
  def index
  	@snippet  = Snippet.new
  	@snippets = Snippet.all
  end

  def create
    @snippet = Snippet.create(params[:snippet].permit(:filename, :content))
    redirect_to :back
  end

  def edit
  	@snippet = Snippet.find params[:id]
  end

  def update 	
  	snippet = Snippet.find params[:id]
  	logger.debug 'test1'  	
  	if snippet.update(params[:snippet].permit(:filename, :content))  	
  		redirect_to snippets_path, :notice => 'Your snippet has successfully been updated.'
  	else  		
  		redirect_to :back, :notice => 'There was an error updating your snippet.'
  	end
  end

  private
		def snippet_params
		  params.require(:filename, :content).permit(:filename, :content)
		end

end
