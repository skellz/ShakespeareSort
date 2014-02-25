require 'spec_helper'

feature 'User views play data in a table', %q{
  As a user 
  I want to view a table of play info
  So I can easily view characters, lines and scene info
} do

  scenario 'user clicks column headers' do 
    parse_xml
    visit root_path

    within_table('speakers') do
      find('tr:nth-child(1) td:nth-child(1)').text.should include('Flavius')
      find('tr:nth-child(2) td:nth-child(3)').text.should include('6')
      find('tr:nth-child(3) td:nth-child(5)').text.should include('100')
    end
  end
end