class UploadsController < ApplicationController
  def index
  end
  def uploadFile
    binding.pry
    if params[:upload] == nil
      flash[:notice] = "Please select a file"
      redirect_to uploads_path
    else
      file = File.open(DataFile.save(params[:upload]))
      doc = Nokogiri::XML::Document.parse(file)
      file.close
      feed = DataFile.new(doc)
      feed.feed_data
      
      redirect_to root_path
    end
  end
end