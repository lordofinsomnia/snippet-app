class SnippetsController < ApplicationController
  def index
  	@snippets = Snippet.all
  end

  def create
    @snippet = Snippet.create(params[:snippet].permit(:filename, :content))
    redirect_to :back
  end

  private
		def snippet_params
		  params.require(:filename, :content).permit(:filename, :content)
		end

end
