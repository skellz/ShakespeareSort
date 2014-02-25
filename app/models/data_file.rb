class DataFile < ActiveRecord::Base
  def initialize(doc)
    @scenes = doc.xpath('//SCENE')
    @speaker = doc.xpath('//SPEAKER')
  end

  def self.save(upload)
    name = upload['datafile'].original_filename
    directory = "public/data"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    path
  end

  def feed_data
    @scenes.each do |scene|
      title = scene.search('TITLE').text
      scene_obj = Scene.find_or_create_by(title: title)
      scene.search('SPEECH').each do |speech|
        speaker = speech.search('SPEAKER').text
        speaker_obj = Speaker.find_or_create_by(name: speaker)
        speech_obj = scene_obj.speeches.create(speaker_id: speaker_obj.id)
        speech.search('LINE').each do |l|
          Line.create(speech_id: speech_obj.id, line: l.text)
        end
      end
    end
  end
end