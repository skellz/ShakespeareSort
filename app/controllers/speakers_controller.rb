class SpeakersController < ApplicationController
 def index
 	@speakers = Speaker.all
 end

 def new
 	@speaker = Speaker.new
 	file = params[:speaker][:play]
 	File.open()
 end
end