module ParseXML
  def parse_xml
    file = File.open(Rails.root.join("spec/support/caesar_test.xml"))
    doc = Nokogiri::XML::Document.parse(file)
    file.close

    feed = DataFile.new(doc)
    feed.feed_data
  end
end