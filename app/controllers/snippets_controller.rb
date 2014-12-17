class SnippetsController < ApplicationController
  def index
  	@snippet  = Snippet.new
  	@snippets = Snippet.all
  end

  def create
    @snippet           = Snippet.create(params[:snippet].permit(:filename, :content))  
    @snippet.content   = find_file_content
    @snippet.filename  = find_filename    
    redirect_to @snippet, :notice => 'Your snippet has successfully been added.'
  end

  def edit
  	@snippet = Snippet.find params[:id]
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def update 	
  	snippet       = Snippet.find params[:id]     
    new_content   = find_file_content
    new_name      = find_filename

  	if snippet.update(params[:snippet].permit(new_name, new_content))  	    
  		redirect_to snippet, :notice => 'Your snippet has successfully been updated.'
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

    def find_file_content      
      new_content   = String.new      
      uploaded_io   = params[:file]
      if uploaded_io  
        filename = Rails.root.join('files', 'uploads', uploaded_io.original_filename)        
        File.open(filename, 'wb') do |file|
          file.write(uploaded_io.read)
        end
        File.open(filename, 'rb') do |file2|          
          new_content = file2.read      
          File.delete(file2)      
        end  
      else        
        new_content = :content
      end
      return new_content
    end

    def find_filename      
      new_name      = String.new
      uploaded_io   = params[:file]
      if uploaded_io  
        filename = Rails.root.join('files', 'uploads', uploaded_io.original_filename)
        File.open(filename, 'wb') do |file|
          file.write(uploaded_io.read)
          new_name = uploaded_io.original_filename
          File.delete(file)
        end            
      else
        new_name     = :filename        
      end
      return new_name
    end

end
