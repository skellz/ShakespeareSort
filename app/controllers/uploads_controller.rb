class UploadsController < ApplicationController
  def index
  end
  def uploadFile
    file = File.open(DataFile.save(params[:upload]))
    doc = Nokogiri::XML::Document.parse(file)
    file.close
    feed = DataFile.new(doc)
    feed.feed_data
    
    redirect_to root_path
  end
end