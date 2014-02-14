class SpeakersController < ApplicationController
 def index
 	@speakers = Speaker.all
 end

 def new
 	@speaker = Speaker.new
  if @speaker.save
   	file = params[:file]
   	file_content = File.open(file)
  end
 end
end