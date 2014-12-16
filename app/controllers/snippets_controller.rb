class SnippetsController < ApplicationController
  def index
  	@snippet  = Snippet.new
  	@snippets = Snippet.all
  end

  def create
    @snippet = Snippet.create(params[:snippet].permit(:filename, :content))
    uploaded_io = params[:file]        
    
    filename = Rails.root.join('files', 'uploads', uploaded_io.original_filename)
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)      
      @snippet.filename = uploaded_io.original_filename      
    end    
    File.open(filename, 'rb') do |file2|      
      @snippet.content = file2.read      
      File.delete(file2)      
    end  
    redirect_to :back, :notice => 'Your snippet has successfully been added.'
  end

  def edit
  	@snippet = Snippet.find params[:id]
  end

  def update 	
  	snippet       = Snippet.find params[:id] 
    uploaded_io   = params[:file]
    new_content   = String.new
    new_name      = String.new
    
    if uploaded_io  
      filename = Rails.root.join('files', 'uploads', uploaded_io.original_filename)
      File.open(filename, 'wb') do |file|
        file.write(uploaded_io.read)      
        #snippet.filename = uploaded_io.original_filename
        new_name = uploaded_io.original_filename
      end    
      File.open(filename, 'rb') do |file2|      
        new_content = file2.read      
        File.delete(file2)      
      end  
    else
      new_name     = :filename
      file_content = :content
    end

  	if snippet.update(params[:snippet].permit(new_name, new_content))  	    
  		redirect_to snippets_path, :notice => 'Your snippet has successfully been updated.'
  	else  		
  		redirect_to :back, :notice => 'There was an error updating your snippet.'
  	end
  end

  def destroy
  	Snippet.destroy params[:id]	
  	redirect_to :back, :notice => 'Your snippet has successfully been deleted.'
  end

  private
		def snippet_params
		  params.require(:filename, :content).permit(:filename, :content)
		end

end
